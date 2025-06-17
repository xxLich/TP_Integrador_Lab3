<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaEmpleado.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Admisnistrador.AltaEmpleado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4">Alta de Empleado</h2>

        <!-- Nombre -->
        <div class="mb-3">
            <label for="txtNombre" class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre" required="true"></asp:TextBox>
        </div>

        <!-- Apellido -->
        <div class="mb-3">
            <label for="txtApellido" class="form-label">Apellido</label>
            <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" placeholder="Apellido" required="true"></asp:TextBox>
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label for="txtEmail" class="form-label">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="ejemplo@correo.com" required="true"></asp:TextBox>
        </div>

        <!-- Teléfono -->
        <div class="mb-3">
            <label for="txtTelefono" class="form-label">Teléfono</label>
            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Teléfono"></asp:TextBox>
        </div>

        <!-- Fecha de Ingreso -->
        <div class="mb-3">
            <label for="txtFechaIngreso" class="form-label">Fecha de Ingreso</label>
            <asp:TextBox ID="txtFechaIngreso" runat="server" CssClass="form-control" TextMode="Date" required="true"></asp:TextBox>
        </div>

        <!-- Cargo -->
        <div class="mb-3">
            <label for="ddlCargo" class="form-label">Cargo</label>
            <asp:DropDownList ID="ddlCargo" runat="server" CssClass="form-select" required="true">
                <asp:ListItem Text="Seleccione un cargo" Value="" />
                <asp:ListItem Text="Administrativo" Value="Administrativo" />
           
                <asp:ListItem Text="Gerente" Value="Gerente" />
            </asp:DropDownList>
        </div>

        <!-- Botón Guardar -->
        <asp:Button ID="btnGuardarEmpleado" runat="server" Text="Guardar Empleado" CssClass="btn btn-success"  />
    </form>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
