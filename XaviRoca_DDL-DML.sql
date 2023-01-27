-- *************************************************
-- ****  DDL - Definición del modelo de datos   ****
-- *************************************************
-- Xavi Roca
-- JAN.23

-- Creación del schema
create schema XaviRoca_schema;

-- Creación de tablas AUXILIARES
create table xaviroca_schema.grupos (
	idGrupo int not null,
	nombre_grupo VARCHAR(40) not null,
	constraint grupos_PK primary key (idGrupo)
);

create table xaviroca_schema.marcas (
	idMarca int not null,
	nombre_marca VARCHAR(40) not null,
	grupo int not null,
	constraint marcas_PK primary key (idMarca),
	constraint marcas_grupo_FK foreign key (grupo)
		references xaviroca_schema.grupos(idGrupo)
);

create table xaviroca_schema.modelos (
	idModelo int not null,
	nombre_modelo VARCHAR(40) not null,
	marca int not null,
	constraint modelos_PK primary key (idModelo),
	constraint modelos_marca_FK foreign key (marca)
		references xaviroca_schema.marcas(idMarca)
);

create table xaviroca_schema.colores (
	idColor int not null,
	nombre_color VARCHAR(40) not null,
	constraint colores_PK primary key (idColor)
);

create table xaviroca_schema.aseguradoras (
	idAseguradora int not null,
	nombre_aseguradora VARCHAR(40) not null,
	constraint aseguradoras_PK primary key (idAseguradora)
);

create table xaviroca_schema.monedas (
	idMoneda int not null,
	nombre_moneda VARCHAR(40) not null,
	constraint monedas_PK primary key (idMoneda)
);

-- Creación de tablas MAESTRAS
-- VEHICULOS
create table xaviroca_schema.vehiculos (
	idVehiculo int NOT null,
	modelo int NOT null,
	color int NOT NULL,
	matricula varchar(20) NOT NULL,
	km numeric(10,0) NOT NULL DEFAULT 0,
	aseguradora int NOT NULL,
	poliza varchar(20),
	fecha_compra date NOT NULL,
	fecha_baja date NULL,
	CONSTRAINT vehiculos_PK PRIMARY KEY (idVehiculo),
	constraint vehiculos_modelos_FK foreign key (modelo)
		references xaviroca_schema.modelos(idModelo),
	constraint vehiculos_colores_PK FOREIGN KEY (color)
		references xaviroca_schema.colores(idColor),
	constraint vehiculos_aseguradoreas_FK foreign key (aseguradora)
		references xaviroca_schema.aseguradoras(idaseguradora)
);

-- REVISIONES
create table xaviroca_schema.revisiones (
	vehiculo int NOT NULL,
	fecha date NOT NULL,
	km numeric(10) NOT NULL,
	importe numeric(10,2) NOT NULL,
	moneda int NOT NULL,
	CONSTRAINT revisiones_PK PRIMARY KEY (Vehiculo,fecha),
	constraint revisiones_vehiculos_FK foreign key (vehiculo)
		references xaviroca_schema.vehiculos(idVehiculo),
	constraint revisiones_monedas_PK FOREIGN KEY (moneda)
		references xaviroca_schema.monedas(idMoneda)
);


-- *************************************************
-- ****  DML - Inserción de datos en el modelo  ****
-- *************************************************
-- Xavi Roca
-- JAN.23

-- Monedas
insert into xaviroca_schema.monedas (idMoneda, nombre_moneda) values (1,'EUR');
insert into xaviroca_schema.monedas (idMoneda, nombre_moneda) values (2,'USD');
insert into xaviroca_schema.monedas (idMoneda, nombre_moneda) values (3,'SOL');

-- Aseguradoras
insert into xaviroca_schema.aseguradoras (idAseguradora, nombre_aseguradora) values (1,'MAPFRE');
insert into xaviroca_schema.aseguradoras (idAseguradora, nombre_aseguradora) values (2,'RACC');
insert into xaviroca_schema.aseguradoras (idAseguradora, nombre_aseguradora) values (3,'LINEA DIRECTA');

-- Colores
insert into xaviroca_schema.colores (idColor, nombre_color) values (1,'Blanco');
insert into xaviroca_schema.colores (idColor, nombre_color) values (2,'Amarillo');
insert into xaviroca_schema.colores (idColor, nombre_color) values (3,'Rojo');
insert into xaviroca_schema.colores (idColor, nombre_color) values (4,'Azul marino');
insert into xaviroca_schema.colores (idColor, nombre_color) values (5,'Azul eléctrico');
insert into xaviroca_schema.colores (idColor, nombre_color) values (6,'Verde');
insert into xaviroca_schema.colores (idColor, nombre_color) values (7,'Pistacho');
insert into xaviroca_schema.colores (idColor, nombre_color) values (8,'Negro');

