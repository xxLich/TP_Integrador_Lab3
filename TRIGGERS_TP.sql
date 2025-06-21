USE TP_ITEGRADOR_GP4
GO

-- ACTUALIZAR ESTADO COMPONENTE 

CREATE TRIGGER ActualizarEstadoComponente
ON Componentes
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Solo ejecutar si nivel de trigger es 1
    IF TRIGGER_NESTLEVEL() > 1
        RETURN;

    -- Actualizar Estado a 0 si Stock = 0 y Estado <> 0
    UPDATE C
    SET C.Estado = 0
    FROM Componentes C
    INNER JOIN inserted I ON C.IDComponente = I.IDComponente
    WHERE I.Stock = 0 AND C.Stock = 0 AND C.Estado <> 0;

    -- Actualizar Estado a 1 si Stock > 0 y Estado <> 1
    UPDATE C
    SET C.Estado = 1
    FROM Componentes C
    INNER JOIN inserted I ON C.IDComponente = I.IDComponente
    WHERE I.Stock > 0 AND C.Stock > 0 AND C.Estado <> 1;
END;