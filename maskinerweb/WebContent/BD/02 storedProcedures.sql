USE mskbd;

DELIMITER $$

CREATE PROCEDURE pr_validarusuario
(
 IN vusername varchar(25),
 IN vpassword varchar(25)
)
BEGIN
  	SELECT cod_usr, dni_usr, ape_pat_usr, ape_mat_usr, nom_usr, dom_usr, tel_usr, cargo_usr, username, password, est_usr
	FROM usuario
	WHERE username = vusername and password = vpassword;

END $$

CREATE PROCEDURE pr_obtenerRolesUsuario
(
 IN vcod_usr char(5)
)
BEGIN
  	SELECT r.cod_rol, r.desc_rol
	FROM rol r inner join rol_x_usuario ru
	ON r.cod_rol = ru.cod_rol
	WHERE ru.cod_usr = vcod_usr;

END $$

CREATE FUNCTION fn_obtenerDescripcionIncidente (numIncidente char(6)) RETURNS varchar(300)
BEGIN
DECLARE detalle VARCHAR(1000) DEFAULT '';
DECLARE averia VARCHAR(300);
DECLARE done INT DEFAULT 0;
DECLARE registros CURSOR FOR select desc_aver from maquinariasucursal_x_incidente where num_inc = numIncidente;
DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
OPEN registros;
FETCH registros INTO detalle;
REPEAT
    FETCH registros INTO averia;
    IF NOT done THEN
      set detalle = concat(detalle,', ', averia);
    END IF;
UNTIL done END REPEAT;
CLOSE registros;
RETURN detalle;
END $$

CREATE PROCEDURE pr_buscarIncidentesPendientes
(
 IN vnom_empr varchar(150),
 IN vfec_inc  date,
 IN vdesc_aver varchar(300)
)
BEGIN
	select i.num_inc,
         i.fec_inc,
         i.cod_reg,
         i.cod_cli,
         i.num_suc,
         tt.desc_tab distr,
         s.dir_suc,
         i.dat_cli_no_reg,
         i.est_inc,
         c.raz_soc_cli,
         fn_obtenerDescripcionIncidente(i.num_inc) desc_inc
	from incidente i inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
	where est_inc=1 and
      c.raz_soc_cli like concat('%', vnom_empr,'%') and
      DATE_FORMAT(i.fec_inc,GET_FORMAT(DATE,'ISO')) like concat('%', IFNULL(vfec_inc,''), '%') and
      fn_obtenerDescripcionIncidente(i.num_inc) like concat('%', vdesc_aver,'%');

END $$

CREATE PROCEDURE pr_obtenerIncidentePendiente
(
 IN vnum_inc char(6)
)
BEGIN
	select i.num_inc,
         i.fec_inc,
         i.cod_reg,
         i.cod_cli,
         i.num_suc,
         tt.desc_tab distr,
         s.dir_suc,
         i.dat_cli_no_reg,
         i.est_inc,
         c.raz_soc_cli,
         fn_obtenerDescripcionIncidente(i.num_inc) desc_inc
	from incidente i inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
	where i.est_inc=1 and i.num_inc = vnum_inc;
END $$

CREATE PROCEDURE pr_obtenerMaquinariaSucursalXIncidentePendiente
(
 IN vnum_inc char(6)
)
BEGIN
  select
    msi.*,
    m.cod_maq,
    m.desc_maq,
    tt1.desc_tab mar_maq,
    m.mod_maq,
    tt.desc_tab desc_natur_aver
  from
    maquinariasucursal_x_incidente msi inner join tabladetablas tt
    on tt.cod_tab=10 and msi.natur_aver = tt.cod_item_tab
    inner join maquinariasucursal ms on msi.num_tar=ms.num_tar
    inner join maquinaria m on ms.cod_maq = m.cod_maq
    inner join tabladetablas tt1 on tt1.cod_tab=18 and m.mar_maq=tt1.cod_item_tab
  where msi.num_inc = vnum_inc;
  
END $$

CREATE PROCEDURE pr_llenarDisponibilidadTecnicos
(
 IN vaño int
)
BEGIN
  DECLARE vdia DATE;
  DECLARE done INT DEFAULT 0;
  DECLARE vcod_tco CHAR(5);
  DECLARE vhora TIME;
  DECLARE curTecnicos CURSOR FOR SELECT cod_tco FROM tecnico;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

  START TRANSACTION;

  OPEN curTecnicos;
  FETCH curTecnicos INTO vcod_tco;
  REPEAT
    SET vdia = CONVERT(CONCAT(CONVERT(vaño,CHAR(4)),'-01-01'),DATE);
    WHILE YEAR(vdia)=vaño DO
      SET vhora = '07:00';
      WHILE vhora <= CAST('17:30' AS TIME) DO
        IF NOT EXISTS (SELECT * FROM disponibilidadtecnicos WHERE cod_tco = vcod_tco AND fecha = vdia AND hor = vhora) THEN
          INSERT INTO disponibilidadtecnicos VALUES (vcod_tco, vdia, vhora, 1);
        END IF;
        SET vhora = ADDTIME(vhora,'0:30');
      END WHILE;
      SET vdia = ADDDATE(vdia, INTERVAL 1 DAY);
    END WHILE;
    FETCH curTecnicos INTO vcod_tco;
  UNTIL done END REPEAT;
  CLOSE curTecnicos;
  COMMIT;

END $$

CREATE PROCEDURE pr_nuevoNumeroOrdenTrabajo()
BEGIN
	select CONCAT('OT', RIGHT(CONCAT('0000', IFNULL(MAX(RIGHT(num_ord_trab,4)),0)+1),4)) from ordentrabajo;
END $$

CREATE PROCEDURE pr_nuevaOrdenTrabajo
(
  IN v_num_ord_trab char(6),
  IN v_fec_ord_trab date,
  IN v_cod_reg      char(5),
  IN v_num_inc      char(6),
  IN v_num_tar      char(6),
  IN v_itm_aver     int
)
BEGIN

  declare v_cant_ord_trab int;
  declare v_cant_averias int;


  -- insertar una nueva orden de trabajo y lo establece a estado Pendiente (1)
  insert into ordentrabajo (num_ord_trab, fec_ord_trab, cod_reg, num_inc, num_tar, itm_aver, est_ord_trab)
  values (v_num_ord_trab, v_fec_ord_trab, v_cod_reg, v_num_inc, v_num_tar, v_itm_aver, 1);

  -- actualizamos el estado de la avería en la tabla maquinariasucursal_x_incidente a Por reparar (3)
  update maquinariasucursal_x_incidente set est_aver = 3 where num_inc = v_num_inc and num_tar = v_num_tar and itm_aver = v_itm_aver;


  -- si es la última orden de trabajo generada del incidente, establecer el valor del incidente a atendido (4)

  set v_cant_ord_trab = (select count(*) from ordentrabajo where num_inc = v_num_inc);
  set v_cant_averias  = (select count(*) FROM maquinariasucursal_x_incidente where num_inc = v_num_inc);

  if v_cant_ord_trab = v_cant_averias then
    update incidente set est_inc = 4 where num_inc = v_num_inc;
  end if;

