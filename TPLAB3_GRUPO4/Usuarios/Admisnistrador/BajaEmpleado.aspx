<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BajaEmpleado.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Admisnistrador.BajaEmpleado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-danger">Baja de Empleado</h2>

        <!-- Selección del empleado -->
        <div class="mb-3">
            <label for="ddlEmpleados" class="form-label">Seleccionar Empleado</label>
            <asp:DropDownList ID="ddlEmpleados" runat="server" CssClass="form-select"
                DataTextField="NombreCompleto" DataValueField="IDEmpleado">
                <asp:ListItem Text="Seleccione un empleado" Value="" />
            </asp:DropDownList>
        </div>

        <!-- Botón de baja -->
        <asp:Button ID="btnEliminarEmpleado" runat="server" Text="Eliminar Empleado" CssClass="btn btn-danger"
           />
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
