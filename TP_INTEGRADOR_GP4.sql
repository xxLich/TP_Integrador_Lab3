CREATE DATABASE TP_ITEGRADOR_GP4
Collate Latin1_General_CI_AI -- Add
GO

USE TP_ITEGRADOR_GP4
GO

CREATE TABLE Rol(
	IDRol INT PRIMARY KEY,
	Nombre varchar(50) NOT NULL
);
GO

CREATE TABLE Usuarios(
	IDUsuarios int PRIMARY KEY,
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
	IDVenta INT PRIMARY KEY IDENTITY (1,1),
	IDUsuarios int NOT NULL,
	FechaVenta DATETIME NOT NULL,
	Total decimal(10,2) NOT NULL, 
	Estado varchar(10),

	FOREIGN KEY(IDUsuarios) REFERENCES Usuarios(IDUsuarios)
);
GO

-- Mich

CREATE TABLE Categoria(
	IDCategoria INT PRIMARY KEY IDENTITY(1,1),
	Nombre VARCHAR(50) NOT NULL,
	Descripcion VARCHAR(100)
);
GO

CREATE TABLE Ingreso(
	IDIngreso INT PRIMARY KEY IDENTITY(1,1),
	IDUsuarios INT NOT NULL,
	FechaIngreso DATE NOT NULL,
	Proveedor VARCHAR NOT NULL,
	Total DECIMAL NOT NULL,

	FOREIGN KEY(IDUsuarios) REFERENCES Usuarios(IDUsuarios)
);
GO