END $$

CREATE PROCEDURE pr_insertarPaqueteXOT (
  IN v_cod_paq      char(6),
  IN v_num_ord_trab char(6),
  IN v_fec_eje_ot   date,
  IN v_hor_ini      time,
  IN v_hor_fin      time
)
BEGIN

  insert into paquete_x_ot (cod_paq, num_ord_trab, fec_eje_ot, hor_ini, hor_fin)
  values (v_cod_paq, v_num_ord_trab, v_fec_eje_ot, v_hor_ini, v_hor_fin);

END $$

CREATE PROCEDURE pr_insertarTecnicosEnPaqueteXOT (
  IN v_cod_tco      char(5),
  IN v_cod_paq      char(6),
  IN v_num_ord_trab char(6)
)
BEGIN

  insert into tecnico_x_paquete_x_ot (cod_tco, cod_paq, num_ord_trab)
  values (v_cod_tco, v_cod_paq, v_num_ord_trab);

END $$

CREATE PROCEDURE pr_cambiarDisponibilidadTecnicoANoDisponible (
  IN v_cod_tco      char(5),
  IN v_fecha        date,
  IN v_hor_ini      time,
  IN v_hor_fin      time
)
BEGIN

  declare v_hor_fin_ajus time;

  if v_hor_ini < v_hor_fin then
    SET v_hor_fin_ajus = SUBTIME(v_hor_fin,'0:30');
  end if;

  update disponibilidadtecnicos set est_disp = 2
  where cod_tco = v_cod_tco and fecha = v_fecha
        and (hor between v_hor_ini and v_hor_fin_ajus);


END $$


/*----------------------------- STORED CHRISTIAN -----------------------------------*/

CREATE PROCEDURE pr_obtenerTecnico
(
 IN vcodigo char(5)

)
BEGIN
  	SELECT *	FROM tecnico
  WHERE cod_tco = vcodigo;
END $$

CREATE  PROCEDURE pr_obtenerClientePorIncidente(
 IN vnumInc varchar(150)
 )
BEGIN
SELECT c.* FROM cliente c inner join incidente i
on c.cod_cli=i.cod_cli
where i.num_inc=vnumInc;

END $$

CREATE PROCEDURE pr_obtenerPaquete
(
 IN vcodigo char(6)

)
BEGIN
  	SELECT p.*,
           m.desc_maq,
           m.mar_maq,
           tt.desc_tab desc_mar_maq,
           m.mod_maq
    FROM paquete p inner join maquinaria m
         on p.cod_maq=m.cod_maq
         inner join tabladetablas tt
         on m.mar_maq = tt.cod_item_tab and tt.cod_tab=18
    WHERE cod_paq = vcodigo;
END $$

CREATE PROCEDURE pr_obtenerListaPaquetes
(
 IN vnombrePaquete varchar(150),
 IN vcodMaquinaria varchar(6)

)
BEGIN
  	SELECT p.*,
           m.desc_maq,
           m.mar_maq,
           tt.desc_tab desc_mar_maq,
           m.mod_maq
    FROM paquete p inner join maquinaria m
         on p.cod_maq=m.cod_maq
         inner join tabladetablas tt
         on m.mar_maq = tt.cod_item_tab and tt.cod_tab=18
  WHERE p.nom_paq like vnombrePaquete and
        p.cod_maq like vcodMaquinaria;
END $$

CREATE PROCEDURE pr_buscarDisponibilidadTecnicos(
 IN vfechaInspeccion varchar(150),
 IN vhoraInicio  varchar(20),
 IN vhoraFin   varchar(20)
 )
BEGIN

SELECT t.cod_tco, t.ape_pat_tco,t.ape_mat_tco,t.nom_tco ,tt.desc_tab  FROM  tecnico t
inner join tabladetablas tt
on t.esp_tco=tt.cod_item_tab  and  tt.cod_tab=12
where
t.cod_tco not in(select distinct cod_tco from disponibilidadtecnicos
                    where fecha =vfechaInspeccion and hor between vhoraInicio and vhoraFin and est_disp = 2);

END $$

CREATE PROCEDURE pr_buscarDisponibilidadTecnicos1(
 IN vfechaInspeccion DATE,
 IN vhoraInicio      TIME,
 IN vhoraFin         TIME
 )
BEGIN
  DECLARE vhoraFinAjustado TIME;
  IF vhoraInicio < vhoraFin then
    SET vhoraFinAjustado = SUBTIME(vhoraFin,'0:30');
  ELSE
    SET vhoraFinAjustado = vhoraFin;
  END IF;

SELECT t.cod_tco,
       t.ape_pat_tco,
       t.ape_mat_tco,
       t.nom_tco,
       tt.desc_tab espec_tco,
       tt1.desc_tab niv_tco,
       (select IFNULL(sum(tl.num_hor_trab),0)
        from tecnicos_x_liquidacion tl inner join liquidacion l
        on tl.num_inf_liq=l.num_inf_liq
        where l.fec_inf_liq between curdate() and subdate(curdate(), INTERVAL 7 DAY)) hor_trab
FROM  tecnico t inner join tabladetablas tt on t.esp_tco=tt.cod_item_tab  and  tt.cod_tab=12
      inner join tabladetablas tt1 on t.niv_tco=tt1.cod_item_tab and tt1.cod_tab=11
where
      t.cod_tco not in (select distinct cod_tco from disponibilidadtecnicos
                       where fecha =vfechaInspeccion and hor between vhoraInicio and vhoraFinAjustado and est_disp = 2);

END $$

DROP FUNCTION IF EXISTS `mskbd`.`fn_obtenerAutogeneradoOTI` $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_obtenerAutogeneradoOTI`() RETURNS char(6) CHARSET latin1
BEGIN

  declare num_Id int;
  declare id char(6);

  set num_Id=0;
  set id='';

/* Obtenermos el valor numérico del último código*/
SELECT CAST(RIGHT(IFNULL(MAX(num_ord_trab_insp),0),3) AS UNSIGNED) INTO @num_Id FROM ordentrabajoinspeccion;
/* Autogeneramos el código del Registro de incidentes */
SELECT CONCAT('OI',RIGHT(CONCAT('000',CONVERT(IFNULL(@num_Id,0)+1,CHAR(6))),4)) INTO @Id;
    RETURN @Id;

END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarOrdenTrabajoInspeccion` $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_insertarOrdenTrabajoInspeccion`(
 IN vfec_insp varchar(20),
 IN vhor_ini char(20),
 IN vhor_fin char(20),
 IN vcod_reg char(5),
 IN vcod_tco char(5),
 IN vnum_inc char(6),
 IN vnum_tar char(6),
 IN vitm_aver int

)
BEGIN
DECLARE vcodigo char(6);

	 SET vhor_fin= convert(SUBTIME(vhor_fin,'0:30'),char(20));

	select  fn_obtenerAutogeneradoOTI() into vcodigo;

  insert into ordentrabajoinspeccion values(vcodigo,curdate(),vfec_insp,vhor_ini,vhor_fin,vcod_reg,vcod_tco,vnum_inc,vnum_tar,vitm_aver);

  update disponibilidadtecnicos
	set est_disp=2
	where cod_tco=vcod_tco and fecha=vfec_insp and hor between vhor_ini and vhor_fin;

  update maquinariasucursal_x_incidente
  set est_aver=2
  where num_inc=vnum_inc and num_tar=vnum_tar;

END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_buscarPrefacturas` $$
CREATE  PROCEDURE `pr_buscarPrefacturas`(
 IN vnom_empr varchar(150),
 IN vfec_inc  date,
 IN vdesc_aver varchar(300)
)
BEGIN

  select  distinct l.num_prefac,i.num_inc,i.fec_inc from liquidacion l inner join ordentrabajo ot
  on l.num_ord_trab=ot.num_ord_trab inner join incidente i
  on ot.num_inc=i.num_inc
  inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
	where est_inc=5 and
      c.raz_soc_cli like concat('%', vnom_empr,'%') and
      DATE_FORMAT(i.fec_inc,GET_FORMAT(DATE,'ISO')) like concat('%', IFNULL(vfec_inc,''), '%') and
      fn_obtenerDescripcionIncidente(i.num_inc) like concat('%', vdesc_aver,'%');



