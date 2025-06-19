using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocios;
namespace TPLAB3_GRUPO4.Usuarios.Empleado
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DataTable dt = new DataTable();

        NegocioVentas nv = new NegocioVentas();
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Empleado/inicioEmpleado.aspx");
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            int id = int.Parse(txtIDFiltro.Text);
            dt= nv.FiltroVistaVentasParaGrid(id);
            
            if (dt != null && dt.Rows.Count > 0)
            {
                grdDetalleVenta.DataSource = dt;
                grdDetalleVenta.DataBind();
            }
            else
            {
                grdDetalleVenta.DataSource = null;
                grdDetalleVenta.DataBind();
                lblMensaje.Text = "No se encontraron resultados.";
            }
        }

        public void CargarGrid()
        {

            dt = nv.ObtenerVistaVentasParaGrid();
            grdDetalleVenta.DataSource = dt;
           grdDetalleVenta.DataBind();

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
          
                CargarGrid();
            
        }
    }
    
}