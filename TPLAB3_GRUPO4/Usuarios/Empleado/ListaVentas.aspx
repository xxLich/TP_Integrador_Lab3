<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaVentas.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Inicio Empleado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">

            <div class="d-flex justify-content-between align-items-center mb-4 position-sticky top-0 bg-white py-2" style="z-index: 1000;">
                <h2 class="mb-0">Lista de ventas</h2>
                <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary" />
            </div>

            <div class="mb-3">
                <asp:Label ID="lblFiltro" runat="server" Text="Ingrese ID: "></asp:Label>
                <asp:TextBox ID="txtIDFiltro" runat="server" CssClass="form-control d-inline-block w-auto" />
                <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click" CssClass="btn btn-primary ms-2" />
            </div>

            <asp:GridView ID="grdVentas" runat="server" CssClass="table table-striped"></asp:GridView>

        </div>
    </form>
</body>
</html>