END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerMaquinariaSucursalXIncidentePendienteInspeccion` $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_obtenerMaquinariaSucursalXIncidentePendienteInspeccion`(
 IN vnum_inc char(6)
)
BEGIN
  select
    msi.*,
    m.cod_maq,
    m.desc_maq,
    tt1.desc_tab mar_maq,
    m.mod_maq,
    tt.desc_tab desc_natur_aver
  from
    maquinariasucursal_x_incidente msi inner join tabladetablas tt
    on tt.cod_tab=10 and msi.natur_aver = tt.cod_item_tab
    inner join maquinariasucursal ms on msi.num_tar=ms.num_tar
    inner join maquinaria m on ms.cod_maq = m.cod_maq
    inner join tabladetablas tt1 on tt1.cod_tab=18 and m.mar_maq=tt1.cod_item_tab
  where msi.num_inc = vnum_inc and msi.est_aver=1;

END $$


/*------------------------------ FIN STORED CHRISTIAN --------------------------------------*/



/*------------------------------ aldo --------------------------------------*/


DROP FUNCTION IF EXISTS `mskbd`.`fn_obtenerAutogenerado` $$
CREATE FUNCTION `fn_obtenerAutogenerado`() RETURNS char(6)
BEGIN

 return (select CONCAT('IN', RIGHT(CONCAT('0000',IFNULL(MAX(RIGHT(num_inc,4)),0)+1),4)) from incidente);

END $$


DROP PROCEDURE IF EXISTS `pr_agregarIncidente` $$
CREATE PROCEDURE `pr_agregarIncidente`(
 IN codRegistrador char (6),
 IN codCliente char (6),
 IN lugarAtencion varchar(150),
 IN estado int(11)
)
BEGIN

  declare id char(6);
  set id= '';
  SELECT fn_obtenerAutogenerado()into id;

/* Insertamos nuevo Registro de Incidentes */
INSERT INTO incidente(num_inc,
                      fec_inc,
                      cod_reg,
                      cod_cli,
                      lug_aten_inc,
                      est_inc)

VALUES                (id,
                      CURDATE(),
                      codRegistrador,
                      codCliente,
                      lugarAtencion,
                      estado);

/* Devolvemos el Autogenerado */
select id;

END $$

DROP PROCEDURE IF EXISTS `pr_agregarMaquinariaXIncidente` $$
CREATE PROCEDURE `pr_agregarMaquinariaXIncidente`(
 IN codIncidente char (6),
 IN tarjeta char (6),
 IN decripAveria varchar(300),
 IN naturaleza int(11)
)
BEGIN

/* Insertamos nuevo detalle del Registro de Incidentes */
INSERT INTO maquinaria_x_incidente(
                      num_inc,
                      num_tar,
                      desc_aver,
                      natur_aver)

VALUES                (codIncidente,
                      tarjeta,
                      decripAveria,
                      naturaleza);

END $$


CREATE PROCEDURE pr_buscarClientes(
 IN vEmpresa varchar(150)
)
BEGIN
  	SELECT cod_cli,fec_reg_cli,cod_reg,ruc_cli,raz_soc_cli,email_cli,desc_cli
	FROM cliente
	WHERE raz_soc_cli like concat(vEmpresa,'%');

END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE pr_obtenerSucursalesXCliente(
 IN codigo char(6)
)
BEGIN
  	SELECT s.num_suc,tt.desc_tab
  	FROM cliente c
    inner join sucursal s on c.cod_cli=s.cod_cli
    inner join tabladetablas tt on s.dist_suc = tt.cod_item_tab
	  WHERE tt.cod_tab = 14 and cod_item_tab <> 0
    and c.cod_cli = codigo;

END $$


CREATE  PROCEDURE pr_obtenerCliente(
 IN codigo char(6)
)
BEGIN
  	SELECT cod_cli,fec_reg_cli,cod_reg,ruc_cli,raz_soc_cli,email_cli,desc_cli
  	FROM cliente
	  WHERE cod_cli = codigo;

END $$


create  PROCEDURE pr_buscarMaquinariaXSucursal(
 IN codCliente char(6),
 IN codSucursal char(6)
)
BEGIN
  	SELECT distinct ms.num_tar,m.desc_maq,tt.desc_tab
  	FROM maquinariasucursal ms
    inner join sucursal s on s.num_suc = ms.num_suc
    inner join cliente c on c.cod_cli = s.cod_cli
    inner join maquinaria m on m.cod_maq = ms.cod_maq
    inner join tabladetablas tt on ms.est_maq = tt.cod_item_tab
	  WHERE ms.cod_cli = codCliente and ms.num_suc = codSucursal
	  and tt.cod_tab = 16 and cod_item_tab <> 0;

END $$


DROP PROCEDURE IF EXISTS `pr_listarNatAverias` $$
CREATE PROCEDURE `pr_listarNatAverias`(
)
BEGIN
   SELECT cod_item_tab,desc_tab
   FROM tabladetablas
   WHERE cod_tab=10
    AND cod_item_tab <> 0;
END $$


DROP PROCEDURE IF EXISTS `pr_agregarIncidente` $$
CREATE PROCEDURE `pr_agregarIncidente`(
 IN codRegistrador char (5),
 IN codCliente char (6),
 IN numSucursal char(3),
 IN estado int(11)
)
BEGIN

  declare id char(6);
  set id= '';
  SELECT fn_obtenerAutogenerado()into id;

/* Insertamos nuevo Registro de Incidentes */
INSERT INTO incidente(num_inc,
                      fec_inc,
                      cod_reg,
                      cod_cli,
                      num_suc,
                      est_inc)

VALUES                (id,
                      CURDATE(),
                      codRegistrador,
                      codCliente,
                      numSucursal,
                      estado);

/* Devolvemos el Autogenerado */
select id;

END $$


DROP PROCEDURE IF EXISTS `pr_agregarMaquinariaXIncidente` $$
CREATE PROCEDURE `pr_agregarMaquinariaXIncidente`(
 IN codIncidente char (6),
 IN tarjeta char (6),
 IN decripAveria varchar(300),
 IN naturaleza int(11)
)
BEGIN

