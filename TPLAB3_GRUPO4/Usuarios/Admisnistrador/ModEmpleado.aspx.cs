using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocios;
using ENTIDADES;

namespace TPLAB3_GRUPO4.Usuarios.Admisnistrador
{
    public partial class ModEmpleado : System.Web.UI.Page
    {


        DataTable dt = new DataTable();
        negocioUsuario NU = new negocioUsuario();

       
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void CargarGrid()
        {
            dt = NU.FiltrarUsuario(Convert.ToInt32(txtIDUsuarioBuscar.Text));
            CargarGrid(dt);

        }
        public void CargarGrid(DataTable dt)
        {
           grdUsuario.DataSource = dt;
           grdUsuario.DataBind();
        }
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            dt = NU.FiltrarUsuario(Convert.ToInt32(txtIDUsuarioBuscar.Text));

            if (dt != null && dt.Rows.Count > 0)
            {
                CargarGrid(dt);
                lblMensaje.Text = string.Empty;
            }
            else
            {
                grdUsuario.DataSource = null;
               grdUsuario.DataBind();
                lblMensaje.Text = "No se encontró el Usuario.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void grdEDIT_RowEditing(object sender, GridViewEditEventArgs e)
        {
            btnBuscar.Visible = false;
            grdUsuario.EditIndex = e.NewEditIndex;
            CargarGrid();
            GridViewRow row = grdUsuario.Rows[e.NewEditIndex];
      
        }

        protected void grdUpdt_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int _IDUsuario = int.Parse(((Label)grdUsuario.Rows[e.RowIndex].FindControl("lblIDUsuario")).Text); ;
            string _Nombre = ((TextBox)grdUsuario.Rows[e.RowIndex].FindControl("txtNombre")).Text;
            string _Apellido = ((TextBox)grdUsuario.Rows[e.RowIndex].FindControl("txtApellido")).Text;
            string _Email= ((TextBox)grdUsuario.Rows[e.RowIndex].FindControl("txtEmail")).Text;
            int _ddlRol = int.Parse(((DropDownList)grdUsuario.Rows[e.RowIndex].FindControl("ddlIDRol")).SelectedValue);




            Usuario usuario = new Usuario
            {
                IDUsuario = _IDUsuario,
                Nombre = _Nombre,
                Apellido = _Apellido,
                Email = _Email,
                Rol=_ddlRol


            };

            NU.ModificarUsuario(usuario);
            grdUsuario.EditIndex = -1;
            CargarGrid();
            lblMensaje.Text = "Usuario Modificado con exito";
            lblMensaje.ForeColor = System.Drawing.Color.Green;
           btnBuscar.Visible = true;
        }

        protected void grdCancel_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
           
            btnBuscar.Visible = true;
           grdUsuario.EditIndex = -1;
            CargarGrid();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Admisnistrador/inicioAdmin.aspx");
        }
    }
}