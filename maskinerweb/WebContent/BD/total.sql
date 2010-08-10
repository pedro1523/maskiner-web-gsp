DROP DATABASE IF EXISTS mskbd;

CREATE DATABASE mskbd;

USE mskbd;

CREATE TABLE usuario (
	cod_usr CHAR(5) NOT NULL,
	dni_usr CHAR(8),
	ape_pat_usr VARCHAR(20) NOT NULL,
	ape_mat_usr VARCHAR(20) NOT NULL,
	nom_usr VARCHAR(20) NOT NULL,
	dom_usr VARCHAR(150),
	tel_usr CHAR(7),
	cargo_usr VARCHAR(150),
	username VARCHAR(20) NOT NULL,
	password VARCHAR(40) NOT NULL,
	est_usr INT NOT NULL,
	PRIMARY KEY (cod_usr)
);

CREATE TABLE actividades (
	cod_paq CHAR(6) NOT NULL,
	num_item INT NOT NULL,
	desc_act VARCHAR(150) NOT NULL,
	PRIMARY KEY (cod_paq,num_item)
);

CREATE TABLE maquinariasucursal_x_incidente (
	num_inc CHAR(6) NOT NULL,
	num_tar CHAR(6) NOT NULL,
	itm_aver INT NOT NULL,
	desc_aver VARCHAR(300) NOT NULL,
	natur_aver INT NOT NULL,
	dat_maq_no_reg VARCHAR(1000),
	est_aver INT NOT NULL,
	PRIMARY KEY (num_inc,num_tar,itm_aver)
);

CREATE TABLE maquinariasucursal (
	num_tar CHAR(6) NOT NULL,
	num_serie_maq VARCHAR(20) NOT NULL,
	med_horom INT NOT NULL,
	fech_ult_med_hor DATE NOT NULL,
	cod_cli CHAR(6),
	num_suc CHAR(3),
	cod_maq CHAR(5),
	est_maq INT NOT NULL,
	fec_adquisicion DATE NOT NULL,
	PRIMARY KEY (num_tar)
);

CREATE TABLE tabladetablas (
	cod_tab INT NOT NULL,
	cod_item_tab INT NOT NULL,
	desc_tab VARCHAR(200) NOT NULL,
	PRIMARY KEY (cod_item_tab,cod_tab)
);

CREATE TABLE ordentrabajoinspeccion (
	num_ord_trab_insp CHAR(6) NOT NULL,
	fec_ord_trab_insp DATE NOT NULL,
	fec_insp DATE NOT NULL,
	hor_ini TIME NOT NULL,
	hor_fin TIME NOT NULL,
	cod_reg CHAR(5) NOT NULL,
	cod_tco CHAR(5) NOT NULL,
	num_inc CHAR(6) NOT NULL,
	num_tar CHAR(6) NOT NULL,
	itm_aver INT NOT NULL,
	PRIMARY KEY (num_ord_trab_insp)
);

CREATE TABLE materiales_x_paquete (
	cod_mat CHAR(6) NOT NULL,
	cod_paq CHAR(6) NOT NULL,
	cantidad INT NOT NULL,
	PRIMARY KEY (cod_paq,cod_mat)
);

CREATE TABLE detallefactura (
	num_serie CHAR(3) NOT NULL,
	num_fac CHAR(5) NOT NULL,
	cod_serv INT NOT NULL,
	mon_serv NUMERIC(11 , 2) NOT NULL,
	PRIMARY KEY (num_serie,num_fac,cod_serv)
);

CREATE TABLE paquete (
	cod_paq CHAR(6) NOT NULL,
	fec_reg_paq DATE NOT NULL,
	cod_reg CHAR(5) NOT NULL,
	nom_paq VARCHAR(150) NOT NULL,
	cod_maq CHAR(5) NOT NULL,
	cant_tec_paq INT NOT NULL,
	cant_hor_paq INT NOT NULL,
	interv_horom INT NOT NULL,
	PRIMARY KEY (cod_paq)
);

CREATE TABLE materiales (
	cod_mat CHAR(6) NOT NULL,
	tip_mat INT NOT NULL,
	desc_mat VARCHAR(150) NOT NULL,
	und_med_mat VARCHAR(20) NOT NULL,
	prec_uni_mat NUMERIC(11 , 2) NOT NULL,
	PRIMARY KEY (cod_mat)
);

CREATE TABLE prefactura (
	num_prefac CHAR(6) NOT NULL,
	fec_prefac DATE NOT NULL,
	cod_reg CHAR(5) NOT NULL,
	obs_prefac VARCHAR(300),
	est_prefac INT NOT NULL,
	monto_prefac NUMERIC(11 , 2),
	PRIMARY KEY (num_prefac)
);

CREATE TABLE incidente (
	num_inc CHAR(6) NOT NULL,
	fec_inc DATE NOT NULL,
	cod_reg CHAR(5) NOT NULL,
	cod_cli CHAR(6),
	num_suc CHAR(3),
	dat_cli_no_reg VARCHAR(1000),
	est_inc INT NOT NULL,
	PRIMARY KEY (num_inc)
);

CREATE TABLE materiales_x_liquidacion (
	num_inf_liq CHAR(6) NOT NULL,
	cod_mat CHAR(6) NOT NULL,
	item INT NOT NULL,
	des_mat_ext VARCHAR(150),
	cantidad INT NOT NULL,
	pre_uni NUMERIC(11 , 2) NOT NULL,
	mon_tot NUMERIC(11 , 2) NOT NULL,
	PRIMARY KEY (num_inf_liq,cod_mat,item)
);

CREATE TABLE factura (
	num_serie CHAR(3) NOT NULL,
	num_fac CHAR(5) NOT NULL,
	num_prefac CHAR(6) NOT NULL,
	fec_fac DATE NOT NULL,
	cod_reg CHAR(5) NOT NULL,
	subtotal NUMERIC(11 , 2) NOT NULL,
	mon_igv NUMERIC(11 , 2) NOT NULL,
	mon_desc NUMERIC(11 , 2) DEFAULT 0,
	total NUMERIC(11 , 2) NOT NULL,
	est_fac INT NOT NULL,
	PRIMARY KEY (num_serie,num_fac)
);

CREATE TABLE paquete_x_ot (
	cod_paq CHAR(6) NOT NULL,
	num_ord_trab CHAR(6) NOT NULL,
	fec_eje_ot DATE NOT NULL,
	hor_ini TIME NOT NULL,
	hor_fin TIME NOT NULL,
	PRIMARY KEY (cod_paq,num_ord_trab)
);

CREATE TABLE herramienta (
	cod_herr CHAR(5) NOT NULL,
	desc_herr VARCHAR(150) NOT NULL,
	PRIMARY KEY (cod_herr)
);

CREATE TABLE tecnico_x_paquete_x_ot (
	cod_tco CHAR(5) NOT NULL,
	cod_paq CHAR(6) NOT NULL,
	num_ord_trab CHAR(6) NOT NULL,
	PRIMARY KEY (cod_tco,cod_paq,num_ord_trab)
);

CREATE TABLE descuentomaterial_x_cliente (
	cod_mat CHAR(6) NOT NULL,
	cod_cli CHAR(6) NOT NULL,
	mon_desc NUMERIC(11 , 2) NOT NULL,
	PRIMARY KEY (cod_mat,cod_cli)
);

CREATE TABLE ordentrabajo (
	num_ord_trab CHAR(6) NOT NULL,
	fec_ord_trab DATE NOT NULL,
	cod_reg CHAR(5) NOT NULL,
	num_inc CHAR(6) NOT NULL,
	num_tar CHAR(6) NOT NULL,
	itm_aver INT NOT NULL,
	est_ord_trab INT NOT NULL,
	PRIMARY KEY (num_ord_trab)
);

CREATE TABLE sucursal (
	cod_cli CHAR(6) NOT NULL,
	num_suc CHAR(3) NOT NULL,
	dist_suc INT NOT NULL,
	dir_suc VARCHAR(150) NOT NULL,
	tel_suc CHAR(7),
	fax_suc CHAR(7),
	contac_suc VARCHAR(100),
	tiene_superv TINYINT DEFAULT false NOT NULL,
	PRIMARY KEY (cod_cli,num_suc)
);

CREATE TABLE rol_x_usuario (
	cod_rol CHAR(2) NOT NULL,
	cod_usr CHAR(5) NOT NULL,
	PRIMARY KEY (cod_rol,cod_usr)
);

CREATE TABLE cliente (
	cod_cli CHAR(6) NOT NULL,
	fec_reg_cli DATE NOT NULL,
	cod_reg CHAR(5) NOT NULL,
	ruc_cli CHAR(11) NOT NULL,
	raz_soc_cli VARCHAR(150) NOT NULL,
	email_cli VARCHAR(80),
	desc_cli VARCHAR(300),
	direc_cli varchar(300),
	PRIMARY KEY (cod_cli)
);

CREATE TABLE tecnico (
	cod_tco CHAR(5) NOT NULL,
	ape_pat_tco VARCHAR(20) NOT NULL,
	ape_mat_tco VARCHAR(20) NOT NULL,
	nom_tco VARCHAR(20) NOT NULL,
	niv_tco INT NOT NULL,
	esp_tco INT NOT NULL,
	est_tco INT NOT NULL,
	tar_hor NUMERIC(11 , 2) NOT NULL,
	PRIMARY KEY (cod_tco)
);