/* Insertamos nuevo detalle del Registro de Incidentes */
INSERT INTO maquinariasucursal_x_incidente(
                      num_inc,
                      num_tar,
                      itm_aver,
                      desc_aver,
                      natur_aver,
                      est_aver)

VALUES                (codIncidente,
                      tarjeta,
                      1,
                      decripAveria,
                      naturaleza,
                      1);

END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerMateriales` $$
CREATE PROCEDURE `pr_obtenerMateriales`()
begin
SELECT * FROM materiales;
end$$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerPaquetes` $$
CREATE PROCEDURE `pr_obtenerPaquetes`(
vcodigo char(6)

)
begin
select * from paquete where nom_paq like '%' or cod_paq=vcodigo;
end $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerMantenerPaquete` $$
CREATE PROCEDURE `pr_obtenerMantenerPaquete`(
 IN vcodigo char(5),
vnombre varchar(150)

)
BEGIN
  	SELECT p.*,
           m.desc_maq,
           m.mar_maq,
           m.mod_maq
    FROM paquete p inner join maquinaria m
          on p.cod_maq=m.cod_maq
    WHERE p.cod_paq like vcodigo  or  m.cod_maq like vnombre;
END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerHerramienta` $$
CREATE PROCEDURE `pr_obtenerHerramienta`()
begin
SELECT *	FROM herramienta;
end$$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerActividades` $$
CREATE PROCEDURE `pr_obtenerActividades`()
begin
SELECT *	FROM actividades;
end$$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_listaDePaquetes` $$
CREATE PROCEDURE `pr_listaDePaquetes`(
vcodigo char(6),
vnombre varchar(150)
)
BEGIN
  	SELECT p.*,
           m.desc_maq,
           m.mar_maq,
           m.mod_maq
    FROM paquete p inner join maquinaria m
          on p.cod_maq=m.cod_maq
    WHERE p.cod_paq like vcodigo  and  p.nom_paq like vnombre;
END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerOTxIncidente` $$
CREATE PROCEDURE `pr_obtenerOTxIncidente`(
 IN vnum_inc char(6)
)
BEGIN
  select distinct
    ot.num_ord_trab,
    msi.num_tar,
    tt.desc_tab desc_natur_aver,
    msi.est_aver
  from
    maquinariasucursal_x_incidente msi inner join tabladetablas tt
    on tt.cod_tab=10 and msi.natur_aver = tt.cod_item_tab
    inner join ordentrabajo ot on msi.num_inc = ot.num_inc and msi.num_tar=ot.num_tar and msi.itm_aver = ot.itm_aver
  where msi.num_inc = vnum_inc;

END $$


 DROP PROCEDURE IF EXISTS `mskbd`.`pr_buscarIncidentesParaLiquidacion` $$
CREATE PROCEDURE `pr_buscarIncidentesParaLiquidacion`(
 IN vnom_empr varchar(150),
 IN vfec_inc  date,
 IN vdesc_aver varchar(300)
)
BEGIN
	select distinct
         i.num_inc,
         i.fec_inc,
         i.cod_reg,
         i.cod_cli,
         i.num_suc,
         tt.desc_tab distr,
         s.dir_suc,
         i.dat_cli_no_reg,
         i.est_inc,
         c.raz_soc_cli,
         fn_obtenerDescripcionIncidente(i.num_inc) desc_inc
	from incidente i inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
      inner join maquinariasucursal_x_incidente msi on i.num_inc =msi.num_inc
      inner join ordentrabajo ot on msi.num_inc = ot.num_inc and msi.num_tar=ot.num_tar and msi.itm_aver = ot.itm_aver
	where
      c.raz_soc_cli like concat('%', vnom_empr,'%') and
      DATE_FORMAT(i.fec_inc,GET_FORMAT(DATE,'ISO')) like concat('%', IFNULL(vfec_inc,''), '%') and
      fn_obtenerDescripcionIncidente(i.num_inc) like concat('%', vdesc_aver,'%');

END $$

CREATE PROCEDURE pr_obtenerTiposMateriales()
BEGIN
  select tt.cod_item_tab cod_tip_mat,
       tt.desc_tab     desc_tip_mat
  from tabladetablas tt
  where cod_tab=15 and cod_item_tab<>0;
END $$

CREATE PROCEDURE pr_buscarMateriales
(
  IN vCodTipMat int,
  IN vDescrip   varchar(150)
)
BEGIN
  if vCodTipMat=0 then
    begin
      select m.cod_mat,
         m.tip_mat cod_tip_mat,
         tt.desc_tab tip_mat,
         m.desc_mat,
         m.und_med_mat,
         m.prec_uni_mat
      from materiales m inner join tabladetablas tt on m.tip_mat = tt.cod_item_tab and tt.cod_tab=15
      where m.desc_mat like concat(vDescrip,'%');
    end;
  else
    begin
      select m.cod_mat,
         m.tip_mat cod_tip_mat,
         tt.desc_tab tip_mat,
         m.desc_mat,
         m.und_med_mat,
         m.prec_uni_mat
      from materiales m inner join tabladetablas tt on m.tip_mat = tt.cod_item_tab and tt.cod_tab=15
      where m.tip_mat=vCodTipMat and m.desc_mat like concat(vDescrip,'%');

    end;
  end if;

END $$


/*======================NUEVO PROCEDURE========================*/
DROP PROCEDURE IF EXISTS `mskbd`.`pr_mostrarCabeceraPrefactura` $$
CREATE  PROCEDURE `pr_mostrarCabeceraPrefactura`(
 IN vnum_inc char(6)
)
BEGIN
select distinct i.num_inc,c.cod_cli,c.raz_soc_cli,c.ruc_cli,c.direc_cli from incidente i inner join sucursal s
on i.num_suc=s.num_suc and i.cod_cli=s.cod_cli inner join cliente c
on s.cod_cli=c.cod_cli
where i.num_inc=vnum_inc;
END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerMateriales_x_Liquidacion` $$
CREATE  PROCEDURE `pr_obtenerMateriales_x_Liquidacion`(
 IN vnum_inc char(6)
)
BEGIN
select ot.num_ord_trab,l.num_inf_liq,m.cod_maq,ms.num_tar from ordentrabajo ot inner  join maquinariasucursal ms
on ot.num_tar=ms.num_tar inner join maquinaria m
on ms.cod_maq=m.cod_maq inner join liquidacion l
on ot.num_ord_trab=l.num_ord_trab
where ot.num_inc=vnum_inc;

END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerMateriales_x_Liquidacion1` $$
CREATE  PROCEDURE `pr_obtenerMateriales_x_Liquidacion1`(
 IN vnum_inc char(6)
)
BEGIN
select ml.*,m.desc_mat from materiales_x_liquidacion ml inner join materiales m
on ml.cod_mat=m.cod_mat inner join liquidacion l
on ml.num_inf_liq=l.num_inf_liq inner join ordentrabajo ot
on l.num_ord_trab=ot.num_ord_trab inner join incidente i
on ot.num_inc=i.num_inc
where i.num_inc=vnum_inc;
END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_aprobarPrefactura` $$
CREATE  PROCEDURE `pr_aprobarPrefactura`(
 IN vnum_prefac char(6),
 IN vobservacion  varchar(300),
 IN vmonto   decimal(11,2),
 IN flag       boolean
 )
