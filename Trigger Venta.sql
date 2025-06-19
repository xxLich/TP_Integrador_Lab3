USE TP_ITEGRADOR_GP4
GO

-- Trigger venta

CREATE TRIGGER TR_Venta
ON DetalleVenta
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

	-- Verifica los registros nuevos
    IF EXISTS (
        SELECT 1
        FROM inserted I
        INNER JOIN VW_Stock S ON I.IDComponente = S.IDComponente
        INNER JOIN Componentes C ON I.IDComponente = C.IDComponente
        INNER JOIN Venta V ON I.IDVenta = V.IDVenta
        WHERE I.Cantidad > S.Stock
           OR C.Estado = 0
           OR V.Estado = 0
    )
    BEGIN
        PRINT 'Error: Stock insuficiente, componente dado de baja o venta anulada.';
        ROLLBACK TRANSACTION;
        RETURN;
    END

	-- Si todo es correcto, descuenta la cantidad vendida al stock de cada componente
    UPDATE C
    SET C.Stock = C.Stock - TotalVenta.CantidadVendida
    FROM Componentes C
    INNER JOIN (
        SELECT IDComponente, SUM(Cantidad) AS CantidadVendida
        FROM inserted
        GROUP BY IDComponente
    ) AS TotalVenta
    ON C.IDComponente = TotalVenta.IDComponente;
END
GO