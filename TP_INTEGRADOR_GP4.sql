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