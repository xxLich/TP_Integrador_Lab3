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
    <asp:Label ID="lblFiltro" runat="server" Text="Ingrese ID: " CssClass="form-label me-2"></asp:Label>
    <asp:TextBox ID="txtIDFiltro" runat="server" CssClass="form-control d-inline-block w-auto me-2" ValidationGroup="group1" />
    
    <asp:Button ID="btnFiltrar" runat="server" Text="Filtrar" OnClick="btnFiltrar_Click"
        CssClass="btn btn-primary me-2" style="width: 80px;" ValidationGroup="group1" />
    
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Mostrar todo"
        CssClass="btn btn-outline-secondary" />
</div>

<asp:GridView ID="grdDetalleVenta" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" CellPadding="4" ForeColor="#333333" GridLines="None">
    <AlternatingRowStyle BackColor="White" />
    <Columns>
        <asp:TemplateField HeaderText="ID Venta">
            <ItemTemplate>
                <asp:Label ID="lblIDVenta" runat="server" Text='<%# Eval("IDVenta") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Fecha de Venta">
            <ItemTemplate>
                <asp:Label ID="lblFechaVenta" runat="server" Text='<%# Eval("FechaVenta") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Total">
            <ItemTemplate>
                <asp:Label ID="lblTotal" runat="server" Text='<%# Eval("Total") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="ID Cliente">
            <ItemTemplate>
                <asp:Label ID="lblIDCliente" runat="server" Text='<%# Eval("IDCliente") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="ID Detalle">
            <ItemTemplate>
                <asp:Label ID="lblIDDetalle" runat="server" Text='<%# Eval("IDDetalle") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="ID Componente">
            <ItemTemplate>
                <asp:Label ID="lblIDComponente" runat="server" Text='<%# Eval("IDComponente") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Cantidad">
            <ItemTemplate>
                <asp:Label ID="lblCantidad" runat="server" Text='<%# Eval("Cantidad") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Precio Unitario">
            <ItemTemplate>
                <asp:Label ID="lblPrecioUnitario" runat="server" Text='<%# Eval("PrecioUnitario") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Componente">
            <ItemTemplate>
                <asp:Label ID="lblNombreComponente" runat="server" Text='<%# Eval("Nombre_Componente") %>' />
            </ItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Stock">
            <ItemTemplate>
                <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Stock") %>' />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>

    <EditRowStyle BackColor="#2461BF" />
    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
    <RowStyle BackColor="#EFF3FB" />
    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
    <SortedAscendingCellStyle BackColor="#F5F7FB" />
    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
    <SortedDescendingCellStyle BackColor="#E9EBEF" />
    <SortedDescendingHeaderStyle BackColor="#4870BE" />
</asp:GridView>

     

        </div>
        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger fw-bold mt-2 d-block" />
        <asp:RequiredFieldValidator 
    ID="RequiredFieldValidator1" 
    runat="server" 
    ControlToValidate="txtIDFiltro" 
    ErrorMessage="* Campo requerido" 
    CssClass="text-danger fw-bold"
    ValidationGroup="group1"
    Display="Dynamic" />
    </form>
</body>
</html>
