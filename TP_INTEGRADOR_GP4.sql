CREATE DATABASE TP_ITEGRADOR_GP4
Collate Latin1_General_CI_AI
GO

USE TP_ITEGRADOR_GP4
GO

CREATE TABLE Rol(
	IDRol INT PRIMARY KEY IDENTITY(1,1),
	Nombre varchar(50) NOT NULL
);
GO

CREATE TABLE Cliente(
	IDCliente INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Domicilio VARCHAR(100) NOT NULL,
	Telefono VARCHAR(20),
	DNI INT NOT NULL
);
GO
-- HICE CAMBIO PARA UN ENCRIPTAR
CREATE TABLE Usuarios(
	IDUsuarios INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	Clave VARBINARY(64) NOT NULL, -- Cambio importante: ahora es VARBINARY
	IDRol INT NOT NULL,
	FechaRegristro DATETIME NOT NULL,
	FOREIGN KEY(IDRol) REFERENCES Rol(IDRol)
);

CREATE TABLE Venta(
	IDVenta INT PRIMARY KEY IDENTITY(1,1),
	IDUsuarios int NOT NULL,
	IDCliente INT NOT NULL,
	FechaVenta DATETIME NOT NULL,
	Total decimal(10,2) NOT NULL, 
	Estado varchar(10),

	FOREIGN KEY(IDUsuarios) REFERENCES Usuarios(IDUsuarios),
	FOREIGN KEY(IDCliente) REFERENCES Cliente(IDCliente)
);
GO

CREATE TABLE Categoria(
	IDCategoria INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(100)
);
GO

CREATE TABLE Proveedor(
	IDProveedor INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(100)
);
GO

CREATE TABLE Ingreso(
	IDIngreso INT PRIMARY KEY IDENTITY(1,1),
	IDUsuarios INT NOT NULL,
	FechaIngreso DATE NOT NULL,
	IDProveedor INT NOT NULL,
	Total DECIMAL(10,2) NOT NULL,

	FOREIGN KEY(IDUsuarios) REFERENCES Usuarios(IDUsuarios),
	FOREIGN KEY(IDProveedor) REFERENCES Proveedor(IDProveedor)
);
GO

CREATE TABLE Componentes(
	IDComponente INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(100),
	IDCategoria INT NOT NULL,
	PrecioVenta DECIMAL(10,2) NOT NULL,
	PrecioCosto DECIMAL(10,2) NOT NULL,
	Stock INT NOT NULL,
	FechaCreacion DATE NOT NULL,
	Estado BIT NOT NULL,

	FOREIGN KEY(IDCategoria) REFERENCES Categoria(IDCategoria)
);
GO

CREATE TABLE DetalleIngreso(
	IDDetalle INT PRIMARY KEY IDENTITY(1,1),
	IDIngreso INT NOT NULL,
	IDComponente INT NOT NULL,
	Cantidad INT NOT NULL,
	PrecioUnitario DECIMAL(10,2) NOT NULL,

	FOREIGN KEY(IDIngreso) REFERENCES Ingreso(IDIngreso),
	FOREIGN KEY(IDComponente) REFERENCES Componentes(IDComponente)
);
GO

CREATE TABLE DetalleVenta(
	IDDetalle INT PRIMARY KEY IDENTITY(1,1),
	IDVenta INT NOT NULL,
	IDComponente INT NOT NULL,
	Cantidad INT NOT NULL,
	PrecioUnitario INT NOT NULL,

	FOREIGN KEY(IDVenta) REFERENCES Venta(IDVenta),
	FOREIGN KEY(IDComponente) REFERENCES Componentes(IDComponente)
);
GO

-- DATOS AGREGADOS  ( SI LES DA  ERROR VERIFIQUEN LOS IDUsuarios-IDVentas)

-- Insertar Roles
INSERT INTO Rol (Nombre) VALUES 
('Administrador'),
('Vendedor'),
('Almacenero');

-- Insertar Usuarios
INSERT INTO Usuarios (Nombre, Apellido, Email, Clave, IDRol, FechaRegristro) VALUES
('Juan', 'Pérez', 'juanperez@mail.com', '12345678', 1, GETDATE()),
('Lucía', 'Gómez', 'luciagomez@mail.com', '87654321', 2, GETDATE()),
('Carlos', 'López', 'carloslopez@mail.com', '45671234', 3, GETDATE());

-- Insertar Categorías
INSERT INTO Categoria (Nombre, Descripcion) VALUES
('Hardware', 'Componentes físicos'),
('Software', 'Programas y licencias'),
('Accesorios', 'Complementos de hardware');

-- Insertar Proveedores
INSERT INTO Proveedor (Nombre, Descripcion) VALUES
('Proveedor A', 'Proveedor de Hardware'),
('Proveedor B', 'Proveedor de Software');

-- Insertar Componentes
INSERT INTO Componentes (Nombre, Descripcion, IDCategoria, PrecioVenta, PrecioCosto, Stock, FechaCreacion, Estado) VALUES
('Mouse', 'Mouse óptico USB', 3, 1500.00, 1000.00, 50, GETDATE(), 1),
('Teclado', 'Teclado mecánico', 3, 5000.00, 3500.00, 30, GETDATE(), 1),
('Monitor', 'Monitor LED 24"', 1, 25000.00, 18000.00, 20, GETDATE(), 1),
('Windows 11', 'Licencia original', 2, 45000.00, 30000.00, 10, GETDATE(), 1);

-- Insertar Clientes
INSERT INTO Cliente (Nombre, Domicilio, Telefono, DNI) VALUES
('María Fernández', 'Av. Siempre Viva 123', '1134567890', 30567890),
('Pedro Sánchez', 'Calle Falsa 456', '1145678901', 28654321);

-- Insertar Ingresos
INSERT INTO Ingreso (IDUsuarios, FechaIngreso, IDProveedor, Total) VALUES
(3, GETDATE(), 1, 100000.00),
(3, GETDATE(), 2, 45000.00);

-- Insertar DetalleIngreso
INSERT INTO DetalleIngreso (IDIngreso, IDComponente, Cantidad, PrecioUnitario) VALUES
(1, 1, 20, 1000.00),
(1, 2, 10, 3500.00),
(1, 3, 5, 18000.00),
(2, 4, 10, 30000.00);

-- Insertar Ventas
INSERT INTO Venta (IDUsuarios, IDCliente, FechaVenta, Total, Estado) VALUES
(2, 1, GETDATE(), 20000.00, 'Confirmado'),
(2, 2, GETDATE(), 50000.00, 'Pendiente');

-- Insertar DetalleVenta
INSERT INTO DetalleVenta (IDVenta, IDComponente, Cantidad, PrecioUnitario) VALUES
(1, 1, 5, 1500),
(1, 2, 2, 5000),
(2, 3, 2, 25000);