BEGIN

  if flag then
    update prefactura
          set est_prefac=2,
              monto_prefac=vmonto
    where num_prefac=vnum_prefac;
  else
      update prefactura
          set est_prefac=3,
              monto_prefac=vmonto,
              obs_prefac=vobservacion
    where num_prefac=vnum_prefac;


  end if;

END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerTecnico_x_Liquidacion` $$
CREATE  PROCEDURE `pr_obtenerTecnico_x_Liquidacion`(
 IN vnum_inc char(6)
)
BEGIN
select tl.num_inf_liq,tl.cod_tco,concat(t.ape_pat_tco," ",t.ape_mat_tco," ,",t.nom_tco) as nombre ,
      tl.num_hor_trab,tl.tar_hor_cobr,(tl.num_hor_trab * tl.tar_hor_cobr)as importe
  from tecnicos_x_liquidacion tl inner join tecnico t
on tl.cod_tco=t.cod_tco inner join liquidacion l
on tl.num_inf_liq=l.num_inf_liq inner join ordentrabajo ot
on l.num_ord_trab=ot.num_ord_trab inner join incidente i
on ot.num_inc=i.num_inc
where i.num_inc=vnum_inc;
END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerSiguienteCDPDeTalonario` $$
create procedure pr_obtenerSiguienteCDPDeTalonario()
begin
	select	MIN(serie) serie,
			MIN(num_fac) num_fac
	from talonario
	where estado='1';
end $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_generarfactura` $$
CREATE  PROCEDURE `pr_generarfactura`(
 IN vnum_serie char(3),
 IN vnum_fac  char(5),
 IN vnum_prefac   char(6),
 IN vcod_reg char(6),
 IN vsubtotal decimal(11,2),
 IN vmont_igv decimal(11,2),
 IN vmont_desc decimal(11,2),
 IN vtotal decimal(11,2)
 )
BEGIN

 insert into factura value(vnum_serie,vnum_fac,vnum_prefac,curdate(),vcod_reg,vsubtotal,vmont_igv,vmont_desc,vtotal, 1);
  update talonario
  set estado=2
    where serie=vnum_serie and num_fac=vnum_fac;


END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_buscarIncidentesParaLiquidacion` $$
CREATE PROCEDURE `pr_buscarIncidentesParaLiquidacion`(
 IN vnom_empr varchar(150),
 IN vfec_inc  date,
 IN vdesc_aver varchar(300)
)
BEGIN
	select distinct
         i.num_inc,
         i.fec_inc,
         i.cod_reg,
         i.cod_cli,
         i.num_suc,
         tt.desc_tab distr,
         s.dir_suc,
         i.dat_cli_no_reg,
         i.est_inc,
         c.raz_soc_cli,
         fn_obtenerDescripcionIncidente(i.num_inc) desc_inc
	from incidente i inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
      inner join maquinariasucursal_x_incidente msi on i.num_inc =msi.num_inc
      inner join ordentrabajo ot on msi.num_inc = ot.num_inc and msi.num_tar=ot.num_tar and msi.itm_aver = ot.itm_aver
	where est_inc=1 and
      c.raz_soc_cli like concat('%', vnom_empr,'%') and
      DATE_FORMAT(i.fec_inc,GET_FORMAT(DATE,'ISO')) like concat('%', IFNULL(vfec_inc,''), '%') and
      fn_obtenerDescripcionIncidente(i.num_inc) like concat('%', vdesc_aver,'%');

END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerOTxIncidente` $$
CREATE PROCEDURE `pr_obtenerOTxIncidente`(
 IN vnum_inc char(6)
)
BEGIN
  select distinct
    ot.num_ord_trab,
    msi.num_tar,
    tt.desc_tab desc_natur_aver,
    msi.est_aver
  from
    maquinariasucursal_x_incidente msi inner join tabladetablas tt
    on tt.cod_tab=10 and msi.natur_aver = tt.cod_item_tab
    inner join ordentrabajo ot on msi.num_inc = ot.num_inc and msi.num_tar=ot.num_tar and msi.itm_aver = ot.itm_aver
  where msi.num_inc = vnum_inc;

END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerMaquinariaXOT` $$
CREATE PROCEDURE `pr_obtenerMaquinariaXOT`(
  in numOT char(6)
)
BEGIN
  select ms.num_tar,m.mod_maq,t.desc_tab as 'tipo',t.desc_tab as 'marca',ms.num_serie_maq,s.dir_suc,ms.med_horom
  from maquinariasucursal ms
  inner join maquinaria m on m.cod_maq = ms.cod_maq
  inner join tabladetablas t on m.mar_maq =t.cod_item_tab
  inner join sucursal s on s.cod_cli = ms.cod_cli and s.num_suc = ms.num_suc
  inner join tabladetablas tt on m.tip_maq =tt.cod_item_tab

  where t.cod_tab = 18 and t.cod_item_tab <> 0
  and tt.cod_tab = 17 and t.cod_item_tab <> 0;

END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerMaterial` $$
CREATE PROCEDURE `pr_obtenerMaterial`(
 IN codigo char(6)
)
BEGIN
  	SELECT m.cod_mat,m.tip_mat,m.desc_mat,m.und_med_mat,m.prec_uni_mat,tt.desc_tab descTipMat
  	FROM materiales m
    inner join tabladetablas tt on m.tip_mat = tt.cod_item_tab
	  WHERE m.cod_mat = codigo
    and tt.cod_tab = 15 and tt.cod_item_tab <> 0;

END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerTecnicosXOT` $$
CREATE PROCEDURE `pr_obtenerTecnicosXOT`(
 IN codigo char(6)
)
BEGIN
  	SELECT t.cod_tco,concat(t.ape_pat_tco,' ',t.ape_mat_tco,', ',t.nom_tco) nombre
  	FROM tecnico t;
END $$


DELIMITER ;

DELIMITER $$

DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarLiquidacion` $$
CREATE PROCEDURE `pr_insertarLiquidacion`(
 IN numOrdTrab char (6),
 IN codReg char (5),
 IN descripcion varchar(200),
 IN aporte varchar(1000),
 IN estado integer,
 IN numPreFac char(6)
)
BEGIN

  declare idInf char(6);


  set idInf= '';
  SELECT fn_obtenerAutogeneradoLiq()into idInf;


/* Insertamos nuevo Registro de Incidentes */
INSERT INTO liquidacion(num_inf_liq,
                      num_ord_trab,
                      num_prefac,
                      fec_inf_liq,
                      cod_reg,
                      des_aten_realiz,
                      apor_conoc,
                      est_liq)

VALUES                (idInf,
                      numOrdTrab,
                      numPreFac,
                      CURDATE(),
                      codReg,
                      descripcion,
                      aporte,
                      estado);

/* Devolvemos el Autogenerado */
select idInf;

END $$

DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarMaterialXLiquidacion` $$
CREATE PROCEDURE `pr_insertarMaterialXLiquidacion`(
 IN numLiq char (6),
 IN codMaq varchar(6),
 IN item integer,
 IN descExterno varchar (150),
 IN cantidad integer,
 IN preUni decimal(11,2),
 IN total decimal(11,2)
)
BEGIN

