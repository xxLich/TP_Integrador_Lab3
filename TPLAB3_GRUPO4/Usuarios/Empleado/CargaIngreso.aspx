<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CargaIngreso.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Empleado.CargaIngreso" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-primary">Registrar Ingreso</h2>

        <!-- Selección del tipo de ingreso -->
        <div class="mb-3">
            <label for="ddlTipoIngreso" class="form-label">Tipo de Ingreso</label>
            <asp:DropDownList ID="ddlTipoIngreso" runat="server" CssClass="form-select" required>
                <asp:ListItem Text="Seleccione" Value="" />

            </asp:DropDownList>
        </div>

        <!-- Monto o cantidad -->
        <div class="mb-3">
            <label for="txtCantidad" class="form-label">Monto / Cantidad</label>
            <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" TextMode="Number" step="0.01" required />
        </div>

        <!-- Descripción -->
        <div class="mb-3">
            <label for="txtDescripcion" class="form-label">Descripción</label>
            <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
        </div>

        <!-- Fecha del ingreso -->
        <div class="mb-3">
            <label for="txtFecha" class="form-label">Fecha</label>
            <asp:TextBox ID="txtFecha" runat="server" CssClass="form-control" TextMode="Date" />
        </div>

        <!-- Botón Guardar -->
        <asp:Button ID="btnRegistrarIngreso" runat="server" Text="Registrar" CssClass="btn btn-success"  />
    </form>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
