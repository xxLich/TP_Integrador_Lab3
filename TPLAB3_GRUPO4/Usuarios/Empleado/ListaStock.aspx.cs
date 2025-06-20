using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ENTIDADES;

namespace TPLAB3_GRUPO4.Usuarios.Empleado
{
    public partial class ListaStock : System.Web.UI.Page
    {
        NegocioComponente negocioStock = new NegocioComponente();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarStock();
            }
        }

        private void CargarStock()
        {
            gvStock.DataSource = negocioStock.ObtenerStockCompleto();
            gvStock.DataBind();
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string nombre = txtFiltro.Text.Trim();
            gvStock.DataSource = negocioStock.FiltrarStockPorNombre(nombre);
            gvStock.DataBind();
        }

        protected void btnMostrarTodo_Click(object sender, EventArgs e)
        {
            CargarStock();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {

            Response.Redirect("~/Usuarios/Empleado/inicioEmpleado.aspx");
        }
    }
}