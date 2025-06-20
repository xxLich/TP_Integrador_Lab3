<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModEmpleado.aspx.cs" Inherits="TPLAB3_GRUPO4.Usuarios.Admisnistrador.ModEmpleado" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Modificar Empleado</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" class="container mt-5">
        <h2 class="mb-4 text-primary">Modificar Empleado</h2>
        <asp:Button ID="btnVolver" runat="server" OnClick="btnVolver_Click" Text="Volver" CssClass="btn btn-secondary" />

        <!-- Ingresar ID-Usuario -->
        <div class="row mb-3 align-items-end">
            <div class="col-md-4">
                <label for="txtIDUsuarioBuscar" class="form-label">Ingresar ID-Usuario:</label>
                <asp:TextBox ID="txtIDUsuarioBuscar" runat="server" CssClass="form-control" />
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
            </div>
        </div>

        <!-- GridView -->
        <asp:GridView ID="grdUsuario" runat="server" AutoGenerateColumns="False"
            CssClass="table table-striped table-bordered"
            GridLines="None" CellPadding="4" ForeColor="#333333" AutoGenerateEditButton="True" OnRowCancelingEdit="grdCancel_RowCancelingEdit" OnRowEditing="grdEDIT_RowEditing" OnRowUpdating="grdUpdt_RowUpdating">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Usuario">
                   
                    <ItemTemplate>
                        <asp:Label ID="lblIDUsuario" runat="server" Text='<%# Eval("IDUsuarios") %>' CssClass="form-label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Nombre">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblNombre" runat="server" Text='<%# Eval("Nombre") %>' CssClass="form-label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Apellido">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblApellido" runat="server" Text='<%# Eval("Apellido") %>' CssClass="form-label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Email">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Eval("Email") %>' CssClass="form-label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Rol">
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlIDRol" runat="server" CssClass="form-select">
                            <asp:ListItem Value="1">Administrador</asp:ListItem>
                            <asp:ListItem Value="2">Usuario</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblROL" runat="server" Text='<%# Eval("NombreRol") %>' CssClass="form-label"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle CssClass="table-primary" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>

        <!-- Guardar Cambios -->
        <div class="text-end mt-4">
        </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <asp:Label ID="lblMensaje" runat="server"></asp:Label>
    </form>

    </body>
</html>