CREATE TABLE liquidacion (
	num_inf_liq CHAR(6) NOT NULL,
	num_ord_trab CHAR(6) NOT NULL,
	num_prefac CHAR(6),
	fec_inf_liq DATE NOT NULL,
	cod_reg CHAR(5) NOT NULL,
	des_aten_realiz VARCHAR(1000) NOT NULL,
	apor_conoc VARCHAR(1000),
	est_liq INT NOT NULL,
	PRIMARY KEY (num_inf_liq)
);

CREATE TABLE tecnicos_x_liquidacion (
	num_inf_liq CHAR(6) NOT NULL,
	cod_tco CHAR(5) NOT NULL,
	cod_paq CHAR(6) NOT NULL,
	hor_ini TIME NOT NULL,
	hor_fin TIME NOT NULL,
	num_hor_trab DOUBLE NOT NULL,
	tar_hor_cobr NUMERIC(11 , 2) NOT NULL,
	num_ord_trab CHAR(6) NOT NULL,
	PRIMARY KEY (num_inf_liq,cod_tco,cod_paq)
);

CREATE TABLE herramientas_x_paquete (
	cod_paq CHAR(6) NOT NULL,
	cod_herr CHAR(5) NOT NULL,
	cantidad INT NOT NULL,
	PRIMARY KEY (cod_paq,cod_herr)
);

CREATE TABLE rol (
	cod_rol CHAR(2) NOT NULL,
	desc_rol VARCHAR(40) NOT NULL,
	PRIMARY KEY (cod_rol)
);

CREATE TABLE disponibilidadtecnicos (
	cod_tco CHAR(5) NOT NULL,
	fecha DATE NOT NULL,
	hor TIME NOT NULL,
	est_disp INT NOT NULL,
	PRIMARY KEY (cod_tco,fecha,hor)
);

CREATE TABLE maquinaria (
	cod_maq CHAR(5) NOT NULL,
	desc_maq VARCHAR(500) NOT NULL,
	mar_maq INT NOT NULL,
	mod_maq VARCHAR(50) NOT NULL,
	tip_maq INT NOT NULL,
	PRIMARY KEY (cod_maq)
);

CREATE TABLE  talonario (
  serie char(3) default NULL,
  num_fac char(5) default NULL,
  estado int(11) default NULL
);

ALTER TABLE liquidacion ADD CONSTRAINT liquidacion_ordentrabajo_fk FOREIGN KEY (num_ord_trab)
	REFERENCES ordentrabajo (num_ord_trab);

ALTER TABLE incidente ADD CONSTRAINT incidente_usuario_fk FOREIGN KEY (cod_reg)
	REFERENCES usuario (cod_usr);

ALTER TABLE herramientas_x_paquete ADD CONSTRAINT herramientas_x_paquete_paquete_fk FOREIGN KEY (cod_paq)
	REFERENCES paquete (cod_paq);

ALTER TABLE liquidacion ADD CONSTRAINT liquidacion_prefactura_fk FOREIGN KEY (num_prefac)
	REFERENCES prefactura (num_prefac);

ALTER TABLE incidente ADD CONSTRAINT incidente_sucursal_fk FOREIGN KEY (cod_cli, num_suc)
	REFERENCES sucursal (cod_cli, num_suc);

ALTER TABLE herramientas_x_paquete ADD CONSTRAINT herramientas_x_paquete_herramienta_fk FOREIGN KEY (cod_herr)
	REFERENCES herramienta (cod_herr);

ALTER TABLE ordentrabajoinspeccion ADD CONSTRAINT ordentrabajoinspeccion_tecnico_fk FOREIGN KEY (cod_tco)
	REFERENCES tecnico (cod_tco);

ALTER TABLE rol_x_usuario ADD CONSTRAINT rol_x_usuario_rol_fk FOREIGN KEY (cod_rol)
	REFERENCES rol (cod_rol);

ALTER TABLE materiales_x_liquidacion ADD CONSTRAINT materiales_x_liquidacion_materiales_fk FOREIGN KEY (cod_mat)
	REFERENCES materiales (cod_mat);

ALTER TABLE ordentrabajoinspeccion ADD CONSTRAINT ordentrabajoinspeccion_usuario_fk FOREIGN KEY (cod_reg)
	REFERENCES usuario (cod_usr);

ALTER TABLE materiales_x_liquidacion ADD CONSTRAINT materiales_x_liquidacion_liquidacion_fk FOREIGN KEY (num_inf_liq)
	REFERENCES liquidacion (num_inf_liq);

ALTER TABLE ordentrabajoinspeccion ADD CONSTRAINT ordentrabajoinspeccion_maquinariasucursal_x_incidente_fk FOREIGN KEY (num_inc, num_tar, itm_aver)
	REFERENCES maquinariasucursal_x_incidente (num_inc, num_tar, itm_aver);

ALTER TABLE actividades ADD CONSTRAINT actividades_paquete_fk FOREIGN KEY (cod_paq)
	REFERENCES paquete (cod_paq);

ALTER TABLE ordentrabajo ADD CONSTRAINT ordentrabajo_usuario_fk FOREIGN KEY (cod_reg)
	REFERENCES usuario (cod_usr);

ALTER TABLE factura ADD CONSTRAINT factura_prefactura_fk FOREIGN KEY (num_prefac)
	REFERENCES prefactura (num_prefac);

ALTER TABLE factura ADD CONSTRAINT factura_usuario_fk FOREIGN KEY (cod_reg)
	REFERENCES usuario (cod_usr);

ALTER TABLE rol_x_usuario ADD CONSTRAINT rol_x_usuario_usuario_fk FOREIGN KEY (cod_usr)
	REFERENCES usuario (cod_usr);

ALTER TABLE ordentrabajo ADD CONSTRAINT ordentrabajo_maquinariasucursal_x_incidente_fk FOREIGN KEY (num_inc, num_tar, itm_aver)
	REFERENCES maquinariasucursal_x_incidente (num_inc, num_tar, itm_aver);

ALTER TABLE materiales_x_paquete ADD CONSTRAINT materiales_x_paquete_materiales_fk FOREIGN KEY (cod_mat)
	REFERENCES materiales (cod_mat);

ALTER TABLE paquete_x_ot ADD CONSTRAINT paquete_x_ot_ordentrabajo_fk FOREIGN KEY (num_ord_trab)
	REFERENCES ordentrabajo (num_ord_trab);

ALTER TABLE materiales_x_paquete ADD CONSTRAINT materiales_x_paquete_paquete_fk FOREIGN KEY (cod_paq)
	REFERENCES paquete (cod_paq);

ALTER TABLE paquete_x_ot ADD CONSTRAINT paquete_x_ot_paquete_fk FOREIGN KEY (cod_paq)
	REFERENCES paquete (cod_paq);

ALTER TABLE paquete ADD CONSTRAINT paquete_usuario_fk FOREIGN KEY (cod_reg)
	REFERENCES usuario (cod_usr);

ALTER TABLE disponibilidadtecnicos ADD CONSTRAINT disponibilidadtecnicos_tecnico_fk FOREIGN KEY (cod_tco)
	REFERENCES tecnico (cod_tco);

ALTER TABLE paquete ADD CONSTRAINT paquete_maquinaria_fk FOREIGN KEY (cod_maq)
	REFERENCES maquinaria (cod_maq);

ALTER TABLE cliente ADD CONSTRAINT cliente_usuario_fk FOREIGN KEY (cod_reg)
	REFERENCES usuario (cod_usr);

ALTER TABLE maquinariasucursal ADD CONSTRAINT maquinariasucursal_sucursal_fk FOREIGN KEY (cod_cli, num_suc)
	REFERENCES sucursal (cod_cli, num_suc);

ALTER TABLE maquinariasucursal ADD CONSTRAINT maquinariasucursal_maquinaria_fk FOREIGN KEY (cod_maq)
	REFERENCES maquinaria (cod_maq);

ALTER TABLE prefactura ADD CONSTRAINT prefactura_usuario_fk FOREIGN KEY (cod_reg)
	REFERENCES usuario (cod_usr);

ALTER TABLE tecnico_x_paquete_x_ot ADD CONSTRAINT tecnico_x_paquete_x_ot_tecnico_fk FOREIGN KEY (cod_tco)
	REFERENCES tecnico (cod_tco);

ALTER TABLE sucursal ADD CONSTRAINT sucursal_cliente_fk FOREIGN KEY (cod_cli)
	REFERENCES cliente (cod_cli);

ALTER TABLE detallefactura ADD CONSTRAINT detallefactura_factura_fk FOREIGN KEY (num_serie, num_fac)
	REFERENCES factura (num_serie, num_fac);

ALTER TABLE descuentomaterial_x_cliente ADD CONSTRAINT descuentomaterial_x_cliente_cliente_fk FOREIGN KEY (cod_cli)
	REFERENCES cliente (cod_cli);

ALTER TABLE tecnico_x_paquete_x_ot ADD CONSTRAINT tecnico_x_paquete_x_ot_paquete_x_ot_fk FOREIGN KEY (cod_paq, num_ord_trab)
	REFERENCES paquete_x_ot (cod_paq, num_ord_trab);

