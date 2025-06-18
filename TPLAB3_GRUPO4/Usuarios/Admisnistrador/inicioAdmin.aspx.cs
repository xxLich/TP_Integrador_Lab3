using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPLAB3_GRUPO4.Usuarios.Admisnistrador
{
    public partial class inicioAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnAltaComponente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Admisnistrador/ALTAComponente.aspx");
        }

        protected void btnAltaEmpleado_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Admisnistrador/AltaEmpleado.aspx");
        }

        protected void btnBajaComponente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Admisnistrador/BAJAComponente.aspx");
        }

        protected void btnBajaEmpleado_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Admisnistrador/BajaEmpleado.aspx");
        }

        protected void btnModificarComponente_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Admisnistrador/MODComponente.aspx");
        }

        protected void btnModificarEmpleado_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Admisnistrador/ModEmpleado.aspx");
        }
    }
}