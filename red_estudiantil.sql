CREATE DATABASE red_estudiantil
	WITH 
	OWNER = postgres
	ENCODING = 'UTF-8'
	CONNECTION LIMIT = -1;

CREATE TABLE IF NOT EXISTS persona (
	id_persona serial PRIMARY KEY,
	nombre VARCHAR(30) NOT NULL,
	apellido1 VARCHAR(30) NOT NULL,
	apellido2 VARCHAR(30) NOT NULL,
	usuario VARCHAR(30) NOT NULL UNIQUE,
	email VARCHAR(30) NOT NULL UNIQUE,
	contrasenia CHAR(8) NOT NULL
);

CREATE TABLE IF NOT EXISTS estudiante (
	id_persona INT UNIQUE,
	FOREIGN KEY (id_persona) REFERENCES persona(id_persona),
	carnet CHAR(10) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS tipo_actividad (
	id_tipo_actividad SMALLINT PRIMARY KEY,
	tipo VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS actividad (
	id_actividad serial PRIMARY KEY,
	fecha_inicio TIMESTAMP NOT NULL,
	fecha_fin TIMESTAMP NOT NULL,
	horas_estimadas SMALLINT NOT NULL, 
	id_tipo_actividad SMALLINT NOT NULL,
	FOREIGN KEY (id_tipo_actividad) REFERENCES tipo_actividad(id_tipo_actividad),
	valor SMALLINT NOT NULL,
	actividad_permanente BOOLEAN NOT NULL
	--id_grupo INT NOT NULL, --Falta Agregar la tabla GRUPO para esto
	--FOREIGN KEY (id_grupo) REFERENCES grupo(id_grupo)
);

CREATE TABLE IF NOT EXISTS estudiante_actividad(
	id_persona INT NOT NULL,
	FOREIGN KEY (id_persona) REFERENCES estudiante(id_persona),
	id_actividad INT NOT NULL,
	FOREIGN KEY (id_actividad) REFERENCES actividad(id_actividad),
    PRIMARY KEY (id_persona, id_actividad),
	finalizada BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS estudiante_actividad_tiempo(
	id_persona INT NOT NULL,
	FOREIGN KEY (id_persona) REFERENCES estudiante(id_persona),
	id_actividad INT NOT NULL,
	FOREIGN KEY (id_actividad) REFERENCES actividad(id_actividad),
    PRIMARY KEY (id_persona, id_actividad),
	total_horas SMALLINT NOT NULL,
	hora_inicial TIME NOT NULL,
	hora_final TIME NOT NULL
);
