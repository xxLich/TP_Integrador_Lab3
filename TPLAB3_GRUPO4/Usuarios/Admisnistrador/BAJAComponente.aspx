<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BAJAComponente.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Admisnistrador.BAJAComponente" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-danger">Baja de Componente</h2>

        <!-- Selección del componente -->
        <div class="mb-3">
            <label for="ddlComponentes" class="form-label">Seleccionar componente a eliminar</label>
            <asp:DropDownList ID="ddlComponentes" runat="server" CssClass="form-select" DataTextField="Nombre" DataValueField="IDComponente" AutoPostBack="false">
                <asp:ListItem Text="Seleccione un componente" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Botón para eliminar -->
        <asp:Button ID="btnEliminar" runat="server" Text="Eliminar Componente" CssClass="btn btn-danger"  />
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
