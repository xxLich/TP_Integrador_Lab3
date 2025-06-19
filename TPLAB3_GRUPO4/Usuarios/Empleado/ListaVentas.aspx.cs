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
            if (!IsPostBack)
            {
                CargarGrid();
            }
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Empleado/inicioEmpleado.aspx");
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            
          
     }

        public void CargarGrid()
        {

            DataTable dt = nv.ObtenerDetalleVentasParaGrid();
            grdDetalleVenta.DataSource = dt;
           grdDetalleVenta.DataBind();

        }

    }
    
}