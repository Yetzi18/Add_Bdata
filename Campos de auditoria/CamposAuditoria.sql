-- CREAR BASE DE DATOS--
create DATABASE sistema_ventas4E;
-- usar base de datos--
USE sistema_ventas4E;
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
ALTER TABLE tipo_usuarios
ADD descripcion_tipo varchar(200) AFTER nombre_tipo;
-- Tabla para usuarios

CREATE TABLE usuarios(

id_usuario INT AUTO_INCREMENT PRIMARY KEY, -- Id único
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
ALTER TABLE usuarios -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuario_tipo_usuario
-- Añade referencia(FK)
FOREIGN KEY (tipo_usuario_id) REFERENCES
tipo_usuarios(id_tipo_usuario);

ALTER TABLE usuarios
CHANGE COLUMN nombre_tipo nombre_usuario varchar(100) not null;

ALTER TABLE usuarios
ADD password varchar(45) AFTER nombre_usuario;

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
ALTER TABLE productos
MODIFY COLUMN precio float NOT null;

-- crear relacion entre usuario y venta --
ALTER TABLE ventas -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuario_ventas5
-- Añade referencia(FK)
FOREIGN KEY (id_ventas) REFERENCES
usuarios(id_usuario);

CREATE TABLE ventas(
id_ventas INT AUTO_INCREMENT PRIMARY KEY, -- Id único
usuario_id INT NOT NULL, 
fecha_venta DATETIME,


-- Campos de auditoría

created_at DATETIME DEFAULT CURRENT_TIMESTAMP, -- Fecha creación
updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Fecha modificación
created_by INT,-- Usuario que crea
updated_by INT,-- Usuario que modifica
deleted BOOLEAN DEFAULT FALSE -- Borrado lógico
);


-- RELACION ENTRE detalle Y VENTA 
ALTER TABLE detalle_ventas  -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_usuario_ventas
-- Añade referencia(FK)
FOREIGN KEY (venta_id) REFERENCES
ventas(id_ventas);

-- RELACION ENTRE PRODUCTO Y detalle 
ALTER TABLE detalle_ventas  -- Modificar tabla
-- Agregar una restricción (FK)
ADD CONSTRAINT fk_producto_ventas
-- Añade referencia(FK)
FOREIGN KEY (producto_id) REFERENCES
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
ALTER TABLE detalle_ventas
MODIFY COLUMN precio_unitario float NOT null;

-- ..... Insertar un usuario técnico inicial ..... --
INSERT INTO usuarios (
    nombre_usuario, password, correo, tipo_usuario_id, created_by, updated_by
)
VALUES (
    'sistema',
    '1234', -- Contraseña encriptada (ejemplo realista con bcrypt)
    'sistema@plataforma.cl',
    NULL,
    NULL,
    NULL
);
INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion_tipo,
    created_by,
    updated_by
)
VALUES (
    'Administrador',
    'Accede a todas las funciones del sistema, incluida la administración de usuarios.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);
-- Crear tipo de usuarios --

INSERT INTO tipo_usuarios (
    nombre_tipo,
    descripcion_tipo,
    created_by,
    updated_by
)
VALUES (
    'Vendedor',
    'Registra ventas, aplica descuentos, genera facturas o tickets.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
),
(
    'Cliente',
    'Puede ver productos, relizar pedidos, realizar pagos y ver su historial de compras.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
),
(
    'Gerente',
    'Accede a reportes de ventas, rendimiento de vendedores, gestión de inventario y autoriza descuentos o devoluciones.',
    1, -- creado por el usuario inicial
    1  -- actualizado por el mismo
);


-- Insertar un nuevo usuario real --
INSERT INTO usuarios (
    nombre_usuario, password, correo, tipo_usuario_id, created_by, updated_by
)
VALUES (
    'Yetzibel',
    '4567', -- bcrypt hasheado
    'yetzibelgonzalez@liceovvh.cl',
    1,  -- tipo: Administrador
	1, 1  -- creado por el usuario "sistema"

),
(
    'Abigail',
    '4567', -- bcrypt hasheado
    'abigailcaniucura@liceovvh.cl',
    2,  -- tipo: Administrador
	1, 1  -- creado por el usuario "sistema"

),
(
    'Mariangel',
    '4567', -- bcrypt hasheado
    'mariangelpirona@liceovvh.cl',
    3,  -- tipo: Administrador
	1, 1  -- creado por el usuario "sistema"

),
(
    'Benjamin',
    '4567', -- bcrypt hasheado
    'benjaminrios@liceovvh.cl',
    4,  -- tipo: Administrador
	1, 1  -- creado por el usuario "sistema"

);
-- tabla productos -- 
INSERT INTO productos (
    nombre_productos, precio, stock, created_by, updated_by
)
VALUES (
    'Bebida',
    1000, 
    50,
    4, -- usuario de registro 
	4   

),
(
    'Helado',
    200, 
    100,
    4, 
	4  

),
(
	'Chocolate',
    2000,
    80,
    4,
    4
),
(
    'Galleta',
    1000,
    200,
    4,
    4
),
(
    'Mentas',
    500,
    100,
    4,
    4
);
-- tabla ventas -- 
INSERT INTO ventas (
    usuario_id, fecha_venta, created_by, updated_by
)
VALUES (
    2, 
    NOW(),
    2,
    2
),
(
	2,
    NOW(),
    2,
    2
),
(
	2,
    NOW(),
    2,
    2
),
(
	2,
    NOW(),
    2,
    2
),
(
    2,
    NOW(),
    2,
    2
);
select * from ventas;
select * from usuarios;
-- tabla detalle ventas -- 
-- tabla ventas -- 
INSERT INTO detalle_ventas (
    venta_id, producto_id, cantidad_vendida, precio_unitario, created_by, updated_by
)
VALUES (
    1,
    2,
    50,
    100,
    2,
    2
),
(
	5,
    4,
    100,
    600,
    2,
    2
),
(
	2,
    1,
    30,
    700,
    2,
    2
),
(
	3,
    3,
    50,
    1100,
    2,
    2
),
(
    4,
    5,
    70,
    300,
    2,
    2
);
select * from productos;
select * from ventas;
select * from detalle_ventas;
<<<<<<< HEAD
select * from tipo_usuarios;
select * from usuarios;

-- nueva tarea ---

UPDATE usuarios
SET deleted = 1
Where id_usuario BETWEEN 2 AND 4;


SELECT nombre_usuario
FROM usuarios
WHERE tipo_usuario_id = 1; 

SELECT nombre_usuario
FROM usuarios
WHERE nombre_usuario  LIKE 'M%';

SELECT fecha_venta
FROM ventas
WHERE DATE(fecha_venta) BETWEEN '2025-05-26' AND '2025-05-30';

-- Creá cinco consultas propias --

SELECT nombre_tipo
FROM tipo_usuarios
WHERE nombre_tipo = 'Administrador' AND id_tipo_usuario = 1;

SELECT nombre_productos
FROM productos
WHERE precio  LIKE '2%';

SELECT venta_id, producto_id
FROM detalle_ventas
WHERE cantidad_vendida BETWEEN 30 AND 50;

SELECT nombre_usuario
FROM usuarios
WHERE  password  LIKE '1%' or '4%';

SELECT usuario_id
FROM ventas
WHERE DATE(fecha_venta) BETWEEN '2025-05-20' AND '2025-06-15';

select * from tipo_usuarios;

