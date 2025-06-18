<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargaIngreso.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.CargaIngreso" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registrar Ingreso de Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-primary">Registrar Ingreso de Stock</h2>

        <!-- Selección del proveedor -->
        <div class="mb-3">
            <label for="ddlProveedor" class="form-label">Proveedor</label>
            <asp:DropDownList ID="ddlProveedor" runat="server" CssClass="form-select" required>
                <asp:ListItem Text="Seleccione un proveedor" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Fecha de ingreso -->
        <div class="mb-3">
            <label for="txtFecha" class="form-label">Fecha de Ingreso</label>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date" required />
        </div>

        <!-- Componente 1 -->
        <div class="mb-3">
            <label for="ddlComponente1" class="form-label">Componente 1</label>
            <asp:DropDownList ID="ddlComponente1" runat="server" CssClass="form-select" required>
                <asp:ListItem Text="Seleccione componente" Value="" />
            </asp:DropDownList>
            <asp:TextBox ID="txtCantidad1" runat="server" CssClass="form-control mt-2" TextMode="Number" Placeholder="Cantidad" required />
            <asp:TextBox ID="txtPrecio1" runat="server" CssClass="form-control mt-2" TextMode="Number" Placeholder="Precio Unitario" required />
        </div>

        <!-- Botón de registro -->
        <div class="mb-3">
            <asp:Button ID="btnRegistrarIngreso" runat="server" Text="Registrar Ingreso" CssClass="btn btn-success" OnClick="btnRegistrarIngreso_Click" />
        </div>

        <!-- Tabla para mostrar los detalles -->
        <h3>Detalles de Ingreso</h3>
        <asp:GridView ID="gvDetalles" runat="server" AutoGenerateColumns="true" CssClass="table table-striped" />

    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
