using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPLAB3_GRUPO4.Usuarios.Empleado
{
    public partial class ListaResumenVenta : System.Web.UI.Page
    {
        NegocioVentas negocio = new NegocioVentas();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarResumen();
            }

        }
        private void CargarResumen()
        {
            gvResumenVentas.DataSource = negocio.ObtenerResumenCompleto();
            gvResumenVentas.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            DateTime fecha;
            if (DateTime.TryParse(txtFecha.Text.Trim(), out fecha))
            {
                gvResumenVentas.DataSource = negocio.FiltrarResumenPorFecha(fecha);
                gvResumenVentas.DataBind();
            }
            else
            {

                CargarResumen();
            }
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            CargarResumen();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Empleado/inicioEmpleado.aspx");
        }
    }
}