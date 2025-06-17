<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MODComponente.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Admisnistrador.MODComponente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-primary">Modificar Componente</h2>

        <!-- Selección del componente a modificar -->
        <div class="mb-3">
            <label for="ddlComponentes" class="form-label">Seleccionar Componente</label>
            <asp:DropDownList  
                OnSelectedIndexChanged="ddlComponentes_SelectedIndexChanged"
                DataTextField="Nombre" DataValueField="IDComponente">
                <asp:ListItem Text="Seleccione un componente" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Campos editables -->
        <div class="mb-3">
            <label for="txtNombre" class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label for="txtDescripcion" class="form-label">Descripción</label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>

        <div class="mb-3">
            <label for="txtPrecioVenta" class="form-label">Precio de Venta</label>
            <asp:TextBox ID="txtPrecioVenta" runat="server" CssClass="form-control" TextMode="Number" />
        </div>

        <div class="mb-3">
            <label for="txtStock" class="form-label">Stock</label>
            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" TextMode="Number" />
        </div>

        <!-- Botón Guardar Cambios -->
        <asp:Button ID="btnGuardarCambios" runat="server" Text="Guardar Cambios" CssClass="btn btn-success"
            />
    </form>
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
