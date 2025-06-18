create database  arriendo_Equipos_Audiovisuales;
use arriendo_Equipos_Audiovisuales; 

CREATE TABLE tipo_usuarios(
id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_usuario VARCHAR(50) NOT NULL, -- Tipo de usuario (Admin, Cliente)
descripcion_tipo varchar(200),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE usuarios(

id_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre_usuario VARCHAR(100) NOT NULL, -- Nombre de usuario
password varchar(45),
correo VARCHAR(100) UNIQUE, -- Correo electrónico único
tipo_usuario_id INT, -- Relación a tipo_usuario

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);
-- RELACION ENTRETABLE USUARIO Y TIPO USUARIO 
ALTER TABLE usuarios -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuario_tipo_usuario
-- Añade referencia(FK)
FOREIGN KEY (tipo_usuario_id) REFERENCES
tipo_usuarios(id_tipo_usuario);

CREATE TABLE tipo_clientes(
id_tipo_cliente INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_cliente VARCHAR(50) NOT NULL, -- Tipo de usuario (Admin, Cliente)
descripcion_tipo varchar(200),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


CREATE TABLE clientes(

id_cliente INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre VARCHAR(100) NOT NULL, -- Nombre de usuario
rut varchar(10) not null,
tipo_cliente_id INT, -- Relación a tipo_cliente
correo VARCHAR(100) UNIQUE, -- Correo electrónico único
telefono varchar(15) not null,

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

-- RELACION ENTRETABLE USUARIO Y TIPO USUARIO 
ALTER TABLE cliente -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_cliente_tipo_clientes
-- Añade referencia(FK)
FOREIGN KEY (tipo_cliente_id) REFERENCES
tipo_clientes(id_tipo_cliente);

CREATE TABLE tipo_equipos(
id_tipo_equipo INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_equipo VARCHAR(50) NOT NULL, -- Tipo de usuario (Admin, Cliente)
descripcion_tipo varchar(200),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE equipos(

id_equipo INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre_equipo VARCHAR(100) NOT NULL, -- Nombre de usuario
marca VARCHAR(100) UNIQUE, -- Correo electrónico único
estado varchar(200) not null,
valor_diario float not null,
ubicacion varchar(100) not null,
disponible boolean not null,
tipo_equipo_id varchar(10) not null,
-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);
-- RELACION ENTRETABLE EQUIPOs Y TIPO EQUIPO 
ALTER TABLE equipos -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_equipos_tipo_equipo
-- Añade referencia(FK)
FOREIGN KEY (tipo_equipo_id) REFERENCES
tipo_equipos(id_tipo_equipo);

CREATE TABLE tipo_mantenimientos(
id_tipo_mantenimiento INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo_equipo VARCHAR(50) NOT NULL, -- Tipo de usuario (Admin, Cliente)
descripcion_tipo varchar(200),

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE mantenimientos(

id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre_equipo VARCHAR(100) NOT NULL, -- Nombre de usuario
fecha_mantenimiento datetime not null,

tipo_equipo_id varchar(10) not null,
-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

