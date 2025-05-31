CREATE DATABASE TP_ITEGRADOR_GP4

USE TP_ITEGRADOR_GP4
GO

CREATE TABLE Rol(
IDRol INT PRIMARY KEY,
Nombre varchar(50) NOT NULL
);
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
CREATE TABLE Venta(
IDVenta INT PRIMARY KEY IDENTITY (1,1),
IDUsuarios int NOT NULL,
FechaVenta DATETIME NOT NULL,
Total decimal(10,2) NOT NULL, 
Estado varchar(10),
FOREIGN KEY(IDUsuarios) REFERENCES Usuarios(IDUsuarios)
);