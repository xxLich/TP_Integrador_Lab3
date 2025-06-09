USE TP_ITEGRADOR_GP4
GO

DROP TYPE IF EXISTS TipoDetalleIngreso;
GO
DROP PROCEDURE IF EXISTS Registrar_Ingreso_De_Stock;
GO
-- Crear el tipo de tabla (esto solo se hace una vez)
CREATE TYPE TipoDetalleIngreso AS TABLE
(
	IDComponente INT,
	Cantidad INT,
	PrecioUnitario DECIMAL(10,2)
);
GO

-- Crear el procedimiento
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
/*
PRUEBA 
-- Declarar variable tipo tabla
DECLARE @DetalleStock TipoDetalleIngreso;

-- Insertar datos
INSERT INTO @DetalleStock (IDComponente, Cantidad, PrecioUnitario) VALUES
(1, 5, 70000),
(2, 10, 18000);

-- Ejecutar el procedimiento
EXEC Registrar_Ingreso_De_Stock 
	@Usuario = 2,
	@Proveedor = 1,
	@Fecha = '2025-06-09',  
	@Total = 560000,
	@Detalles = @DetalleStock;

	*/