INSERT INTO materiales_x_liquidacion(num_inf_liq,
                      cod_mat,
                      item,
                      des_mat_ext,
                      cantidad,
                      pre_uni,
                      mon_tot
                      )

VALUES                (numLiq,
                      codMaq,
                      item,
                      descExterno,
                      cantidad,
                      preUni,
                      total
                      );
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarPrefactura` $$
CREATE PROCEDURE `pr_insertarPrefactura`(
 IN codReg varchar(5),
 IN estado integer
)
BEGIN

  declare idPre char(6);
  set idPre= '';
  SELECT fn_obtenerAutogeneradoPrefac()into idPre;

INSERT INTO prefactura(num_prefac,
                      fec_prefac,
                      cod_reg,
                      est_prefac
                      )

VALUES                (idPre,
                      CURDATE(),
                      codReg,
                      estado
                      );

select idPre;

END $$

DELIMITER ;


DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerTecnicosXOT` $$
CREATE PROCEDURE `pr_obtenerTecnicosXOT`(
 IN codigo char(6)
)
BEGIN
  	SELECT t.cod_tco,concat(t.ape_pat_tco,' ',t.ape_mat_tco,', ',t.nom_tco) nombre
  	FROM tecnico t;
END $$

DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS `mskbd`.`fn_obtenerAutogeneradoLiq` $$
CREATE FUNCTION `fn_obtenerAutogeneradoLiq`() RETURNS char(6)
BEGIN

 return (select CONCAT('LQ', RIGHT(CONCAT('0000',IFNULL(MAX(RIGHT(num_inf_liq,4)),0)+1),4)) from liquidacion);

END $$

DELIMITER ;

DELIMITER $$

DROP FUNCTION IF EXISTS `mskbd`.`fn_obtenerAutogeneradoPrefac` $$
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_obtenerAutogeneradoPrefac`() RETURNS char(6)
BEGIN

 return (select CONCAT('PF', RIGHT(CONCAT('0000',IFNULL(MAX(RIGHT(num_prefac,4)),0)+1),4)) from prefactura);

END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerTecnicosXOT` $$
CREATE PROCEDURE `pr_obtenerTecnicosXOT`(
 IN codOT char(6)
)
BEGIN
  	SELECT t.cod_tco,concat(t.ape_pat_tco,' ',t.ape_mat_tco,', ',t.nom_tco) nombre,tp.cod_paq
  	FROM tecnico t inner join tecnico_x_paquete_x_ot tp
    on t.cod_tco=tp.cod_tco
    where tp.num_ord_trab=codOT;
END $$

DELIMITER ;

DELIMITER $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarTecnicosXLiquidacion` $$
CREATE PROCEDURE `pr_insertarTecnicosXLiquidacion`(
 IN numLiq char (6),
 IN codTco varchar(6),
 IN codPaq varchar(6),
 IN horaIni time,
 IN horaFin time,
 IN ordTrab char(6)

)
BEGIN

declare numHor double;
declare tarHor decimal(11,2);
set numHor = convert(horaFin,decimal(11,2))/10000 - convert(horaIni,decimal(11,2))/10000;
select tar_Hor from tecnico t where t.cod_tco = codTco into tarHor;


INSERT INTO tecnicos_x_liquidacion(num_inf_liq,
                      cod_tco,
                      cod_paq,
                      hor_ini,
                      hor_fin,
                      num_hor_trab,
                      tar_hor_cobr,
                      num_ord_trab
                      )

VALUES                (numLiq,
                      codTco,
                      codPaq,
                      horaIni,
                      horaFin,
                      numHor,
                      tarHor,
                      ordTrab
                      );
END $$




/*''''''''''''''''''''''''''''''''''''''''*/
DROP PROCEDURE IF EXISTS `mskbd`.`pr_generardetalleFactura` $$
CREATE  PROCEDURE `pr_generardetalleFactura`(
 IN vnum_serie char(3),
 IN vnum_fac  char(5),
 IN vcod_serv   int,
 IN vtotal decimal(11,2)
 )
BEGIN

 insert into detallefactura value(vnum_serie,vnum_fac,vcod_serv,vtotal);

END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerDescuentoMateriales_x_Cliente` $$
CREATE  PROCEDURE `pr_obtenerDescuentoMateriales_x_Cliente`(
 IN vcod_mat char(6),
 IN vcod_cli char(6)
)
BEGIN
  	SELECT mon_desc
  	FROM detallefactura
	  WHERE cod_cli = vcod_cli and cod_mat=vcod_mat;

END $$

CREATE  PROCEDURE `pr_buscarfacturas`(
 IN vnom_empr varchar(150),
 IN vfec_inc  date,
 IN vdesc_aver varchar(300)
)
BEGIN

  select i.cod_cli,l.num_prefac,i.num_inc,i.fec_inc from incidente i inner join ordentrabajo ot
    on i.num_inc=ot.num_inc inner join liquidacion l
    on ot.num_ord_trab=l.num_ord_trab inner join cliente c
    on i.cod_cli=c.cod_cli inner join prefactura p
    on l.num_prefac=p.num_prefac
	where i.est_inc=5 and (p.est_prefac=2 or p.est_prefac=3) and
      c.raz_soc_cli like concat('%', vnom_empr,'%') and
      DATE_FORMAT(i.fec_inc,GET_FORMAT(DATE,'ISO')) like concat('%', IFNULL(vfec_inc,''), '%') and
      fn_obtenerDescripcionIncidente(i.num_inc) like concat('%', vdesc_aver,'%');

END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerfactura` $$
CREATE  PROCEDURE `pr_obtenerfactura`(
 IN vnum_prefac varchar(6)
)
BEGIN

 select * from factura where num_prefac=vnum_prefac;

END $$



DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerdetallefactura` $$
CREATE  PROCEDURE `pr_obtenerdetallefactura`(
 IN vnum_serie varchar(3),
 IN vnum_fac   varchar(5)
)
BEGIN

 select df.*,tt.desc_tab from detallefactura df inner join tabladetablas tt
on df.cod_serv=tt.cod_item_tab

 where tt.cod_tab=13 and num_serie=vnum_serie and num_fac=vnum_fac;

