<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargaVenta.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.CargaVenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registrar Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-primary">Registrar Venta</h2>

        <!-- Selección del producto -->
        <div class="mb-3">
            <label for="ddlProducto" class="form-label">Producto</label>
            <asp:DropDownList ID="ddlProducto" runat="server" CssClass="form-select" required />
        </div>

        <!-- Selección del cliente -->
        <div class="mb-3">
            <label for="ddlCliente" class="form-label">Cliente</label>
            <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-select" required />
        </div>

        <!-- Cantidad -->
        <div class="mb-3">
            <label for="txtCantidad" class="form-label">Cantidad</label>
            <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" required />
        </div>

        <!-- Precio unitario -->
        <div class="mb-3">
            <label for="txtPrecio" class="form-label">Precio Unitario</label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" TextMode="Number" required />
        </div>

        <!-- Fecha -->
        <div class="mb-3">
            <label for="txtFecha" class="form-label">Fecha</label>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <!-- Botón -->
      <asp:Button ID="btnRegistrarVenta" runat="server" Text="Registrar Venta" OnClick="btnRegistrarVenta_Click" />
       <asp:GridView ID="gvUltimaVenta" runat="server" AutoGenerateColumns="true" CssClass="table" />
    
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
