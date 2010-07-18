DELIMITER $$

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

DELIMITER ;


DELIMITER $$

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

DELIMITER ;

DELIMITER $$

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

DELIMITER ;

DELIMITER $$

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

DELIMITER ;