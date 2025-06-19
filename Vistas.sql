USE TP_ITEGRADOR_GP4
GO

-- Stock

CREATE VIEW VW_Stock AS
SELECT
	C.IDComponente,
	D.IDIngreso,
	I.IDProveedor,
	C.Nombre AS Nombre_Componente,
	C.Stock,
	P.Nombre AS Nombre_Proveedor,
	I.FechaIngreso,
	I.Total,
	D.PrecioUnitario,
	D.Cantidad
FROM Componentes C
INNER JOIN DetalleIngreso D ON C.IDComponente = D.IDComponente
INNER JOIN Ingreso I ON D.IDIngreso = I.IDIngreso
INNER JOIN Proveedor P ON I.IDProveedor = P.IDProveedor
WHERE D.IDIngreso = (
	SELECT TOP 1 D2.IDIngreso
	FROM DetalleIngreso D2
	INNER JOIN Ingreso I2 ON D2.IDIngreso = I2.IDIngreso
	WHERE D2.IDComponente = C.IDComponente
	ORDER BY I2.FechaIngreso DESC, D2.IDIngreso DESC
);
GO

-- Ventas

CREATE VIEW VW_Ventas AS
SELECT
	V.IDVenta,
	V.FechaVenta,
	V.Total,
	V.IDCliente,
	D.IDDetalle,
	D.IDComponente,
	D.Cantidad,
	D.PrecioUnitario,
	S.Nombre_Componente,
	S.Stock

FROM Venta V
INNER JOIN DetalleVenta D ON V.IDVenta = D.IDVenta
INNER JOIN VW_Stock S ON D.IDComponente = S.IDComponente;
GO

-- Resumen Ventas

CREATE VIEW VW_ResumenVentas AS
SELECT
    V.FechaVenta,
    COUNT(DISTINCT V.IDVenta) AS NumeroVentas,
    SUM(V.Total) AS TotalIngresos,
    SUM(DV.Cantidad) AS TotalUniVendidas
FROM
    Venta V
JOIN
    DetalleVenta DV ON V.IDVenta = DV.IDVenta
GROUP BY
    V.FechaVenta;
GO