ALTER TABLE tecnicos_x_liquidacion ADD CONSTRAINT tecnicos_x_liquidacion_liquidacion_fk FOREIGN KEY (num_inf_liq)
	REFERENCES liquidacion (num_inf_liq);

ALTER TABLE maquinariasucursal_x_incidente ADD CONSTRAINT maquinariasucursal_x_incidente_incidente_fk FOREIGN KEY (num_inc)
	REFERENCES incidente (num_inc);

ALTER TABLE descuentomaterial_x_cliente ADD CONSTRAINT descuentomaterial_x_cliente_materiales_fk FOREIGN KEY (cod_mat)
	REFERENCES materiales (cod_mat);

ALTER TABLE liquidacion ADD CONSTRAINT liquidacion_usuario_fk FOREIGN KEY (cod_reg)
	REFERENCES usuario (cod_usr);

ALTER TABLE tecnicos_x_liquidacion ADD CONSTRAINT tecnicos_x_liquidacion_tecnico_x_paquete_x_ot_fk FOREIGN KEY (cod_tco, cod_paq, num_ord_trab)
	REFERENCES tecnico_x_paquete_x_ot (cod_tco, cod_paq, num_ord_trab);

ALTER TABLE maquinariasucursal_x_incidente ADD CONSTRAINT maquinariasucursal_x_incidente_maquinariasucursal_fk FOREIGN KEY (num_tar)
	REFERENCES maquinariasucursal (num_tar);

ALTER TABLE incidente ADD CONSTRAINT incidente_cliente_fk FOREIGN KEY (cod_cli)
	REFERENCES cliente (cod_cli);


-- OTROS ALTERS TABLES PERSONALIZADOS

ALTER TABLE usuario ADD CONSTRAINT username_unique UNIQUE (username);


USE mskbd;

DELIMITER $$

