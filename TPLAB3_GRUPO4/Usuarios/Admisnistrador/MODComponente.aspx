<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MODComponente.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Admisnistrador.MODComponente" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Modificar Componente</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-primary">Modificar Componente</h2>

        <div class="mb-3">
            <label for="TextBox1" class="form-label">ID Componente</label>
            <asp:TextBox ID="txtbuscar" runat="server" CssClass="form-control" />
        </div>

        <div class="mb-3">
            <asp:Button ID="btnBuscarID" runat="server" Text="Buscar" CssClass="btn btn-success" OnClick="btnBuscarID_Click" />
        </div>

        <div class="mb-3">
            <asp:GridView ID="grdBajaC" runat="server" CssClass="table table-bordered table-striped table-hover"
                AutoGenerateColumns="False"
                GridLines="None"
                CellPadding="4"
                ForeColor="#333333" AutoGenerateEditButton="True" OnRowCancelingEdit="grdCancelEditC_RowCancelingEdit" OnRowEditing="grdEditC_RowEditing" OnRowUpdating="grdUpdC_RowUpdating"  >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="IDComponente">
                        <ItemTemplate>
                            <asp:Label ID="lblIDComponente" runat="server" Text='<%# Bind("IDComponente") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Nombre">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtNombre" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("Nombre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Descripcion">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtDescripcion" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblDescripcion" runat="server" Text='<%# Bind("Descripcion") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="IDCategoria">
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlCategoria" runat="server">
                            </asp:DropDownList>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblCategoria" runat="server" Text='<%# Bind("IDCategoria") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PrecioVenta">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrecioventa" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPrecioventa" runat="server" Text='<%# Bind("Precioventa") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PrecioCosto">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtPrecioCosto" runat="server" CssClass="accordion-header"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblPrecioCosto" runat="server" Text='<%# Bind("PrecioCosto") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Stock">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtStock" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblStock" runat="server" Text='<%# Bind("Stock") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="FechaCreación">
                        <EditItemTemplate>
                            <asp:TextBox ID="txtFechaCreacion" runat="server" TextMode="Date"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblFechaCreacion" runat="server" Text='<%# Bind("FechaCreacion") %>'></asp:Label>
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

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </form>

    </body>
</html>