-- Grupos
insert into xaviroca_schema.grupos (idGrupo, nombre_grupo) values (1,'Volkswagen');
insert into xaviroca_schema.grupos (idGrupo, nombre_grupo) values (2,'Daimler');
insert into xaviroca_schema.grupos (idGrupo, nombre_grupo) values (3,'Stellantis');
insert into xaviroca_schema.grupos (idGrupo, nombre_grupo) values (4,'Renault');

-- Marcas
insert into xaviroca_schema.marcas (idMarca, nombre_marca, grupo) values (1,'VW',1);
insert into xaviroca_schema.marcas (idMarca, nombre_marca, grupo) values (2,'AUDI',1);
insert into xaviroca_schema.marcas (idMarca, nombre_marca, grupo) values (3,'SEAT',1);
insert into xaviroca_schema.marcas (idMarca, nombre_marca, grupo) values (4,'MERCEDES-BENZ',2);
insert into xaviroca_schema.marcas (idMarca, nombre_marca, grupo) values (5,'SMART',2);
insert into xaviroca_schema.marcas (idMarca, nombre_marca, grupo) values (6,'RENAULT',4);
insert into xaviroca_schema.marcas (idMarca, nombre_marca, grupo) values (7,'DACIA',4);
insert into xaviroca_schema.marcas (idMarca, nombre_marca, grupo) values (8,'NISSAN',4);

-- Modelos
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (1,'GOLF',1);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (2,'POLO',1);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (3,'Q7',2);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (4,'A2',2);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (5,'GLA-200',4);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (6,'C-300',4);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (7,'PASSAT',1);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (8,'TWINGO',6);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (9,'LEAF',8);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (10,'JUKE',8);
insert into xaviroca_schema.modelos (idModelo, nombre_modelo, marca) values (11,'MICRA',8);

-- Vehiculos
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (1,1,1,'8996 DSF',15456,1,'4354533-534','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (2,2,2,'1234 FDV',156,1,'565-534','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (3,3,3,'2345 GHL',175456,1,'435676574533-534','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (4,4,4,'3456 LSM',17556,1,'87687-534','2005/05/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (5,4,1,'4567 MCB',75456,1,'89898-534','2013/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (6,4,2,'5678 DFF',475556,1,'9879-534','2005/11/20',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (7,5,3,'6789 GBB',457776,1,'4354539098','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (8,6,4,'2323 HTP',756756,1,'43545HJG','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (9,7,1,'1111 GTT',176754,1,'HJGHJ-534','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (10,9,2,'2222 DDD',17656,1,'435JGHJG4533-534','2005/11/06','2022-12-31');
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (11,9,3,'3434 FFF',76156,1,'HJJHJ-534','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (12,9,4,'0000 GGG',167656,1,'4354533-KHJK','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (13,9,1,'9090 LLL',15456,1,'43KJHKH34','2015/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (14,6,2,'5657 KKK',43256,1,'43545KJKJH4','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (15,3,2,'3456 DGL',432256,1,'435455645','2010/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (16,4,2,'9478 DSS',43256,1,'TERTERT','2005/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (17,3,3,'4524 FTM',53216,1,'2132324','2007/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (18,4,3,'0956 LKM',51236,1,'4354533-534','2018/11/06',null);
insert into xaviroca_schema.vehiculos (idvehiculo,modelo,color,matricula,km,aseguradora,poliza,fecha_compra,fecha_baja)
	values (19,1,3,'8787 DSF',4236,1,'43hgjgh-534','2022/11/06',null);

-- Revisiones
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (1,'2020-01-15', 20000, 155.00, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (1,'2020-07-15', 30000, 227.50, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (1,'2021-01-15', 40000, 197.80, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (2,'2020-01-15', 20000, 155.00, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (2,'2020-07-15', 30000, 227.50, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (2,'2021-01-15', 40000, 197.80, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (2,'2021-07-15', 50000, 155.00, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (2,'2022-01-15', 60000, 227.50, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (3,'2019-07-15', 10000, 197.80, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (3,'2020-01-15', 20000, 155.00, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (3,'2020-07-15', 30000, 227.50, 1);
insert into xaviroca_schema.revisiones (vehiculo, fecha, km, importe, moneda) values (3,'2021-01-15', 40000, 197.80, 1);