CREATE PROCEDURE pr_validarusuario
(
 IN vusername varchar(25),
 IN vpassword varchar(40)
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
	where est_inc=2 and
      c.raz_soc_cli like concat('%', vnom_empr,'%') and
      DATE_FORMAT(i.fec_inc,GET_FORMAT(DATE,'ISO')) like concat('%', IFNULL(vfec_inc,''), '%') and
      fn_obtenerDescripcionIncidente(i.num_inc) like concat('%', vdesc_aver,'%');

END $$


DROP PROCEDURE IF EXISTS `pr_buscarIncidentesOTI` $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_buscarIncidentesOTI`(
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


DROP PROCEDURE IF EXISTS `pr_insertarOrdenTrabajoInspeccion` $$
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
declare vcant_Inc int;
declare vcant_oti int;
	 SET vhor_fin= convert(SUBTIME(vhor_fin,'0:30'),char(20));

	select  fn_obtenerAutogeneradoOTI() into vcodigo;

  insert into ordentrabajoinspeccion values(vcodigo,curdate(),vfec_insp,vhor_ini,vhor_fin,vcod_reg,vcod_tco,vnum_inc,vnum_tar,vitm_aver);

  update disponibilidadtecnicos
	set est_disp=2
	where cod_tco=vcod_tco and fecha=vfec_insp and hor between vhor_ini and vhor_fin;

  update maquinariasucursal_x_incidente
  set est_aver=2
  where num_inc=vnum_inc and num_tar=vnum_tar;

 commit;
  select count(*) into vcant_Inc from
  maquinariasucursal_x_incidente
  where num_inc=vnum_inc;

  select count(*) into vcant_oti from
  ordentrabajoinspeccion
  where num_inc=vnum_inc;

  if vcant_Inc = vcant_oti then
  update incidente
  set est_inc=2
  where num_inc=vnum_inc ;
  end if;


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
      from materiales m inner join tabladetablas tt on m.tip_mat = tt.cod_item_tab and tt.cod_tab=15 and tt.cod_item_tab<>0
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
      from materiales m inner join tabladetablas tt on m.tip_mat = tt.cod_item_tab and tt.cod_tab=15 and tt.cod_item_tab<>0
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
 IN descripcion varchar(1000),
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
 IN vnum_ord_trab char(6)
 )
BEGIN

SELECT  distinct
  ot.num_ord_trab,
  cli.direc_cli,
  cli.raz_soc_cli,
  ot.fec_ord_trab,
  tec.cod_tco,
  CONCAT(tec.ape_pat_tco,' ',tec.ape_pat_tco,', ',tec.nom_tco) nom_tec,
  pot.hor_ini,
	pot.hor_fin
FROM ordentrabajo ot
inner join paquete_x_ot pot on ot.num_ord_trab=pot.num_ord_trab
inner join tecnico_x_paquete_x_ot tpot on pot.cod_paq=tpot.cod_paq
and pot.num_ord_trab=tpot.num_ord_trab
inner join tecnico tec on tpot.cod_tco=tec.cod_tco
inner join incidente inc on ot.num_inc=inc.num_inc
inner join cliente cli on inc.cod_cli=cli.cod_cli
WHERE ot.num_ord_trab = vnum_ord_trab;

END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_buscarMaquinarias` $$
CREATE PROCEDURE `pr_buscarMaquinarias`(
 IN vRazSocCliente varchar(150),
 IN vMarca varchar(200),
 IN vModelo varchar(50)
)
BEGIN

SELECT
       ms.num_tar,
       ms.num_serie_maq,
       ms.num_suc,
       m.cod_maq,
       m.desc_maq,
       mc.desc_mar_maq,
       m.mod_maq,
       t.desc_tip_maq,
       c.raz_soc_cli,
       d.dist sucursal
FROM maquinariasucursal ms inner join maquinaria m
on ms.cod_maq=m.cod_maq
inner join cliente c on ms.cod_cli=c.cod_cli
inner join sucursal s on ms.cod_cli=s.cod_cli and
ms.num_suc=s.num_suc inner join vw_distritos d
on s.dist_suc=d.cod_dist
inner join vw_tipo_maquinaria t on m.tip_maq=t.tip_maq
inner join vw_marcas mc on m.mar_maq=mc.mar_maq
WHERE c.raz_soc_cli like concat(vRazSocCliente,'%') and
mc.desc_mar_maq like concat(vMarca,'%') and
m.mod_maq like concat(vModelo,'%');

END $$

DROP PROCEDURE IF EXISTS `pr_reporteUtilizacionMaquinarias` $$
CREATE PROCEDURE `pr_reporteUtilizacionMaquinarias`(
 IN vnum_tar char(6)
 )
BEGIN

SELECT  cli.cod_cli,
        cli.raz_soc_cli,
        ms.num_tar,
        mq.desc_maq,
        ms.med_horom,
        ms.fech_ult_med_hor,
        ms.fec_adquisicion,
        ROUND(((med_horom/(datediff(fech_ult_med_hor,fec_adquisicion)))*100)/24,1) as porcentaje
FROM cliente cli inner join sucursal suc
on cli.cod_cli = suc.cod_cli
inner join maquinariasucursal ms
on ms.num_suc = suc.num_suc
and ms.cod_cli = suc.cod_cli
inner join maquinaria mq
on ms.cod_maq = mq.cod_maq
where ms.num_tar = vnum_tar;

END $$



DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarPaquete` $$
CREATE PROCEDURE `pr_insertarPaquete`(
  IN v_cod_pac      char(6),
  IN v_fec_reg_paq  date,
  IN v_cod_reg      char(6),
  IN v_nom_paq      varchar(150),
  IN v_cod_maq      char(6),
  IN v_cant_tec_paq int,
  IN v_cant_hor_paq int,
  IN v_interv_horom int
)
BEGIN

  insert into paquete (cod_paq, fec_reg_paq, cod_reg, nom_paq, cod_maq, cant_tec_paq, cant_hor_paq, interv_horom)
  values (v_cod_pac, v_fec_reg_paq, v_cod_reg, v_nom_paq, v_cod_maq, v_cant_tec_paq, v_cant_hor_paq, v_interv_horom);

END $$


DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarHerramientas_Paquete` $$
CREATE PROCEDURE `pr_insertarHerramientas_Paquete`(
  IN v_cod_pac      char(6),
  IN v_cod_herr     char(5),
  IN v_cantidad     int

)
BEGIN

  insert into herramientas_x_paquete (cod_paq, cod_herr, cantidad)
  values (v_cod_pac, v_cod_herr, v_cantidad);

END $$



DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarMateriales_Paquete` $$
CREATE PROCEDURE `pr_insertarMateriales_Paquete`(
  IN v_cod_mat      char(6),
  IN v_cod_pac     char(6),
  IN v_cantidad     int

)
BEGIN

  insert into materiales_x_paquete (cod_mat, cod_paq, cantidad)
  values (v_cod_mat, v_cod_pac, v_cantidad);

END $$



DROP PROCEDURE IF EXISTS `mskbd`.`pr_insertarActividad_Paquete` $$
CREATE PROCEDURE `pr_insertarActividad_Paquete`(
  IN v_cod_pac      char(6),
  IN v_num_item  int,
  IN v_desc_act     varchar(150)

)
BEGIN

  insert into actividades (cod_paq, num_item, desc_act)
  values (v_cod_pac, v_num_item, v_desc_act);

END $$

DROP PROCEDURE IF EXISTS `mskbd`.`pr_agregarMaquinariaXIncidente` $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `pr_agregarMaquinariaXIncidente`(
 IN codIncidente char (6),
 IN tarjeta char (6),
 IN decripAveria varchar(300),
 IN naturaleza int(11),
 IN item int(11)
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
                      item,
                      decripAveria,
                      naturaleza,
                      1);

update maquinariasucursal set est_maq=2 where num_tar=tarjeta;

END $$




DELIMITER ;

USE mskbd;

INSERT tabladetablas (cod_tab, cod_item_tab, desc_tab)
VALUES (1, 0, 'Estado usuario'),
		   (1, 1, 'Activo'),
		   (1, 2, 'Inactivo'),
	   (2, 0, 'Estado factura'),
		   (2, 1, 'Registrada'),
		   (2, 2, 'Cancelada'),
       (3, 0, 'Estado incidente'),
	       (3, 1, 'Pendiente'),
	       (3, 2, 'Revisado'),
	       (3, 3, 'En ejecución'),
	       (3, 4, 'Atendido'),
		   (3, 5, 'Liquidado'),
       (4, 0, 'Estado liquidacion'),
	       (4, 1, 'Pendiente'),
	       (4, 2, 'Facturado'),
       (5, 0, 'Estado Orden Trabajo'),
	       (5, 1, 'Pendiente'),
	       (5, 2, 'Atendido'),
       (6, 0, 'Estado prefactura'),
	       (6, 1, 'Generada'),
	       (6, 2, 'Aprobada'),
	       (6, 3, 'Rechazada'),
       (7, 0, 'Estado técnico'),
	       (7, 1, 'Activo'),
	       (7, 2, 'Inactivo'),
       (8, 0, 'Estado disponib. técnico'),
	       (8, 1, 'Disponible'),
	       (8, 2, 'No disponible'),
       (9, 0, 'Estado averia'),
	       (9, 1, 'Pendiente'),
	       (9, 2, 'Por inspeccionar'),
	       (9, 3, 'Por reparar'),
       (10, 0, 'Naturaleza averia'),
       	   (10, 1, 'Hidráulica'),
       	   (10, 2, 'Mecánica'),
       	   (10, 3, 'Eléctrica'),
       	   (10, 4, 'Neumática'),
       	   (10, 5, 'Otro'),
       (11, 0, 'Nivel técnico'),
	       (11, 1, 'Junior'),
	       (11, 2, 'Master'),
	       (11, 3, 'Senior'),
       (12, 0, 'Especialidad técnico'),
	       (12, 1, 'Tco. Hidráulico'),
	       (12, 2, 'Tco. Mecanico'),
	       (12, 3, 'Tco. Electrico'),
	       (12, 4, 'Tco. Neumático'),
	       (12, 5, 'Otro'),
       (13, 0, 'Servicios prestados'),
 	      (13, 1, 'Servicio Tecnico'),
 	      (13, 2, 'Repuestos e insumos'),
 	      (13, 3, 'Gastos adicionales'),
       (14, 0, 'Distritos'),
		  (14, 1,'Cercado'),
		  (14, 2,'ancon'),
		  (14, 3,'Ate'),
		  (14, 4,'Barranco'),
		  (14, 5,'Breña'),
		  (14, 6,'Carabayllo'),
		  (14, 7,'Comas'),
		  (14, 8,'Chaclacayo'),
		  (14, 9,'Chorrillos'),
		  (14, 10,'El Agustino'),
		  (14, 11,'Jesus Maria'),
		  (14, 12,'La Molina'),
		  (14, 13,'La Victoria'),
		  (14, 14,'Lince'),
		  (14, 15,'Lurigancho'),
		  (14, 16,'Lurin'),
		  (14, 17,'Magdalena'),
		  (14, 18,'Miraflores'),
		  (14, 19,'Pachacamac'),
		  (14, 20,'Pucusana'),
		  (14, 21,'Pueblo Libre'),
		  (14, 22,'Puente Piedra'),
		  (14, 23,'Punta Negra'),
		  (14, 24,'Punta Hermosa'),
		  (14, 25,'Rimac'),
		  (14, 26,'San Bartolo'),
		  (14, 27,'San Isidro'),
		  (14, 28,'Independencia'),
		  (14, 29,'San Juan de Miraflores'),
		  (14, 30,'San Luis'),
		  (14, 31,'San Martin de Porres'),
		  (14, 32,'San Miguel'),
		  (14, 33,'Santiago de Surco'),
		  (14, 34,'Surquillo'),
		  (14, 35,'Villa Maria del Triunfo'),
		  (14, 36,'San Juan de Lurigancho'),
		  (14, 37,'Santa Maria del Mar'),
		  (14, 38,'Santa Rosa'),
		  (14, 39,'Los Olivos'),
		  (14, 40,'Cieneguilla'),
		  (14, 41,'San Borja'),
		  (14, 42,'Villa el Salvador'),
		  (14, 43,'Santa Anita'),
       (15, 0, 'Tipos de material'),
	       (15, 1, 'Pegamento'),
	       (15, 2, 'Tubería'),
	       (15, 3, 'Soldadura'),
	       (15, 4, 'Tuerca'),
	       (15, 5, 'Insumo'),
       (16, 0, 'Estado maquinaria_x_sucursal'),
	       (16, 1, 'Operativo'),
	       (16, 2, 'Inoperativo'),
	       (16, 3, 'Malo'),
	       (16, 4, 'Inoperativo'),
       (17, 0, 'Tipo de maquinaria'),
	       (17, 1, 'Construcción'),
	       (17, 2, 'Logística'),
	       (17, 3, 'Portuario'),
       (18, 0, 'Marca de maquinaria'),
	       (18, 1, 'Komatsu'),
	       (18, 2, 'Caterpillar'),
	       (18, 3, 'John Deere'),
	       (18, 4, 'New Holland'),
	       (18, 5, 'Case'),
	       (18, 6, 'Samsung'),
	       (18, 7, 'Dynapac'),
		(19, 0, 'Estado Talonario'),
		   (19,1,'Disponible'),
	       (19,2,'Usado'),
		   (19,3,'Anulado');
	   

/*NOTA: el password está encriptado mediante SHA1 y es igual al username*/
INSERT usuario (cod_usr, dni_usr, ape_pat_usr, ape_mat_usr, nom_usr, dom_usr, tel_usr, cargo_usr, username, password, est_usr)
VALUES ('RG001', '09751173', 'Neyra', 'Mercado', 'Claudio Jesús', 'Calle José Álvares Calderón 410 San Borja', '2248550', 'Jefe de Planificación', 'claudio', 'c3923186c4c9da9c766af46f22a325cd4677020a', 1),
	   ('RG002', '04551756', 'Lopez', 'Munar', 'Karla', 'Calle Los Ficus 410 La Victoria', '3457234', 'Liquidadora', 'karla', '0a256b03b037ab5d3e559f13905b682edcc3ddaf', 1),
	   ('RG003', '98887750', 'Melendez', 'Castro', 'Daniel', 'Calle José Álvares Calderón 410 San Borja', '6098764', 'Encargado Area Comercial', 'daniel', '3d0f3b9ddcacec30c4008c5e030e6c13a478cb4f', 1),				
	   ('RG004', '45457207', 'Pinco', 'Mendo', 'Christian', 'Av. Los Pinos 333 La Molina', '3456754', 'Liquidador', 'pinco', '0dc8b5e57986cabb75f80a13e7e9ce06f68a0dac', 1),
	   ('RG005', '23666358', 'Muñoz', 'Marca', 'Romualdo', 'Calle Los Pobres Locos 111 Miraflores', '3456754', 'Encargado Area Comercial', 'aldo', '1c89c0f71ac97754ffc597c567d01b2ade0c9324', 1),
	   ('RG006', '86766888', 'Hipólito', 'Castañeda', 'Juan Carlos', 'Av La Esperanza 455 San Isidro', '3456754', 'Administrador del Sistema', 'juanca', '47732e97b4753c952ffa6f4eb51846c4e1308c79', 1),
	   ('RG007', '56664467', 'Huaman', 'Reyes', 'Juan Ernesto', 'Av La Esperanza 455 San Isidro', '3456754', 'Liquidador', 'juan', 'b49a5780a99ea81284fc0746a78f84a30e4d5c73', 2);	   

	   
INSERT rol (cod_rol, desc_rol) 
VALUES ('01','Administrador Sistema'),
	   ('02','Jefe de Planificación'),
	   ('03','Liquidador'),	
	   ('04','Encargado Area Comercial');
	   
INSERT rol_x_usuario (cod_rol, cod_usr) 
VALUES ('02', 'RG001'),
	   ('03', 'RG002'),
	   ('04', 'RG003'),	
	   ('03', 'RG004'),	
	   ('04', 'RG005'),	 
	   ('01', 'RG006'),	 	   
	   ('02', 'RG006'),
	   ('03', 'RG007');	 	  
	   
INSERT cliente
VALUES ('CL0001','2006-01-15','RG001','10097511735','Barcos Modernos S.A.','barmod@bmod.com','Cliente aduanero','av. argentina 4028 callao'),
       ('CL0002','2006-01-15','RG001','10055458035','Helados A S.A.','heladddd@bmod.com','Venda de helados a empresas','av. foucett 4540'),
       ('CL0003','2006-01-15','RG001','10884122215','Carga Empresarial S.A.C.','cargemp@cessac.com','Tramsporte de containers','av Wiesse');
	   
INSERT sucursal
VALUES ('CL0001','001',2,'Calle Las Flores 334','9765432','5432199','Ing. Flores Perez',0),
	   ('CL0001','002',10,'Av Precursores 441','9870023','9733356','Sr. López',1),
	   ('CL0002','001',31,'Los Ficus 344','4332123',null,'Ing. Lopez Gutierrez',0),
	   ('CL0003','001',22,'Las Artes 4566','3456789','9875554','Carlos Alvarez',1),
	   ('CL0003','002',13,'Av República Canarias 556','3456789','9875554','Carlos Alvarez',1);
       
INSERT maquinaria
VALUES ('MQ001', 'Montacargas', 2, 'R9-TW5T', 1),
	   ('MQ002', 'Pala mecánica', 2, 'RT-QWEE', 1),
	   ('MQ003', 'Grúa Pórtico', 3, 'YU-DCSD', 3),
	   ('MQ004', 'Grúa Aérea', 4, '55-09HH3', 2),	   
	   ('MQ005', 'Niveladora de Terreno', 6, '555GGG3', 1),
	   ('MQ006', 'Excavadora de oruga', 1, 'UUUH-TTTT5', 1);	   
	  
	   
INSERT maquinariasucursal
VALUES ('NT0001', 'LQW542SDD1AAS', 1221, '2009-09-12', 'CL0001','001', 'MQ001', 1, '2006-10-15'),
	   ('NT0002', '55ED55777884655', 7775, '2008-11-06', 'CL0001','001', 'MQ002', 1, '2006-09-11'),
	   ('NT0003', 'JJH6FF7753GD', 8857, '2008-10-13', 'CL0002','001', 'MQ005', 1, '2003-01-11'),
	   ('NT0004', '9988HDYDGH5456', 2234, '2008-06-22', 'CL0003','001', 'MQ004', 1, '2005-10-15'),
	   ('NT0005', '00HRHJR55GH-JJ', 89965, '2008-08-16', 'CL0003','001', 'MQ006', 1, '2005-10-15'),
	   ('NT0006', 'GGKKRFR557DDUJ', 55664, '2008-07-26', 'CL0003','002', 'MQ003', 1, '2002-10-15'),
	   ('NT0007', '877JJJ8888HJJ7', 99976, '2008-03-02', 'CL0002','001', 'MQ002', 1, '2006-10-15'),
	   ('NT0008', '7UUUY88RT3I5T', 44555, '2009-11-15', 'CL0002','001', 'MQ002', 1, '2007-10-15');


INSERT incidente
VALUES ('IN0001', '2007-05-23', 'RG003', 'CL0001', '001', null, 1),
       ('IN0002', '2007-06-01', 'RG003', 'CL0002', '001', null, 1),
       ('IN0003', '2007-05-23', 'RG005', 'CL0003', '001', null, 1);

INSERT maquinariasucursal_x_incidente
VALUES ('IN0001', 'NT0001', 1, 'Rotura de amortiguador', 2, null, 2),
	   ('IN0001', 'NT0002', 2, 'Desgaste de eje de transmisión', 2, null, 2),
	   ('IN0002', 'NT0005', 1, 'Cortocircuito tablero de mando', 3, null, 2),
	   ('IN0002', 'NT0007', 2, 'Rotura de sistema hidráulico de transmisión', 1, null, 1),
	   ('IN0003', 'NT0003', 1, 'Rotura de cable elevador', 4, null, 2),
	   ('IN0003', 'NT0006', 2, 'Rotura de pala excavadora', 2, null, 2);
	   
/*----------------------------- INSERTS CHRISTIAN ----------------------------------------*/
	   
insert into tecnico(cod_tco,ape_pat_tco,ape_mat_tco,nom_tco,niv_tco,esp_tco,est_tco,tar_hor)
values('TC001','Valencia','Valencia','Arthuro',1,1,1,12),
      ('TC002','Rodriguez','Asto','Carlos Emilio',2,1,1,15),
      ('TC003','Mendoza','Leon','Juan',1,2,1,10),
      ('TC004','Benavidez','Goyzueta','Pedro',3,1,1,12),
      ('TC005','Castañeda','Lossio','Fernando',1,1,1,16);

/*--------------------  LLENAR DISPONIBILIDAD DE TECNICOS PARA EL AÑO 2010 --------------------  */
CALL pr_llenarDisponibilidadTecnicos(2010);      

                
insert into paquete(cod_paq,fec_reg_paq,cod_reg,nom_paq,cod_maq,cant_tec_paq,cant_hor_paq,interv_horom)
values('PQ0001','2009-01-05','RG001','Paquete1','MQ001',2,2,500),
      ('PQ0002','2009-06-06','RG002','Paquete2','MQ001',3,4,120),
      ('PQ0003','2009-10-10','RG001','Paquete3','MQ001',1,2,300),
      ('PQ0004','2009-12-12','RG003','Paquete4','MQ001',1,1,150),
      ('PQ0005','2009-11-02','RG002','Paquete5','MQ002',2,3,250),	   
      ('PQ0006','2009-10-21','RG002','Paquete6','MQ002',3,2,323),	   
      ('PQ0007','2010-01-02','RG002','Paquete7','MQ002',2,3,444),	   
      ('PQ0008','2010-01-02','RG002','Paquete8','MQ003',1,4,566),
      ('PQ0009','2010-01-02','RG002','Paquete9','MQ003',2,3,453),     
      ('PQ0010','2010-01-02','RG002','Paquete10','MQ003',3,2,250),      
      ('PQ0011','2010-01-02','RG002','Paquete11','MQ003',2,1,654),
      ('PQ0012','2010-01-02','RG002','Paquete12','MQ004',4,2,1234),
      ('PQ0013','2010-01-02','RG002','Paquete13','MQ004',3,3,5433),
      ('PQ0014','2010-01-02','RG002','Paquete14','MQ004',2,3,100),     
      ('PQ0015','2010-01-02','RG002','Paquete15','MQ004',1,2,250),
      ('PQ0016','2010-01-02','RG002','Paquete16','MQ005',2,4,600),      
      ('PQ0017','2010-01-02','RG002','Paquete17','MQ005',3,3,560),
      ('PQ0018','2010-01-02','RG002','Paquete18','MQ005',2,2,780),      
      ('PQ0019','2010-01-02','RG002','Paquete19','MQ005',3,4,1400),      
      ('PQ0020','2010-01-02','RG002','Paquete20','MQ005',2,3,2360),
      ('PQ0021','2010-01-02','RG002','Paquete21','MQ006',4,1,344),      
      ('PQ0022','2010-01-02','RG002','Paquete22','MQ006',2,2,300),      
      ('PQ0023','2010-01-02','RG002','Paquete23','MQ006',2,2,250),      
      ('PQ0024','2010-01-02','RG002','Paquete24','MQ006',2,3,988),      
      ('PQ0025','2010-01-02','RG002','Paquete25','MQ006',1,3,5667),      
      ('PQ0026','2010-01-02','RG002','Paquete26','MQ006',2,2,5666);      
      
      
/*----------------------------- FIN INSERTS CHRISTIAN ----------------------------------------*/	   
	   
insert herramienta values(cod_herr,desc_herr),
('HR001','tornillo'),
('HR002','tuerca'),
('HR003','alicate'),
('HR004','taladro'),
('HR005','aceite'),
('HR006','bomba hidraulica'),
('HR007','manquera'),
('HR008','gato hidraulico'),
('HR009','cilindro de traccion'),
('HR010','bomba hidroneumatica');

insert materiales
values('MA0000',0,'null','null',0),
      ('MA0001',1,'Agitadores de Pulpa','unidad',5.50),
 ('MA0002',2,'Aditivo','kilo',5.50),
 ('MA0003',3,'aceite','litro',5.50),
 ('MA0004',4,'aceite','litro',5.50);


/*------------------------*/

INSERT materiales_x_paquete VALUES('MA0001','PQ0001',10),
('MA0002','PQ0001',5),
('MA0003','PQ0001',5),
('MA0004','PQ0001',5);

INSERT prefactura VALUES('PF0001','2010-01-01','RG003','Paquete utilizado por primera vez en esta maquinaria',1, 23423.34),
('PF0002','2010-01-01','RG003','Paquete necesita hacer una revision en costo',2, 45665.34),
('PF0003','2010-01-01','RG003','Cliente no esta conforme con el precio',3, 69666.33);

INSERT ordentrabajo VALUES('OT0001','2010-01-01','RG003','IN0001','NT0001',1,1),
('OT0002','2010-01-01','RG003','IN0001','NT0001',1,1),
('OT0003','2010-01-01','RG003','IN0001','NT0001',1,1);


INSERT liquidacion VALUES('LQ0001','OT0001','PF0001','2010-01-01','RG003','Cambios','Se descubrio que en esta maquinaria se dejo de lado la manipulacion de una parte importante de la reparacion del motor',1);

INSERT materiales_x_liquidacion VALUES('LQ0001','MA0001',1,'NULL',5,5.50,27.50);

INSERT actividades VALUES('PQ0001',1,'El tecnico reazliara cambio de partes danadas'),
	('PQ0001',2,'El tecnico verificara el funcionamiento correcto del cambio');




/*????????????????????????????????????????????????????*/
INSERT INTO talonario  VALUES  ('001','00001',1);
INSERT INTO talonario  VALUES  ('001','00002',1);
INSERT INTO talonario  VALUES  ('001','00003',1);
INSERT INTO talonario  VALUES  ('001','00004',1);
INSERT INTO talonario  VALUES  ('001','00005',1);
INSERT INTO talonario  VALUES  ('001','00006',1);
INSERT INTO talonario  VALUES  ('001','00007',1);
INSERT INTO talonario  VALUES  ('001','00008',1);
INSERT INTO talonario  VALUES  ('001','00009',1);
INSERT INTO talonario  VALUES  ('001','00010',1);
INSERT INTO talonario  VALUES  ('001','00011',1);
INSERT INTO talonario  VALUES  ('001','00012',1);
INSERT INTO talonario  VALUES  ('001','00013',1);
INSERT INTO talonario  VALUES  ('001','00014',1);
INSERT INTO talonario  VALUES  ('001','00015',1);
INSERT INTO talonario  VALUES  ('001','00016',1);
INSERT INTO talonario  VALUES  ('001','00017',1);
INSERT INTO talonario  VALUES  ('001','00018',1);
INSERT INTO talonario  VALUES  ('001','00019',1);
INSERT INTO talonario  VALUES  ('001','00020',1);
INSERT INTO talonario  VALUES  ('001','00021',1);
INSERT INTO talonario  VALUES  ('001','00022',1);
INSERT INTO talonario  VALUES  ('001','00023',1);
INSERT INTO talonario  VALUES  ('001','00024',1);
INSERT INTO talonario  VALUES  ('001','00025',1);
INSERT INTO talonario  VALUES  ('001','00026',1);
INSERT INTO talonario  VALUES  ('001','00027',1);
INSERT INTO talonario  VALUES  ('001','00028',1);
INSERT INTO talonario  VALUES  ('001','00029',1);
INSERT INTO talonario  VALUES  ('001','00030',1);
INSERT INTO talonario  VALUES  ('001','00031',1);
INSERT INTO talonario  VALUES  ('001','00032',1);
INSERT INTO talonario  VALUES  ('001','00033',1);
INSERT INTO talonario  VALUES  ('001','00034',1);
INSERT INTO talonario  VALUES  ('001','00035',1);
INSERT INTO talonario  VALUES  ('001','00036',1);
INSERT INTO talonario  VALUES  ('001','00037',1);
INSERT INTO talonario  VALUES  ('001','00038',1);
INSERT INTO talonario  VALUES  ('001','00039',1);
INSERT INTO talonario  VALUES  ('001','00040',1);
INSERT INTO talonario  VALUES  ('001','00041',1);
INSERT INTO talonario  VALUES  ('001','00042',1);
INSERT INTO talonario  VALUES  ('001','00043',1);
INSERT INTO talonario  VALUES  ('001','00044',1);
INSERT INTO talonario  VALUES  ('001','00045',1);
INSERT INTO talonario  VALUES  ('001','00046',1);
INSERT INTO talonario  VALUES  ('001','00047',1);
INSERT INTO talonario  VALUES  ('001','00048',1);
INSERT INTO talonario  VALUES  ('001','00049',1);
INSERT INTO talonario  VALUES  ('001','00050',1);
INSERT INTO talonario  VALUES  ('001','00051',1);
INSERT INTO talonario  VALUES  ('001','00052',1);
INSERT INTO talonario  VALUES  ('001','00053',1);
INSERT INTO talonario  VALUES  ('001','00054',1);
INSERT INTO talonario  VALUES  ('001','00055',1);
INSERT INTO talonario  VALUES  ('001','00056',1);
INSERT INTO talonario  VALUES  ('001','00057',1);
INSERT INTO talonario  VALUES  ('001','00058',1);
INSERT INTO talonario  VALUES  ('001','00059',1);
INSERT INTO talonario  VALUES  ('001','00060',1);
INSERT INTO talonario  VALUES  ('001','00061',1);
INSERT INTO talonario  VALUES  ('001','00062',1);
INSERT INTO talonario  VALUES  ('001','00063',1);
INSERT INTO talonario  VALUES  ('001','00064',1);
INSERT INTO talonario  VALUES  ('001','00065',1);
INSERT INTO talonario  VALUES  ('001','00066',1);
INSERT INTO talonario  VALUES  ('001','00067',1);
INSERT INTO talonario  VALUES  ('001','00068',1);
INSERT INTO talonario  VALUES  ('001','00069',1);
INSERT INTO talonario  VALUES  ('001','00070',1);
INSERT INTO talonario  VALUES  ('001','00071',1);
INSERT INTO talonario  VALUES  ('001','00072',1);
INSERT INTO talonario  VALUES  ('001','00073',1);
INSERT INTO talonario  VALUES  ('001','00074',1);
INSERT INTO talonario  VALUES  ('001','00075',1);
INSERT INTO talonario  VALUES  ('001','00076',1);
INSERT INTO talonario  VALUES  ('001','00077',1);
INSERT INTO talonario  VALUES  ('001','00078',1);
INSERT INTO talonario  VALUES  ('001','00079',1);
INSERT INTO talonario  VALUES  ('001','00080',1);
INSERT INTO talonario  VALUES  ('001','00081',1);
INSERT INTO talonario  VALUES  ('001','00082',1);
INSERT INTO talonario  VALUES  ('001','00083',1);
INSERT INTO talonario  VALUES  ('001','00084',1);
INSERT INTO talonario  VALUES  ('001','00085',1);
INSERT INTO talonario  VALUES  ('001','00086',1);
INSERT INTO talonario  VALUES  ('001','00087',1);
INSERT INTO talonario  VALUES  ('001','00088',1);
INSERT INTO talonario  VALUES  ('001','00089',1);
INSERT INTO talonario  VALUES  ('001','00090',1);
INSERT INTO talonario  VALUES  ('001','00091',1);
INSERT INTO talonario  VALUES  ('001','00092',1);
INSERT INTO talonario  VALUES  ('001','00093',1);
INSERT INTO talonario  VALUES  ('001','00094',1);
INSERT INTO talonario  VALUES  ('001','00095',1);
INSERT INTO talonario  VALUES  ('001','00096',1);
INSERT INTO talonario  VALUES  ('001','00097',1);
INSERT INTO talonario  VALUES  ('001','00098',1);
INSERT INTO talonario  VALUES  ('001','00099',1);
INSERT INTO talonario  VALUES  ('001','00100',1);
INSERT INTO talonario  VALUES  ('001','00101',1);
INSERT INTO talonario  VALUES  ('001','00102',1);
INSERT INTO talonario  VALUES  ('001','00103',1);
INSERT INTO talonario  VALUES  ('001','00104',1);
INSERT INTO talonario  VALUES  ('001','00105',1);
INSERT INTO talonario  VALUES  ('001','00106',1);
INSERT INTO talonario  VALUES  ('001','00107',1);
INSERT INTO talonario  VALUES  ('001','00108',1);
INSERT INTO talonario  VALUES  ('001','00109',1);
INSERT INTO talonario  VALUES  ('001','00110',1);
INSERT INTO talonario  VALUES  ('001','00111',1);
INSERT INTO talonario  VALUES  ('001','00112',1);
INSERT INTO talonario  VALUES  ('001','00113',1);
INSERT INTO talonario  VALUES  ('001','00114',1);
INSERT INTO talonario  VALUES  ('001','00115',1);
INSERT INTO talonario  VALUES  ('001','00116',1);
INSERT INTO talonario  VALUES  ('001','00117',1);
INSERT INTO talonario  VALUES  ('001','00118',1);
INSERT INTO talonario  VALUES  ('001','00119',1);
INSERT INTO talonario  VALUES  ('001','00120',1);
INSERT INTO talonario  VALUES  ('001','00121',1);
INSERT INTO talonario  VALUES  ('001','00122',1);
INSERT INTO talonario  VALUES  ('001','00123',1);
INSERT INTO talonario  VALUES  ('001','00124',1);
INSERT INTO talonario  VALUES  ('001','00125',1);
INSERT INTO talonario  VALUES  ('001','00126',1);
INSERT INTO talonario  VALUES  ('001','00127',1);
INSERT INTO talonario  VALUES  ('001','00128',1);
INSERT INTO talonario  VALUES  ('001','00129',1);
INSERT INTO talonario  VALUES  ('001','00130',1);
INSERT INTO talonario  VALUES  ('001','00131',1);
INSERT INTO talonario  VALUES  ('001','00132',1);
INSERT INTO talonario  VALUES  ('001','00133',1);
INSERT INTO talonario  VALUES  ('001','00134',1);
INSERT INTO talonario  VALUES  ('001','00135',1);
INSERT INTO talonario  VALUES  ('001','00136',1);
INSERT INTO talonario  VALUES  ('001','00137',1);
INSERT INTO talonario  VALUES  ('001','00138',1);
INSERT INTO talonario  VALUES  ('001','00139',1);
INSERT INTO talonario  VALUES  ('001','00140',1);
INSERT INTO talonario  VALUES  ('001','00141',1);
INSERT INTO talonario  VALUES  ('001','00142',1);
INSERT INTO talonario  VALUES  ('001','00143',1);
INSERT INTO talonario  VALUES  ('001','00144',1);
INSERT INTO talonario  VALUES  ('001','00145',1);
INSERT INTO talonario  VALUES  ('001','00146',1);
INSERT INTO talonario  VALUES  ('001','00147',1);
INSERT INTO talonario  VALUES  ('001','00148',1);
INSERT INTO talonario  VALUES  ('001','00149',1);
INSERT INTO talonario  VALUES  ('001','00150',1);
INSERT INTO talonario  VALUES  ('001','00151',1);
INSERT INTO talonario  VALUES  ('001','00152',1);
INSERT INTO talonario  VALUES  ('001','00153',1);
INSERT INTO talonario  VALUES  ('001','00154',1);
INSERT INTO talonario  VALUES  ('001','00155',1);
INSERT INTO talonario  VALUES  ('001','00156',1);
INSERT INTO talonario  VALUES  ('001','00157',1);
INSERT INTO talonario  VALUES  ('001','00158',1);
INSERT INTO talonario  VALUES  ('001','00159',1);
INSERT INTO talonario  VALUES  ('001','00160',1);
INSERT INTO talonario  VALUES  ('001','00161',1);
INSERT INTO talonario  VALUES  ('001','00162',1);
INSERT INTO talonario  VALUES  ('001','00163',1);
INSERT INTO talonario  VALUES  ('001','00164',1);
INSERT INTO talonario  VALUES  ('001','00165',1);
INSERT INTO talonario  VALUES  ('001','00166',1);
INSERT INTO talonario  VALUES  ('001','00167',1);
INSERT INTO talonario  VALUES  ('001','00168',1);
INSERT INTO talonario  VALUES  ('001','00169',1);
INSERT INTO talonario  VALUES  ('001','00170',1);
INSERT INTO talonario  VALUES  ('001','00171',1);
INSERT INTO talonario  VALUES  ('001','00172',1);
INSERT INTO talonario  VALUES  ('001','00173',1);
INSERT INTO talonario  VALUES  ('001','00174',1);
INSERT INTO talonario  VALUES  ('001','00175',1);
INSERT INTO talonario  VALUES  ('001','00176',1);
INSERT INTO talonario  VALUES  ('001','00177',1);
INSERT INTO talonario  VALUES  ('001','00178',1);
INSERT INTO talonario  VALUES  ('001','00179',1);
INSERT INTO talonario  VALUES  ('001','00180',1);
INSERT INTO talonario  VALUES  ('001','00181',1);
INSERT INTO talonario  VALUES  ('001','00182',1);
INSERT INTO talonario  VALUES  ('001','00183',1);
INSERT INTO talonario  VALUES  ('001','00184',1);
INSERT INTO talonario  VALUES  ('001','00185',1);
INSERT INTO talonario  VALUES  ('001','00186',1);
INSERT INTO talonario  VALUES  ('001','00187',1);
INSERT INTO talonario  VALUES  ('001','00188',1);
INSERT INTO talonario  VALUES  ('001','00189',1);
INSERT INTO talonario  VALUES  ('001','00190',1);
INSERT INTO talonario  VALUES  ('001','00191',1);
INSERT INTO talonario  VALUES  ('001','00192',1);
INSERT INTO talonario  VALUES  ('001','00193',1);
INSERT INTO talonario  VALUES  ('001','00194',1);
INSERT INTO talonario  VALUES  ('001','00195',1);
INSERT INTO talonario  VALUES  ('001','00196',1);
INSERT INTO talonario  VALUES  ('001','00197',1);
INSERT INTO talonario  VALUES  ('001','00198',1);
INSERT INTO talonario  VALUES  ('001','00199',1);
INSERT INTO talonario  VALUES  ('001','00200',1);
INSERT INTO talonario  VALUES  ('001','00001',1);
INSERT INTO talonario  VALUES  ('001','00002',1);
INSERT INTO talonario  VALUES  ('001','00003',1);
INSERT INTO talonario  VALUES  ('001','00004',1);
INSERT INTO talonario  VALUES  ('001','00005',1);
INSERT INTO talonario  VALUES  ('001','00006',1);
INSERT INTO talonario  VALUES  ('001','00007',1);
INSERT INTO talonario  VALUES  ('001','00008',1);
INSERT INTO talonario  VALUES  ('001','00009',1);
INSERT INTO talonario  VALUES  ('001','00010',1);
INSERT INTO talonario  VALUES  ('001','00011',1);
INSERT INTO talonario  VALUES  ('001','00012',1);
INSERT INTO talonario  VALUES  ('001','00013',1);
INSERT INTO talonario  VALUES  ('001','00014',1);
INSERT INTO talonario  VALUES  ('001','00015',1);
INSERT INTO talonario  VALUES  ('001','00016',1);
INSERT INTO talonario  VALUES  ('001','00017',1);
INSERT INTO talonario  VALUES  ('001','00018',1);
INSERT INTO talonario  VALUES  ('001','00019',1);
INSERT INTO talonario  VALUES  ('001','00020',1);
INSERT INTO talonario  VALUES  ('001','00021',1);
INSERT INTO talonario  VALUES  ('001','00022',1);
INSERT INTO talonario  VALUES  ('001','00023',1);
INSERT INTO talonario  VALUES  ('001','00024',1);
INSERT INTO talonario  VALUES  ('001','00025',1);
INSERT INTO talonario  VALUES  ('001','00026',1);
INSERT INTO talonario  VALUES  ('001','00027',1);
INSERT INTO talonario  VALUES  ('001','00028',1);
INSERT INTO talonario  VALUES  ('001','00029',1);
INSERT INTO talonario  VALUES  ('001','00030',1);
INSERT INTO talonario  VALUES  ('001','00031',1);
INSERT INTO talonario  VALUES  ('001','00032',1);
INSERT INTO talonario  VALUES  ('001','00033',1);
INSERT INTO talonario  VALUES  ('001','00034',1);
INSERT INTO talonario  VALUES  ('001','00035',1);
INSERT INTO talonario  VALUES  ('001','00036',1);
INSERT INTO talonario  VALUES  ('001','00037',1);
INSERT INTO talonario  VALUES  ('001','00038',1);
INSERT INTO talonario  VALUES  ('001','00039',1);
INSERT INTO talonario  VALUES  ('001','00040',1);
INSERT INTO talonario  VALUES  ('001','00041',1);
INSERT INTO talonario  VALUES  ('001','00042',1);
INSERT INTO talonario  VALUES  ('001','00043',1);
INSERT INTO talonario  VALUES  ('001','00044',1);
INSERT INTO talonario  VALUES  ('001','00045',1);
INSERT INTO talonario  VALUES  ('001','00046',1);
INSERT INTO talonario  VALUES  ('001','00047',1);
INSERT INTO talonario  VALUES  ('001','00048',1);
INSERT INTO talonario  VALUES  ('001','00049',1);
INSERT INTO talonario  VALUES  ('001','00050',1);
INSERT INTO talonario  VALUES  ('001','00051',1);
INSERT INTO talonario  VALUES  ('001','00052',1);
INSERT INTO talonario  VALUES  ('001','00053',1);
INSERT INTO talonario  VALUES  ('001','00054',1);
INSERT INTO talonario  VALUES  ('001','00055',1);
INSERT INTO talonario  VALUES  ('001','00056',1);
INSERT INTO talonario  VALUES  ('001','00057',1);
INSERT INTO talonario  VALUES  ('001','00058',1);
INSERT INTO talonario  VALUES  ('001','00059',1);
INSERT INTO talonario  VALUES  ('001','00060',1);
INSERT INTO talonario  VALUES  ('001','00061',1);
INSERT INTO talonario  VALUES  ('001','00062',1);
INSERT INTO talonario  VALUES  ('001','00063',1);
INSERT INTO talonario  VALUES  ('001','00064',1);
INSERT INTO talonario  VALUES  ('001','00065',1);
INSERT INTO talonario  VALUES  ('001','00066',1);
INSERT INTO talonario  VALUES  ('001','00067',1);
INSERT INTO talonario  VALUES  ('001','00068',1);
INSERT INTO talonario  VALUES  ('001','00069',1);
INSERT INTO talonario  VALUES  ('001','00070',1);
INSERT INTO talonario  VALUES  ('001','00071',1);
INSERT INTO talonario  VALUES  ('001','00072',1);
INSERT INTO talonario  VALUES  ('001','00073',1);
INSERT INTO talonario  VALUES  ('001','00074',1);
INSERT INTO talonario  VALUES  ('001','00075',1);
INSERT INTO talonario  VALUES  ('001','00076',1);
INSERT INTO talonario  VALUES  ('001','00077',1);
INSERT INTO talonario  VALUES  ('001','00078',1);
INSERT INTO talonario  VALUES  ('001','00079',1);
INSERT INTO talonario  VALUES  ('001','00080',1);
INSERT INTO talonario  VALUES  ('001','00081',1);
INSERT INTO talonario  VALUES  ('001','00082',1);
INSERT INTO talonario  VALUES  ('001','00083',1);
INSERT INTO talonario  VALUES  ('001','00084',1);
INSERT INTO talonario  VALUES  ('001','00085',1);
INSERT INTO talonario  VALUES  ('001','00086',1);
INSERT INTO talonario  VALUES  ('001','00087',1);
INSERT INTO talonario  VALUES  ('001','00088',1);
INSERT INTO talonario  VALUES  ('001','00089',1);
INSERT INTO talonario  VALUES  ('001','00090',1);
INSERT INTO talonario  VALUES  ('001','00091',1);
INSERT INTO talonario  VALUES  ('001','00092',1);
INSERT INTO talonario  VALUES  ('001','00093',1);
INSERT INTO talonario  VALUES  ('001','00094',1);
INSERT INTO talonario  VALUES  ('001','00095',1);
INSERT INTO talonario  VALUES  ('001','00096',1);
INSERT INTO talonario  VALUES  ('001','00097',1);
INSERT INTO talonario  VALUES  ('001','00098',1);
INSERT INTO talonario  VALUES  ('001','00099',1);
INSERT INTO talonario  VALUES  ('001','00100',1);
INSERT INTO talonario  VALUES  ('001','00101',1);
INSERT INTO talonario  VALUES  ('001','00102',1);
INSERT INTO talonario  VALUES  ('001','00103',1);
INSERT INTO talonario  VALUES  ('001','00104',1);
INSERT INTO talonario  VALUES  ('001','00105',1);
INSERT INTO talonario  VALUES  ('001','00106',1);
INSERT INTO talonario  VALUES  ('001','00107',1);
INSERT INTO talonario  VALUES  ('001','00108',1);
INSERT INTO talonario  VALUES  ('001','00109',1);
INSERT INTO talonario  VALUES  ('001','00110',1);
INSERT INTO talonario  VALUES  ('001','00111',1);
INSERT INTO talonario  VALUES  ('001','00112',1);
INSERT INTO talonario  VALUES  ('001','00113',1);
INSERT INTO talonario  VALUES  ('001','00114',1);
INSERT INTO talonario  VALUES  ('001','00115',1);
INSERT INTO talonario  VALUES  ('001','00116',1);
INSERT INTO talonario  VALUES  ('001','00117',1);
INSERT INTO talonario  VALUES  ('001','00118',1);
INSERT INTO talonario  VALUES  ('001','00119',1);
INSERT INTO talonario  VALUES  ('001','00120',1);
INSERT INTO talonario  VALUES  ('001','00121',1);
INSERT INTO talonario  VALUES  ('001','00122',1);
INSERT INTO talonario  VALUES  ('001','00123',1);
INSERT INTO talonario  VALUES  ('001','00124',1);
INSERT INTO talonario  VALUES  ('001','00125',1);
INSERT INTO talonario  VALUES  ('001','00126',1);
INSERT INTO talonario  VALUES  ('001','00127',1);
INSERT INTO talonario  VALUES  ('001','00128',1);
INSERT INTO talonario  VALUES  ('001','00129',1);
INSERT INTO talonario  VALUES  ('001','00130',1);
INSERT INTO talonario  VALUES  ('001','00131',1);
INSERT INTO talonario  VALUES  ('001','00132',1);
INSERT INTO talonario  VALUES  ('001','00133',1);
INSERT INTO talonario  VALUES  ('001','00134',1);
INSERT INTO talonario  VALUES  ('001','00135',1);
INSERT INTO talonario  VALUES  ('001','00136',1);
INSERT INTO talonario  VALUES  ('001','00137',1);
INSERT INTO talonario  VALUES  ('001','00138',1);
INSERT INTO talonario  VALUES  ('001','00139',1);
INSERT INTO talonario  VALUES  ('001','00140',1);
INSERT INTO talonario  VALUES  ('001','00141',1);
INSERT INTO talonario  VALUES  ('001','00142',1);
INSERT INTO talonario  VALUES  ('001','00143',1);
INSERT INTO talonario  VALUES  ('001','00144',1);
INSERT INTO talonario  VALUES  ('001','00145',1);
INSERT INTO talonario  VALUES  ('001','00146',1);
INSERT INTO talonario  VALUES  ('001','00147',1);
INSERT INTO talonario  VALUES  ('001','00148',1);
INSERT INTO talonario  VALUES  ('001','00149',1);
INSERT INTO talonario  VALUES  ('001','00150',1);

USE mskbd;

CREATE OR REPLACE 
    VIEW vw_usuarios_y_roles
    AS 
    SELECT u.cod_usr, u.ape_pat_usr, u.ape_mat_usr, u.nom_usr, r.cod_rol, r.desc_rol FROM usuario u INNER JOIN rol_x_usuario ru
	ON u.cod_usr = ru.cod_usr INNER JOIN rol r ON ru.cod_rol = r.cod_rol;
	
DROP VIEW IF EXISTS `vw_rptgastosxmaquinaria`;
CREATE VIEW `vw_rptgastosxmaquinaria` AS
select cli.raz_soc_cli,
      ic.num_inc,
      ic.fec_inc,
      ms.num_tar,
      ma.desc_maq,
      'Materiales' AS tipo_prod,
      li.fec_inf_liq,
      ml.cod_mat,
      mt.desc_mat,
      convert(ml.cantidad,char(10)) AS cantidad,
      ml.pre_uni,
      ml.mon_tot
      from ordentrabajo ot inner join incidente ic
      on ot.num_inc = ic.num_inc inner join cliente cli
      on ic.cod_cli = cli.cod_cli inner join maquinariasucursal ms
      on ms.num_tar = ot.num_tar inner join maquinaria ma
      on ma.cod_maq = ms.cod_maq inner join liquidacion li
      on li.num_ord_trab = ot.num_ord_trab inner join materiales_x_liquidacion ml
      on ml.num_inf_liq = li.num_inf_liq inner join materiales mt on mt.cod_mat = ml.cod_mat

      union

      select cli.raz_soc_cli,
      ic.num_inc,
      ic.fec_inc,
      ms.num_tar,
      ma.desc_maq,
      'Servicios' AS tipo_prod,
      li.fec_inf_liq,
      tl.cod_tco,
      'Tecnico' AS `desc_prod`,
      concat(convert(tl.num_hor_trab, char(10)),' hrs') AS cantidad,
      tl.tar_hor_cobr ,
      (tl.num_hor_trab * tl.tar_hor_cobr) AS mon_tot
      from ordentrabajo ot inner join incidente ic
      on ot.num_inc = ic.num_inc inner join cliente cli
      on ic.cod_cli = cli.cod_cli inner join maquinariasucursal ms
      on ms.num_tar = ot.num_tar inner join maquinaria ma
      on ma.cod_maq = ms.cod_maq inner join liquidacion li
      on li.num_ord_trab = ot.num_ord_trab inner join tecnicos_x_liquidacion tl
      on tl.num_inf_liq = li.num_inf_liq;
      
CREATE or replace VIEW `mskbd`.`vw_distritos` AS
  SELECT
  tt.cod_item_tab cod_dist,
  tt.desc_tab     dist
  FROM tabladetablas tt
  WHERE tt.cod_tab=14 and cod_item_tab<>0;      
  
CREATE OR REPLACE VIEW `mskbd`.`vw_tipo_maquinaria` AS
  SELECT
  tt.cod_item_tab tip_maq,
  tt.desc_tab     desc_tip_maq
  FROM tabladetablas tt
  WHERE tt.cod_tab=17 and cod_item_tab<>0;

CREATE OR REPLACE VIEW `mskbd`.`vw_marcas` AS
  SELECT
  tt.cod_item_tab mar_maq,
  tt.desc_tab     desc_mar_maq
  FROM tabladetablas tt
  WHERE tt.cod_tab=18 and cod_item_tab<>0;      

CREATE OR REPLACE VIEW `mskbd`.`vw_naturaleza_averia` AS
  SELECT
  tt.cod_item_tab natur_aver,
  tt.desc_tab     desc_natur_aver
  FROM tabladetablas tt
  WHERE tt.cod_tab=10 and cod_item_tab<>0;

CREATE OR REPLACE VIEW `mskbd`.`vw_rpthistorialmaquinaria` AS
SELECT
        i.num_inc,
        i.fec_inc,
        i.cod_cli,
        cli.raz_soc_cli,
        msi.num_tar,
        mq.desc_maq,
        ot.fec_ord_trab,
        na.desc_natur_aver,
        msi.desc_aver
FROM incidente i inner join
cliente cli on i.cod_cli=cli.cod_cli
inner join maquinariasucursal_x_incidente msi
on i.num_inc=msi.num_inc
inner join maquinariasucursal ms
on ms.num_tar = msi.num_tar
inner join maquinaria mq
on ms.cod_maq = mq.cod_maq
inner join ordentrabajo ot
on msi.num_inc = ot.num_inc
and msi.num_tar = ot.num_tar
and msi.itm_aver = ot.itm_aver
inner join vw_naturaleza_averia na
on na.natur_aver= msi.natur_aver;
