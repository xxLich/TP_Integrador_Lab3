using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ENTIDADES;
using Negocios;
namespace TPLAB3_GRUPO4.Usuarios.Admisnistrador
{
    public partial class BajaEmpleado : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        negocioUsuario NU = new negocioUsuario();
        Usuario us = new Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grdbajaUsuario_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(((Label)grdBajaUsuario.Rows[e.RowIndex].FindControl("lblID")).Text);

            int eliminado = NU.EliminarUsuarioNegocio(ID);


            if (eliminado >= 1)
            {
                txtIDUsuario.Text = string.Empty;
                lblMensaje.Text = "Componente eliminado con éxito.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
               txtIDUsuario.Text = string.Empty;
                lblMensaje.Text = "No se pudo eliminar el Componente";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void btnEliminarEmpleado_Click(object sender, EventArgs e)
        {
            dt = NU.FiltrarUsuario(Convert.ToInt32(txtIDUsuario.Text));

            if (dt != null && dt.Rows.Count > 0)
            {
                grdBajaUsuario.DataSource = dt;
                grdBajaUsuario.DataBind();
                lblMensaje.Text = string.Empty;
            }
            else
            {
                grdBajaUsuario.DataSource = null;
                grdBajaUsuario.DataBind();
                lblMensaje.Text = "No se encontró el Componente.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}