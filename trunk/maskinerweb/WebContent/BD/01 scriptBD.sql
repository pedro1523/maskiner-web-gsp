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
	des_aten_realiz VARCHAR(200) NOT NULL,
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
