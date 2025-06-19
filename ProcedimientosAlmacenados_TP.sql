USE TP_ITEGRADOR_GP4
GO

DROP TYPE IF EXISTS TipoDetalleIngreso;
GO
DROP PROCEDURE IF EXISTS Registrar_Ingreso_De_Stock;
GO

-- TIPO TABLA

-- Detalles de ingreso
CREATE TYPE TipoDetalleIngreso AS TABLE
(
	IDComponente INT,
	Cantidad INT,
	PrecioUnitario DECIMAL(10,2)
);
GO

-- Detalles de venta
CREATE TYPE TipoDetalleVenta AS TABLE
(
    IDComponente INT,
    Cantidad INT,
    PrecioUnitario DECIMAL(10,2)
);
GO

-- PROCEDIMIENTOS DE ALMACENADO

-- Registrar ingreso de stock
CREATE PROCEDURE Registrar_Ingreso_De_Stock
	@Usuario INT,
	@Proveedor INT,
	@fecha DATE,
	@total DECIMAL(10,2),
	@Detalles TipoDetalleIngreso READONLY 
AS 
BEGIN
	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRANSACTION;

		-- Insertar ingreso
		INSERT INTO Ingreso(IDUsuarios, FechaIngreso, IDProveedor, Total)
		VALUES(@Usuario, @fecha, @Proveedor, @total);

		DECLARE @IDIngreso INT = SCOPE_IDENTITY();

		-- Insertar detalles
		INSERT INTO DetalleIngreso(IDIngreso, IDComponente, Cantidad, PrecioUnitario)

		SELECT @IDIngreso, IDComponente, Cantidad, PrecioUnitario
		FROM @Detalles;

		-- Actualizar stock
		UPDATE C
		SET C.Stock = C.Stock + D.Cantidad
		FROM Componentes C
		INNER JOIN @Detalles D ON C.IDComponente = D.IDComponente;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH
END;
GO

-- Registrar venta
CREATE PROCEDURE Registrar_Venta_Stock
    @Usuario INT,
    @Cliente INT,
    @fecha DATE,
    @total DECIMAL(10,2),
    @Detalles TipoDetalleVenta READONLY
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Venta(IDUsuarios, FechaVenta, Total, Estado, IDCliente)
        VALUES(@Usuario, @fecha, @Cliente, @total, 1);

        DECLARE @IDVenta INT = SCOPE_IDENTITY();

        INSERT INTO DetalleVenta(IDVenta, IDComponente, Cantidad, PrecioUnitario)
        SELECT @IDVenta, IDComponente, Cantidad, PrecioUnitario
        FROM @Detalles;

        -- Actualizar stock
        UPDATE C
        SET C.Stock = C.Stock - D.Cantidad
        FROM Componentes C
        INNER JOIN @Detalles D ON C.IDComponente = D.IDComponente;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        THROW;
    END CATCH
END;
GO

-- ALTAS

-- Categoría
CREATE PROCEDURE ALTACATEGORIA
	@Nombre varchar(50),
	@Descripcion varchar(100)
AS
	BEGIN
		INSERT INTO Categoria (Nombre,Descripcion)
		VALUES (@Nombre,@Descripcion)
	END;
GO

-- Componentes
CREATE PROCEDURE ALTACOMPONENTES 
	@Nombre varchar(50),
	@Descripcion varchar(100),
	@IDCategoria int,
	@PrecioVenta decimal (10,2),
	@PrecioCosto decimal (10,2),
	@Stock int,
	@FechaCreacion date,
	@Estado bit
AS
BEGIN
	INSERT INTO Componentes(Nombre, Descripcion, IDCategoria, PrecioVenta, PrecioCosto, Stock, FechaCreacion, Estado)
	VALUES (@Nombre, @Descripcion, @IDCategoria, @PrecioVenta, @PrecioCosto, @Stock, @FechaCreacion, @Estado)
END;
GO

-- Proveedor
CREATE PROCEDURE ALTAPROVEEDOR
	@Nombre varchar(50),
	@Descripcion varchar(100)
AS 
	BEGIN
		INSERT INTO Proveedor(Nombre,Descripcion)
		VALUES (@Nombre,@Descripcion)
	END
	GO
CREATE PROCEDURE BAJAPROVEEDOR
	@IDProveedor int
AS
	BEGIN
		DELETE FROM Proveedor
		WHERE IDProveedor = @IDProveedor
	END;
GO

-- Usuario
CREATE PROCEDURE ALTAUSUARIO
	@Nombre VARCHAR(50),
	@Apellido VARCHAR(50),
	@Email VARCHAR(255),
	@Clave VARCHAR(100),        -- La clave en texto plano que se hashéa
	@IDRol INT
