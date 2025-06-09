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

CREATE TABLE Usuarios(
	IDUsuarios int PRIMARY KEY IDENTITY(1,1),
	Nombre varchar(50) NOT NULL,
	Apellido varchar(50) NOT NULL,
	Email varchar(255) NOT NULL,
	Clave varchar(8) NOT NULL,
	IDRol int NOT NULL,
	FechaRegristro DATETIME NOT NULL,

	FOREIGN KEY(IDRol) REFERENCES Rol(IDRol)
);
GO

CREATE TABLE Venta(
	IDVenta INT PRIMARY KEY IDENTITY(1,1),
	IDUsuarios int NOT NULL,
	FechaVenta DATETIME NOT NULL,
	Total decimal(10,2) NOT NULL, 
	Estado varchar(10),

	FOREIGN KEY(IDUsuarios) REFERENCES Usuarios(IDUsuarios)
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

CREATE TABLE Cliente(
	IDCliente INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Domicilio VARCHAR(100) NOT NULL,
	Telefono VARCHAR(20),
	DNI INT NOT NULL
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

INSERT INTO Rol (Nombre) VALUES 
('ADMIN'),
('EMPLEADO');


INSERT INTO Usuarios (Nombre, Apellido, Email, Clave, IDRol,FechaRegristro) VALUES 
('Juan', 'Pérez', 'juan@example.com', 'clave123', 1, GETDATE()),
('Ana', 'García', 'ana@example.com', 'clave123', 2, GETDATE()),
('Luis', 'Martínez', 'luis@example.com', 'clave123', 2, GETDATE()),
('Carla', 'López', 'carla@example.com', 'clave123', 1, GETDATE());


INSERT INTO Categoria (Nombre, Descripcion) VALUES 
('Procesadores', 'CPUs y microprocesadores'),
('Memorias RAM', 'Módulos de memoria'),
('Almacenamiento', 'Discos duros y SSDs'),
('Placas madre', 'Motherboards de distintos sockets');


INSERT INTO Proveedor (Nombre, Descripcion) VALUES 
('TechParts', 'Proveedor mayorista de componentes'),
('HardPlus', 'Distribuidor de hardware general'),
('ElectroniWorld', 'Importador de partes electrónicas'),
('Bits&Chips', 'Proveedor especializado en placas madre');

INSERT INTO Cliente (Nombre, Domicilio, Telefono, DNI) VALUES 
('Carlos Gómez', 'Av. Siempre Viva 123', '1112345678', 12345678),
('María Díaz', 'Calle Falsa 456', '1198765432', 23456789),
('Ricardo Pérez', 'Boulevard Central 789', '1134567890', 34567890),
('Laura Ríos', 'Ruta 9 Km 23', '1123456789', 45678901);


INSERT INTO Componentes (Nombre, Descripcion, IDCategoria, PrecioVenta, PrecioCosto, Stock, FechaCreacion, Estado) VALUES 
('Intel i5 12400F', 'Procesador de 6 núcleos', 1, 95000, 70000, 20, GETDATE(), 1),
('Kingston 8GB DDR4', 'Módulo RAM 2666MHz', 2, 22000, 18000, 50, GETDATE(), 1),
('SSD 500GB NVMe', 'Almacenamiento rápido', 3, 30000, 25000, 30, GETDATE(), 1),
('ASUS B660M', 'Motherboard para Intel', 4, 60000, 48000, 15, GETDATE(), 1);

INSERT INTO Ingreso (IDUsuarios, FechaIngreso, IDProveedor, Total) VALUES 
(2, GETDATE(), 1, 140000),
(3, GETDATE(), 2, 360000),
(4, GETDATE(), 3, 90000),
(5, GETDATE(), 4, 720000);

INSERT INTO Venta (IDUsuarios, FechaVenta, Total, Estado) VALUES 
(2, GETDATE(), 190000, 'COMPLETA'),
(3, GETDATE(), 44000, 'PENDIENTE'),
(4, GETDATE(), 120000, 'COMPLETA'),
(5, GETDATE(), 60000, 'COMPLETA');

INSERT INTO DetalleVenta (IDVenta, IDComponente, Cantidad, PrecioUnitario) VALUES 
(2, 1, 2, 95000),
(3, 2, 2, 22000),
(4, 3, 4, 30000),
(5, 4, 1, 60000);
