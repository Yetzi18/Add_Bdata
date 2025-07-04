create database  arriendo_Equipos_Audiovisuales;
use arriendo_Equipos_Audiovisuales; 

CREATE TABLE tipo_usuarios(
id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_usuario VARCHAR(50) NOT NULL -- Tipo de usuario (Admin, Cliente)
CHECK (nombre_tipo_usuario IN ('Administrador', 'Cliente', 'Técnico')),
nivel_acceso TINYINT CHECK (nivel_acceso BETWEEN 1 AND 3),
descripcion_tipo VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(descripcion_tipo) >= 3),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE usuarios(

id_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre_usuario VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_usuario) >= 3 AND nombre_usuario REGEXP '^[A-Za-z ]+$'), -- Nombre de usuario
edad_usuario TINYINT CHECK (edad_usuario BETWEEN 18 AND 100),
password varchar(45),
correo VARCHAR(100) NOT NULL UNIQUE CHECK (correo LIKE '%@%.%'), -- Correo electrónico único
tipo_usuario_id INT, -- Relación a tipo_usuario

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


CREATE TABLE tipo_clientes(
id_tipo_cliente INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_cliente VARCHAR(50) NOT NULL -- Tipo de usuario (Admin, Cliente)
CHECK (nombre_tipo_cliente IN ('Empresa', 'Particular')),
    nivel_acceso TINYINT CHECK (nivel_acceso BETWEEN 1 AND 2),
descripcion_tipo VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(descripcion_tipo) >= 3),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


CREATE TABLE clientes(

id_cliente INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre_cliente VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_cliente) >= 3 AND nombre_cliente REGEXP '^[A-Za-z ]+$'), -- Nombre de usuario
edad_clientes TINYINT CHECK (edad_clientes BETWEEN 18 AND 100),
rut varchar(10) not null,
tipo_cliente_id INT, -- Relación a tipo_cliente
correo VARCHAR(100) NOT NULL UNIQUE CHECK (correo LIKE '%@%.%'), -- Correo electrónico único
telefono varchar(15) not null,

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);



CREATE TABLE tipo_equipos(
id_tipo_equipo INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_equipo VARCHAR(50) NOT NULL-- Tipo de usuario (Admin, Cliente)
CHECK (nombre_tipo_equipo IN ('Audio', 'Visual', 'Audiovisual')),
    nivel_acceso TINYINT CHECK (nivel_acceso BETWEEN 1 AND 3),
descripcion_tipo VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(descripcion_tipo) >= 3),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE equipos(

id_equipo INT AUTO_INCREMENT PRIMARY KEY, -- Id único
codigo_equipo varchar(20) not null,
nombre_equipo VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_equipo) >= 3), 
marca VARCHAR(100) UNIQUE, -- Correo electrónico único
estado varchar(200) not null,
valor_diario float not null,
ubicacion varchar(100) not null,
disponible BOOLEAN DEFAULT TRUE not null,
tipo_equipo_id varchar(10) not null,
-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


create table estado_equipos(
id_estado INT AUTO_INCREMENT PRIMARY KEY, -- Id único
descripcion_estado VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(descripcion_estado) >= 3),
-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


create table ubicacion_equipos(
id_ubicacion INT AUTO_INCREMENT PRIMARY KEY, -- Id único
numero_pasillo varchar(10) not null,
numero_estante int not null,
equipo_id int not null, 
-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


CREATE TABLE tipo_mantenimientos(
id_tipo_mantenimiento INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_mantenimiento VARCHAR(50) NOT NULL -- Tipo de usuario (Admin, Cliente)
CHECK (nombre_tipo_mantenimiento IN ('Preventivo', 'Correctivo')),
    nivel_acceso TINYINT CHECK (nivel_acceso BETWEEN 1 AND 2),
descripcion_tipo VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(descripcion_tipo) >= 3),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE mantenimientos(

id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre_equipo VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_equipo) >= 3  AND nombre_cliente REGEXP '^[A-Za-z ]+$'), -- Nombre de usuario
nombre_tecnico VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_tecnico) >= 3  AND nombre_cliente REGEXP '^[A-Za-z ]+$'),
fecha_mantenimiento datetime DEFAULT (CURRENT_DATE),
descripcion VARCHAR(200) NOT NULL CHECK (CHAR_LENGTH(descripcion) >= 3),
tipo_mantenimiento_id varchar(10) not null,
-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


CREATE TABLE reservas(

id_reservas INT AUTO_INCREMENT PRIMARY KEY, -- Id único
fecha_inicio datetime DEFAULT (CURRENT_DATE), 
fecha_termino datetime DEFAULT (CURRENT_DATE),
nombre_cliente VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_cliente) >= 3  AND nombre_cliente REGEXP '^[A-Za-z ]+$'),
equipos_arrendado int not null,
forma_pago varchar(100) not null,
precio DECIMAL(10,2) CHECK (precio >= 0),
-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE tipo_pagos(
id_tipo_pago INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_pago VARCHAR(50) NOT NULL -- Tipo de usuario (Admin, Cliente)
CHECK (nombre_tipo_pago IN ('Credito', 'Debito','Efectivo', 'Transferencias', 'Cuotas')),
    nivel_acceso TINYINT CHECK (nivel_acceso BETWEEN 1 AND 5) ,
descripcion_pago VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(descripcion_pago) >= 3),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


CREATE TABLE telefonos(
id_telefono INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_telefono VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(nombre_telefono) >= 3), -- Tipo de usuario (Admin, Cliente)
descripcion_telefono VARCHAR(100) NOT NULL CHECK (CHAR_LENGTH(descripcion_telefono) >= 3),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

-- Relaciones entre tablas 

-- RELACION ENTRETABLE USUARIO Y TIPO USUARIO 
ALTER TABLE usuarios -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuario_tipo_usuario
-- Añade referencia(FK)
FOREIGN KEY (tipo_usuario_id) REFERENCES
tipo_usuarios(id_tipo_usuario);

-- RELACION ENTRETABLE USUARIO Y TIPO USUARIO 
ALTER TABLE cliente -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_cliente_tipo_clientes
-- Añade referencia(FK)
FOREIGN KEY (tipo_cliente_id) REFERENCES
tipo_clientes(id_tipo_cliente);

-- RELACION ENTRETABLE EQUIPOs Y TIPO EQUIPO 
ALTER TABLE equipos -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_equipos_tipo_equipo
-- Añade referencia(FK)
FOREIGN KEY (tipo_equipo_id) REFERENCES
tipo_equipos(id_tipo_equipo);