AS
BEGIN
	INSERT INTO Usuarios (Nombre, Apellido, Email, Clave, IDRol, FechaRegristro, Activo)
	VALUES (
		@Nombre,
		@Apellido,
		@Email,
		HASHBYTES('SHA2_256', @Clave),  -- Encripta la clave
		@IDRol,
		GETDATE(),
		1 -- Activo por defecto
	);
END;
GO

-- Clientes
CREATE PROCEDURE ALTACLIENTE
	@Nombre VARCHAR(50),
	@Domicilio VARCHAR(100),
	@Telefono VARCHAR(20),
	@DNI INT
AS
BEGIN
	INSERT INTO Cliente (Nombre, Domicilio, Telefono, DNI)
	VALUES (@Nombre, @Domicilio, @Telefono, @DNI);
END;
GO

-- MODIFICACIONES

-- Componentes
CREATE PROCEDURE MODIFICACIONCOMPONENTES
	@IDComponente int,
	@Nombre varchar(50),
	@Descripcion varchar(100),
	@IDCategoria int,
	@PrecioVenta decimal (10,2),
	@PrecioCosto decimal (10,2),
	@Stock int,
	@FechaCreacion date
	
AS 
	BEGIN 
		UPDATE Componentes
		SET
		IDCategoria = @IDCategoria,
		Descripcion = @Descripcion,
		PrecioVenta = @PrecioVenta,
		PrecioCosto = @PrecioCosto,
		Stock = @Stock,
		FechaCreacion = @FechaCreacion
		
	WHERE IDComponente = @IDComponente
END;
GO

-- Categoria
CREATE PROCEDURE MODIFICACIONCATEGORIA
	@IDCategoria int,
	@Nombre varchar(10),
	@Descripcion varchar (100)
AS
	BEGIN 
		UPDATE Categoria
			SET 
			Nombre = @Nombre,
			Descripcion = @Descripcion
			WHERE IDCategoria = @IDCategoria
	END;
GO

-- Proveedor
CREATE PROCEDURE MODIFICACIONPROVEEDOR
	@IDProveedor int,
	@Nombre varchar(10),
	@Descripcion varchar(50)
as 
	begin
		UPDATE Proveedor
			SET 
			Nombre = @Nombre,
			Descripcion = @Descripcion
			WHERE IDProveedor = @IDProveedor
	END
---ABM USUAARIOS 
GO

-- Usuario
CREATE PROCEDURE MODIFICACIONUSUARIO
	 @IDUsuario INT,
    @Nombre VARCHAR(50),
    @Apellido VARCHAR(50),
    @Email VARCHAR(255),
    @IDRol INT
AS
BEGIN
    UPDATE Usuarios
    SET
        Nombre = @Nombre,
        Apellido = @Apellido,
        Email = @Email,
        IDRol = @IDRol
    WHERE IDUsuarios = @IDUsuario;
END
GO

-- Clientes
CREATE PROCEDURE MODIFICACIONCLIENTE
	@IDCliente INT,
	@Nombre VARCHAR(50),
	@Domicilio VARCHAR(100),
	@Telefono VARCHAR(20),
	@DNI INT
AS
BEGIN
	UPDATE Cliente
	SET 
		Nombre = @Nombre,
		Domicilio = @Domicilio,
		Telefono = @Telefono,
		DNI = @DNI
	WHERE IDCliente = @IDCliente;
END;
GO

-- BAJAS

-- Categoría
CREATE PROCEDURE BAJACATEGORIA
	@IDCategoria INT
AS
	BEGIN
		DELETE FROM Categoria
			WHERE IDCategoria = @IDCategoria
	END;
GO

-- Clientes
CREATE PROCEDURE BAJACLIENTE
	@IDCliente INT
AS
BEGIN
	DELETE FROM Cliente
	WHERE IDCliente = @IDCliente;
END;
GO

-- Usuario
CREATE PROCEDURE BAJAUSUARIO
	@IDUsuario INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Usuarios WHERE IDUsuarios = @IDUsuario)
	BEGIN
		UPDATE Usuarios
		SET Activo = 0
		WHERE IDUsuarios = @IDUsuario;
	END
	ELSE
	BEGIN
		PRINT 'El usuario no existe.';
	END
END;
GO

-- Componentes
CREATE PROCEDURE BAJACOMPONENTES
	@IDComponente INT
AS
BEGIN
	IF EXISTS (SELECT 1 FROM Componentes WHERE IDComponente = @IDComponente)
	BEGIN
		UPDATE Componentes
		SET
			Estado = 0,
			Stock = 0
		WHERE IDComponente = @IDComponente;
	END
	ELSE
	BEGIN
		PRINT 'El componente no existe.';
	END
END;
GO