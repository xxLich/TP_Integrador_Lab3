<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargaVenta.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.CargaVenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Registrar Venta</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-primary">Registrar Venta</h2>

        <!-- Producto -->
        <div class="mb-3">
            <label for="ddlProducto" class="form-label">Producto</label>
            <asp:DropDownList ID="ddlProducto" runat="server" CssClass="form-select" 
                              AutoPostBack="true" OnSelectedIndexChanged="ddlProducto_SelectedIndexChanged" />
        </div>

        <!-- Cliente -->
        <div class="mb-3">
            <label for="ddlCliente" class="form-label">Cliente</label>
            <asp:DropDownList ID="ddlCliente" runat="server" CssClass="form-select" />
        </div>

        <!-- Cantidad -->
        <div class="mb-3">
            <label for="txtCantidad" class="form-label">Cantidad</label>
            <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" />
        </div>

        <!-- Precio  -->
        <div class="mb-3">
            <label for="txtPrecio" class="form-label">Precio</label>
            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" ReadOnly="true" />
        </div>

        <!-- Botón de registrar -->
        <div class="mb-3">
            <asp:Button ID="btnRegistrarVenta" runat="server" Text="Registrar Venta" 
                        CssClass="btn btn-success" OnClick="btnRegistrarVenta_Click" />
        </div>

        <!-- Resultado de la venta -->
        <div class="mb-3">
            <asp:GridView ID="gvUltimaVenta" runat="server" CssClass="table table-bordered" AutoGenerateColumns="true" />

        </div>

        <!-- Mensaje -->
        <asp:Label ID="lblMensajeVenta" runat="server" CssClass="text-success" />


    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>