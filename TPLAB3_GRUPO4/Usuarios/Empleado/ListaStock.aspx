<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaStock.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.ListaStock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-4">
    <h2>Lista de Stock</h2>
     <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary" />
    <div class="mb-3">
        <asp:Label ID="lblFiltro" runat="server" Text="Buscar componente: " CssClass="form-label" />
        <asp:TextBox ID="txtFiltro" runat="server" CssClass="form-control" Width="300px" />
        <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn btn-primary mt-2" OnClick="btnFiltrar_Click" />
        <asp:Button ID="btnMostrarTodo" runat="server" Text="Mostrar Todo" CssClass="btn btn-secondary mt-2 ms-2" OnClick="btnMostrarTodo_Click" />
    </div>

    <asp:GridView ID="gvStock" runat="server" CssClass="table table-striped" AutoGenerateColumns="true"></asp:GridView>
</div>
    </form>
</body>
</html>
