<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ALTAComponente.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Admisnistrador.ALTAComponente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4">Alta de Componente</h2>

        <!-- Nombre -->
        <div class="mb-3">
            <label for="txtNombre" class="form-label">Nombre del componente</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre del componente" required="true"></asp:TextBox>
        </div>

        <!-- Descripción -->
        <div class="mb-3">
            <label for="txtDescripcion" class="form-label">Descripción</label>
            <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" CssClass="form-control" placeholder="Descripción"></asp:TextBox>
        </div>

        <!-- Categoría -->
        <div class="mb-3">
            <label for="ddlCategoria" class="form-label">Categoría</label>
            <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select" DataTextField="Nombre" DataValueField="IDCategoria" required="true">
            </asp:DropDownList>
        </div>

        <!-- Precio Venta -->
        <div class="mb-3">
            <label for="txtPrecioVenta" class="form-label">Precio de venta</label>
            <asp:TextBox ID="txtPrecioVenta" runat="server" TextMode="Number" CssClass="form-control" placeholder="Precio de venta" required="true"></asp:TextBox>
        </div>

        <!-- Precio Costo -->
        <div class="mb-3">
            <label for="txtPrecioCosto" class="form-label">Precio de costo</label>
            <asp:TextBox ID="txtPrecioCosto" runat="server" TextMode="Number" CssClass="form-control" placeholder="Precio de costo" required="true"></asp:TextBox>
        </div>

        <!-- Stock -->
        <div class="mb-3">
            <label for="txtStock" class="form-label">Stock inicial</label>
            <asp:TextBox ID="txtStock" runat="server" TextMode="Number" CssClass="form-control" placeholder="Stock inicial" required="true"></asp:TextBox>
        </div>

        <!-- Botón -->
        <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
    </form>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
