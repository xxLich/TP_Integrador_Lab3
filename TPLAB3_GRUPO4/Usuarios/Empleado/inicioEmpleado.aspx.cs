using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPLAB3_GRUPO4.Usuarios.Empleado
{
    public partial class inicioEmpleado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCargaIngreso_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Empleado/CargaIngreso.aspx"); // Cambiá la ruta si es necesario
        }

        protected void btnVenta_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Empleado/CargaVenta.aspx"); // Cambiá la ruta si es necesario
        }
    }
}