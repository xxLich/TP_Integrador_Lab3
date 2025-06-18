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
    public partial class BAJAComponente : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        NegocioComponente nc = new NegocioComponente();
        Componente comp = new Componente();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            dt = nc.FiltrarComponentes(Convert.ToInt32(txtbuscar.Text));

            if (dt!=null && dt.Rows.Count > 0)
            {
                grdComp.DataSource = dt;
                grdComp.DataBind();
                lblMensaje.Text = string.Empty;
            }
            else 
            {
                grdComp.DataSource = null;
                grdComp.DataBind();
                lblMensaje.Text = "No se encontró el Componente.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

      
        protected void grdComponentes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(((Label)grdComp.Rows[e.RowIndex].FindControl("lblID")).Text);

            int eliminado = nc.EliminarComponenteNegocio(ID);


            if (eliminado >= 1)
            {
               txtbuscar.Text = string.Empty;
                lblMensaje.Text = "Componente eliminado con éxito.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
            }
            else
            {
                txtbuscar.Text = string.Empty;
                lblMensaje.Text = "No se pudo eliminar el Componente";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}