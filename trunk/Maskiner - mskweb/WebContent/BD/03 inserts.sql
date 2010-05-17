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
	   

INSERT usuario (cod_usr, dni_usr, ape_pat_usr, ape_mat_usr, nom_usr, dom_usr, tel_usr, cargo_usr, username, password, est_usr)
VALUES ('RG001', '09751173', 'Neyra', 'Mercado', 'Claudio Jesús', 'Calle José Álvares Calderón 410 San Borja', '2248550', 'Jefe de Planificación', 'claudio', 'claudio', 1),
	   ('RG002', '04551756', 'Lopez', 'Munar', 'Karla', 'Calle Los Ficus 410 La Victoria', '3457234', 'Liquidadora', 'karla', 'karla', 1),
	   ('RG003', '98887750', 'Melendez', 'Castro', 'Daniel', 'Calle José Álvares Calderón 410 San Borja', '6098764', 'Encargado Area Comercial', 'daniel', 'daniel', 1),				
	   ('RG004', '45457207', 'Pinco', 'Mendo', 'Christian', 'Av. Los Pinos 333 La Molina', '3456754', 'Liquidador', 'pinco', 'pinco', 1),
	   ('RG005', '23666358', 'Muñoz', 'Marca', 'Romualdo', 'Calle Los Pobres Locos 111 Miraflores', '3456754', 'Encargado Area Comercial', 'aldo', 'aldo', 1),
	   ('RG006', '86766888', 'Hipólito', 'Castañeda', 'Juan Carlos', 'Av La Esperanza 455 San Isidro', '3456754', 'Administrador del Sistema', 'juanca', 'juanca', 1),
	   ('RG007', '56664467', 'Huaman', 'Reyes', 'Juan Ernesto', 'Av La Esperanza 455 San Isidro', '3456754', 'Liquidador', 'juan', 'juan', 2);	   
	   
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
