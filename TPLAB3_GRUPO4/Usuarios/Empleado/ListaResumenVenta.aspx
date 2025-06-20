<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListaResumenVenta.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.ListaResumenVenta" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
       <title>Resumen de Ventas</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
             <div class="container mt-4">
         <h2>Resumen de Ventas</h2>
         <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary" />
         <div class="mb-3">
             <asp:Label ID="lblFecha" runat="server" Text="Filtrar por Fecha: " CssClass="form-label" />
             <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" Width="250px" Placeholder="YYYY-MM-DD" />
             <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" CssClass="btn btn-primary mt-2" OnClick="btnFiltrar_Click" />
             <asp:Button ID="btnMostrarTodo" runat="server" Text="Mostrar Todo" CssClass="btn btn-secondary mt-2 ms-2" OnClick="btnMostrarTodo_Click" />
         </div>

         <asp:GridView ID="gvResumenVentas" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="true" />
     </div>
    </form>
</body>
</html>
