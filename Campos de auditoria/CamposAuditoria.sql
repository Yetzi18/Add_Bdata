-- CREAR BASE DE DATOS--
create DATABASE sistema_ventas;
-- usar base de datos--
USE sistema_ventas;
-- Creamos la tabla tipo_usuario
CREATE TABLE tipo_usuarios(
id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Identificador único
nombre_tipo VARCHAR(50) NOT NULL, -- Tipo de usuario (Admin, Cliente)

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT, -- Usuario que crea
updated_by INT, -- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

-- Tabla para usuarios

CREATE TABLE usuarios (

id_tipo_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre_tipo VARCHAR(100) NOT NULL, -- Nombre de usuario
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
ALTER TABLE usuarios  -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuario_tipo_usuario
-- Añade referencia(FK)
FOREIGN KEY (tipo_usuario_id) REFERENCES
tipo_usuario(id_tipo_usuario);

CREATE TABLE productos (

id_productos INT AUTO_INCREMENT PRIMARY KEY, -- Id único
nombre_productos VARCHAR(100) NOT NULL, 
precio INT, 
stock INT DEFAULT 0, 

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

CREATE TABLE ventas (
id_ventas INT AUTO_INCREMENT PRIMARY KEY, -- Id único
vendedor_id INT NOT NULL, 
fecha_venta DATETIME,

-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);
-- RELACION ENTRE USUARIO Y VENTA 
ALTER TABLE detalle_ventas  -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuario_ventas
-- Añade referencia(FK)
FOREIGN KEY (usuario_id) REFERENCES
ventas(venta_id);

-- RELACION ENTRE PRODUCTO Y VENMTA 
ALTER TABLE detalle_ventas  -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_producto_ventas
-- Añade referencia(FK)
FOREIGN KEY (productos_id) REFERENCES
productos(id_productos);

CREATE TABLE detalle_ventas (
id_detalle_ventas INT AUTO_INCREMENT PRIMARY KEY, -- Id único
venta_id INT, 
producto_id INT,
cantidad_vendida INT,
precio_unitario INT,

-- Campos de auditoría
created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);