END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerIncidenteLiquidacion` $$
CREATE PROCEDURE `pr_obtenerIncidenteLiquidacion`(
 IN vnum_inc char(6)
)
BEGIN
	select i.num_inc,
         i.fec_inc,
         i.cod_reg,
         i.cod_cli,
         i.num_suc,
         tt.desc_tab distr,
         s.dir_suc,
         i.dat_cli_no_reg,
         i.est_inc,
         c.raz_soc_cli,
         fn_obtenerDescripcionIncidente(i.num_inc) desc_inc
	from incidente i inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
	where i.num_inc = vnum_inc;
END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_buscarIncidentesParaLiquidacion` $$
CREATE PROCEDURE `pr_buscarIncidentesParaLiquidacion`(
 IN vnom_empr varchar(150),
 IN vfec_inc  date,
 IN vdesc_aver varchar(300)
)
BEGIN
	select distinct
         i.num_inc,
         i.fec_inc,
         i.cod_reg,
         i.cod_cli,
         i.num_suc,
         tt.desc_tab distr,
         s.dir_suc,
         i.dat_cli_no_reg,
         i.est_inc,
         c.raz_soc_cli,
         fn_obtenerDescripcionIncidente(i.num_inc) desc_inc
	from incidente i inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
      inner join maquinariasucursal_x_incidente msi on i.num_inc =msi.num_inc
      inner join ordentrabajo ot on msi.num_inc = ot.num_inc and msi.num_tar=ot.num_tar and msi.itm_aver = ot.itm_aver
	where
      c.raz_soc_cli like concat('%', vnom_empr,'%') and
      DATE_FORMAT(i.fec_inc,GET_FORMAT(DATE,'ISO')) like concat('%', IFNULL(vfec_inc,''), '%') and
      fn_obtenerDescripcionIncidente(i.num_inc) like concat('%', vdesc_aver,'%');
