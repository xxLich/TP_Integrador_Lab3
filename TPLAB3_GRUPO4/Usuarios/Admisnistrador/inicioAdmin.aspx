<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="inicioAdmin.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Admisnistrador.inicioAdmin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Administrador</title>
    
    <!-- Bootstrap CSS desde CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <h2 class="mb-4">Panel de Administración</h2>
            <div class="d-grid gap-3">

               <asp:Button ID="btnAltaComponente" runat="server" Text="Alta Componente" CssClass="btn btn-primary m-2" OnClick="btnAltaComponente_Click" />
<asp:Button ID="btnAltaEmpleado" runat="server" Text="Alta Empleado" CssClass="btn btn-primary m-2" OnClick="btnAltaEmpleado_Click" />
<asp:Button ID="btnBajaComponente" runat="server" Text="Baja Componente" CssClass="btn btn-danger m-2" OnClick="btnBajaComponente_Click" />
<asp:Button ID="btnBajaEmpleado" runat="server" Text="Baja Empleado" CssClass="btn btn-danger m-2" OnClick="btnBajaEmpleado_Click" />
<asp:Button ID="btnModificarComponente" runat="server" Text="Modificar Componente" CssClass="btn btn-warning m-2" OnClick="btnModificarComponente_Click" />
<asp:Button ID="btnModificarEmpleado" runat="server" Text="Modificar Empleado" CssClass="btn btn-warning m-2" OnClick="btnModificarEmpleado_Click" />


            </div>
        </div>
    </form>

    <!-- Bootstrap JS (opcional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
