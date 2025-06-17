<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicioEmpleado.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.inicioEmpleado" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Inicio Empleado</title>
    <!-- Bootstrap CDN (puedes reemplazarlo por tu propio archivo si lo preferís) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4">Panel de Empleado</h2>

            <asp:Button ID="btnCargaIngreso" runat="server" Text="Carga de Ingresos"
                CssClass="btn btn-primary me-3" OnClick="btnCargaIngreso_Click" />

            <asp:Button ID="btnVenta" runat="server" Text="Realizar Venta"
                CssClass="btn btn-success me-3" OnClick="btnVenta_Click" />

          
            <asp:Button ID="btnCargarCliente" runat="server" Text="Cargar Cliente"
                CssClass="btn btn-warning" OnClick="btnCargarCliente_Click" />
        </div>
    </form>
</body>
</html>