end $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_buscarClientesPorPrefactura` $$
CREATE  PROCEDURE `pr_buscarClientesPorPrefactura`(
 IN vprefactura varchar(6)
)
BEGIN
  	select c.* from cliente c inner join incidente i
on c.cod_cli=i.cod_cli inner join ordentrabajo ot
on i.num_inc=ot.num_inc inner join liquidacion l
on ot.num_ord_trab=l.num_ord_trab
where l.num_prefac=vprefactura;

END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerTecnicosXOT` $$
CREATE PROCEDURE `pr_obtenerTecnicosXOT`(
 IN codOT char(6)
)
BEGIN
  	SELECT t.cod_tco,concat(t.ape_pat_tco,' ',t.ape_mat_tco,', 

',t.nom_tco) nombre,tp.cod_paq
  	FROM tecnico t inner join tecnico_x_paquete_x_ot tp
    on t.cod_tco=tp.cod_tco
    where tp.num_ord_trab=codOT;
END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarTecnicosXLiquidacion` $$
CREATE PROCEDURE `pr_insertarTecnicosXLiquidacion`(
 IN numLiq char (6),
 IN codTco varchar(6),
 IN codPaq varchar(6),
 IN horaIni time,
 IN horaFin time,
 IN ordTrab char(6)

)
BEGIN

declare numHor double;
declare tarHor decimal(11,2);
set numHor = convert(horaFin,decimal(11,2))/10000 - 

convert(horaIni,decimal(11,2))/10000;
select tar_Hor from tecnico t where t.cod_tco = codTco into tarHor;


INSERT INTO tecnicos_x_liquidacion(num_inf_liq,
                      cod_tco,
                      cod_paq,
                      hor_ini,
                      hor_fin,
                      num_hor_trab,
                      tar_hor_cobr,
                      num_ord_trab
                      )

VALUES                (numLiq,
                      codTco,
                      codPaq,
                      horaIni,
                      horaFin,
                      numHor,
                      tarHor,
                      ordTrab
                      );
END $$



DROP PROCEDURE IF EXISTS `mskbd`.`pr_agregarMaquinariaXIncidente` $$
CREATE PROCEDURE `pr_agregarMaquinariaXIncidente`(
 IN codIncidente char (6),
 IN tarjeta char (6),
 IN decripAveria varchar(300),
 IN naturaleza int(11)
)
BEGIN

/* Insertamos nuevo detalle del Registro de Incidentes */
INSERT INTO maquinariasucursal_x_incidente(
                      num_inc,
                      num_tar,
                      itm_aver,
                      desc_aver,
                      natur_aver,
                      est_aver)

VALUES                (codIncidente,
                      tarjeta,
                      1,
                      decripAveria,
                      naturaleza,
                      1);

update maquinariasucursal set est_maq=2 where num_tar=tarjeta;

END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_buscarMaquinariaXSucursal` $$
CREATE PROCEDURE `pr_buscarMaquinariaXSucursal`(
 IN codCliente char(6),
 IN codSucursal char(6)
)
BEGIN
  	SELECT distinct ms.num_tar,m.desc_maq,tt.desc_tab
  	FROM maquinariasucursal ms
    inner join sucursal s on s.num_suc = ms.num_suc
    inner join cliente c on c.cod_cli = s.cod_cli
    inner join maquinaria m on m.cod_maq = ms.cod_maq
    inner join tabladetablas tt on ms.est_maq = tt.cod_item_tab
	  WHERE ms.cod_cli = codCliente and ms.num_suc = codSucursal
	  and tt.cod_tab = 16 and cod_item_tab =1;

END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_buscarIncidentesParaLiquidacion` $$
CREATE PROCEDURE `pr_buscarIncidentesParaLiquidacion`(
 IN vnom_empr varchar(150),
 IN vfec_inc  date,
 IN vdesc_aver varchar(300)
)
BEGIN
	select distinct
         i.num_inc,
         i.fec_inc,
         i.cod_reg,
         i.cod_cli,
         i.num_suc,
         tt.desc_tab distr,
         s.dir_suc,
         i.dat_cli_no_reg,
         i.est_inc,
         c.raz_soc_cli,
         fn_obtenerDescripcionIncidente(i.num_inc) desc_inc
	from incidente i inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and 

s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
      inner join maquinariasucursal_x_incidente msi on i.num_inc =msi.num_inc
      inner join ordentrabajo ot on msi.num_inc = ot.num_inc and 

msi.num_tar=ot.num_tar and msi.itm_aver = ot.itm_aver
	where
      c.raz_soc_cli like concat('%', vnom_empr,'%') and
      DATE_FORMAT(i.fec_inc,GET_FORMAT(DATE,'ISO')) like concat('%', 

IFNULL(vfec_inc,''), '%') and
      fn_obtenerDescripcionIncidente(i.num_inc) like concat('%', 

vdesc_aver,'%');

END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerIncidenteLiquidacion` $$
CREATE PROCEDURE `pr_obtenerIncidenteLiquidacion`(
 IN vnum_inc char(6)
)
BEGIN
	select i.num_inc,
         i.fec_inc,
         i.cod_reg,
         i.cod_cli,
         i.num_suc,
         tt.desc_tab distr,
         s.dir_suc,
         i.dat_cli_no_reg,
         i.est_inc,
         c.raz_soc_cli,
         fn_obtenerDescripcionIncidente(i.num_inc) desc_inc
	from incidente i inner join sucursal s
  		on i.cod_cli=s.cod_cli and i.num_suc=s.num_suc
  		inner join tabladetablas tt on tt.cod_tab=14 and 

s.dist_suc=tt.cod_item_tab
  		inner join cliente c on i.cod_cli= c.cod_cli
	where i.num_inc = vnum_inc;
END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_verificarPrefactura` $$
CREATE PROCEDURE `pr_verificarPrefactura`(
 in numIncidente char(6)
 )
BEGIN

select distinct p.num_prefac
from liquidacion l inner join ordentrabajo ot
on ot.num_ord_trab = l.num_ord_trab
inner join prefactura p
on p.num_prefac = l.num_prefac
where ot.num_inc=numIncidente;

END $$


DROP PROCEDURE IF EXISTS `pr_insertarPrefactura` $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_insertarPrefactura`(
 IN codReg varchar(5),
 IN estado integer,
 IN numInc char(6)
)
BEGIN

  declare idPre char(6);
  set idPre= '';
  SELECT fn_obtenerAutogeneradoPrefac()into idPre;

INSERT INTO prefactura(num_prefac,
                      fec_prefac,
                      cod_reg,
                      est_prefac
                      )

VALUES                (idPre,
                      CURDATE(),
                      codReg,
                      estado
                      );

update incidente set est_inc =5 where num_inc=numInc;

select idPre;

END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_obtenerEstadoIncidente` $$
CREATE PROCEDURE `pr_obtenerEstadoIncidente`(
 IN numIncidente varchar(150)
)
BEGIN
  SELECT est_inc
	FROM incidente i
	WHERE i.num_inc = numIncidente;

END $$

DROP PROCEDURE IF EXISTS `pr_actualizaHorometro` $$
CREATE PROCEDURE `pr_actualizaHorometro`(
 IN numOrdTrab char(6),
 IN horometro int
)
BEGIN
    declare numTar char(6);

  	select distinct ms.num_tar
    from ordentrabajo o inner join maquinariasucursal_x_incidente msi
    on o.num_inc = msi.num_inc and o.num_tar = msi.num_tar and o.itm_aver = 

msi.itm_aver
    inner join maquinariasucursal ms on ms.num_tar = msi.num_tar
    WHERE o.num_ord_trab = numOrdTrab INTO numTar;

    update maquinariasucursal mas set med_horom = horometro where 

mas.num_tar=numTar;


END $$

DROP PROCEDURE IF EXISTS `pr_insertarLiquidacion` $$
CREATE PROCEDURE `pr_insertarLiquidacion`(
 IN numOrdTrab char (6),
 IN codReg char (5),
 IN descripcion varchar(200),
 IN aporte varchar(1000),
 IN estado integer,
 IN numPreFac char(6)
)
BEGIN

  declare idInf char(6);
  declare vInc  char(6);
  declare vTar  char(6);
  declare vItem int;


  set idInf= '';
  SELECT fn_obtenerAutogeneradoLiq()into idInf;

  select num_inc from ordentrabajo where num_ord_trab=numOrdTrab into vInc;
  select num_tar from ordentrabajo where num_ord_trab=numOrdTrab into vTar;
  select itm_aver from ordentrabajo where num_ord_trab=numOrdTrab into vItem;


/* Insertamos nuevo Registro de Incidentes */
INSERT INTO liquidacion(num_inf_liq,
                      num_ord_trab,
                      num_prefac,
                      fec_inf_liq,
                      cod_reg,
                      des_aten_realiz,
                      apor_conoc,
                      est_liq)

VALUES                (idInf,
                      numOrdTrab,
                      numPreFac,
                      CURDATE(),
                      codReg,
                      descripcion,
                      aporte,
                      estado);

/* Actualizamos el estado de la maquinariaXincidente*/
update maquinariasucursal_x_incidente set est_aver=4
where num_inc=vInc and num_tar=vTar and itm_aver=vItem;

/* Devolvemos el Autogenerado */
select idInf;

END $$

/* Stored procedures para reportes */

DROP PROCEDURE IF EXISTS `pr_reporteFrecuenciaIncidentes` $$
CREATE PROCEDURE `pr_reporteFrecuenciaIncidentes`(
 IN vcod_cli char(6),
 IN vanio    char(4)
 )
BEGIN

SELECT  cli.cod_cli,
        cli.raz_soc_cli,
        vanio AS annio,
        ms.num_tar,
        mq.desc_maq,
        (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
         ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
         AND inc.cod_cli = vcod_cli AND msi.natur_aver = '1') AS cant_hidrau,
        (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
         ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
         AND inc.cod_cli = vcod_cli AND msi.natur_aver = '2') AS cant_mecan,
        (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
         ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
         AND inc.cod_cli = vcod_cli AND msi.natur_aver = '3') AS cant_elect,
        (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
         ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
         AND inc.cod_cli = vcod_cli AND msi.natur_aver = '4') AS cant_neumat,
        (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
         ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
         AND inc.cod_cli = vcod_cli AND msi.natur_aver = '5') AS cant_otro,
        ((SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
          ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
          AND inc.cod_cli = vcod_cli AND msi.natur_aver = '1')+
          (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
          ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
          AND inc.cod_cli = vcod_cli AND msi.natur_aver = '2')+
          (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
          ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
          AND inc.cod_cli = vcod_cli AND msi.natur_aver = '3')+
          (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
          ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
          AND inc.cod_cli = vcod_cli AND msi.natur_aver = '4')+
          (SELECT COUNT(*) FROM maquinariasucursal_x_incidente msi inner join incidente inc
          ON msi.num_inc = inc.num_inc WHERE CONVERT(YEAR(inc.fec_inc),CHAR(4)) LIKE vanio
          AND inc.cod_cli = vcod_cli AND msi.natur_aver = '5')) AS cant_total
FROM cliente cli inner join sucursal suc
ON cli.cod_cli = suc.cod_cli
INNER JOIN maquinariasucursal ms
ON ms.num_suc = suc.num_suc
AND ms.cod_cli = suc.cod_cli
INNER JOIN maquinaria mq
ON ms.cod_maq = mq.cod_maq
WHERE cli.cod_cli = vcod_cli;

END $$

DROP PROCEDURE IF EXISTS `pr_reporteTecnicosOT` $$
CREATE PROCEDURE `pr_reporteTecnicosOT`(
 IN vnum_ord_trab char(6),
 IN vfec_ini      date,
 IN vfec_fin      date
 )
BEGIN

SELECT  distinct ot.num_ord_trab,
	cli.direc_cli,
  cli.raz_soc_cli,
  DATE_FORMAT(ot.fec_ord_trab, '%d/%m/%Y') fec_ord_trab,
  tec.cod_tco,
  CONCAT(ape_pat_tco,' ',ape_pat_tco,', ',nom_tco) nom_tec,
  concat(convert(tli.hor_ini,char(5)),' hrs') hor_ini ,
	concat(convert(tli.hor_fin,char(5)),' hrs') hor_fin
FROM cliente cli
INNER JOIN incidente inc ON cli.cod_cli = inc.cod_cli
INNER JOIN ordentrabajo ot ON inc.num_inc = ot.num_inc
INNER JOIN liquidacion liq ON liq.num_ord_trab = ot.num_ord_trab
INNER JOIN tecnicos_x_liquidacion tli ON tli. num_inf_liq = liq.num_inf_liq
INNER JOIN tecnico_x_paquete_x_ot tot ON ot.num_ord_trab = tot.num_ord_trab
INNER JOIN tecnico tec ON tec.cod_tco = tot.cod_tco
WHERE ot.fec_ord_trab BETWEEN vfec_ini AND vfec_fin
AND ot.num_ord_trab = vnum_ord_trab;

END $$

DELIMITER ;
