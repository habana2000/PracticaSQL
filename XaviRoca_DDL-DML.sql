-- *************************************************
-- ****  DDL - Definición del modelo de datos   ****
-- *************************************************
-- Xavi Roca
-- JAN.23

-- Creación del schema
create schema XaviRoca_schema;

-- Creación de tablas AUXILIARES
create table xaviroca_chema.grupos (
	idGrupo int not null,
	nombre_grupo VARCHAR(40) not null,
	constraint grupos_PK primary key (idGrupo)
);

create table xaviroca_chema.marcas (
	idMarca int not null,
	nombre_marca VARCHAR(40) not null,
	grupo int not null,
	constraint marcas_PK primary key (idMarca),
	constraint marcas_grupo_FK foreign key (grupo)
		references xaviroca_chema.grupos(idGrupo);
);

create table xaviroca_chema.modelos (
	idModelo int not null,
	nombre_modelo VARCHAR(40) not null,
	constraint modelos_PK primary key (idModelo),
	constraint modelos_marca_FK foreign key (marca)
		references xaviroca_chema.marcas(idMarca;
);

create table xaviroca_chema.colores (
	idColorint not null,
	nombre_color VARCHAR(40) not null,
	constraint colores_PK primary key (idColor)
);

create table xaviroca_chema.aseguradores (
	idAseguradora int not null,
	nombre_aseguradora VARCHAR(40) not null,
	constraint aseguradoras_PK primary key (idAseguradora)
);

create table xaviroca_chema.monedas (
	idMoneda int not null,
	nombre_moneda VARCHAR(40) not null,
	constraint monedas_PK primary key (idMoneda)
);

-- Creación de tablas MAESTRAS
-- VEHICULOS
create table xaviroca_schema.vehiculos (
);

-- REVISIONES
create table xaviroca_schema.revisones (
);
