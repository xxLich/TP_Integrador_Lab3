<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargaClientes.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.CargaClientes" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>Registrar Cliente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="text-primary mb-4">Registrar Cliente</h2>
        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary" />

        <div class="mb-3">
            <label for="txtNombreCliente" class="form-label">Nombre</label>
            <asp:TextBox ID="txtNombreCliente" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label for="txtDireccionCliente" class="form-label">Domicilio</label>
            <asp:TextBox ID="txtDireccionCliente" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label for="txtTelefonoCliente" class="form-label">Teléfono</label>
            <asp:TextBox ID="txtTelefonoCliente" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <label for="txtDNICliente" class="form-label">DNI</label>
            <asp:TextBox ID="txtDNICliente" runat="server" CssClass="form-control" TextMode="Number" />
        </div>

        <div class="mb-3">
            <asp:Button ID="btnRegistrarCliente" runat="server" Text="Registrar Cliente" CssClass="btn btn-success" OnClick="btnRegistrarCliente_Click" />
        </div>

        <asp:Label ID="lblMensaje" runat="server" CssClass="fw-bold" />

        <hr />

        <h4 class="text-secondary">Listado de Clientes</h4>
        <asp:GridView ID="gvClientes" runat="server" CssClass="table table-bordered table-striped mt-3" AutoGenerateColumns="true" />
    </form>

       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
