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