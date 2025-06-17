using ENTIDADES;
using Negocios;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPLAB3_GRUPO4.Usuarios.Empleado
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        NegocioCliente nc = new NegocioCliente();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarClientesGrid();
            }
        }

        private void CargarClientesGrid()
        {
            gvClientes.DataSource = nc.ObtenerClientes();
            gvClientes.DataBind();
        }

        protected void btnRegistrarCliente_Click(object sender, EventArgs e)
        {
            Clientes cliente = new Clientes
            {
                Nombre = txtNombreCliente.Text,
                Domicilio = txtDireccionCliente.Text,
                Telefono = txtTelefonoCliente.Text,
                DNI = int.Parse(txtDNICliente.Text)
            };

            nc.AgregarCliente(cliente);

            lblMensaje.Text = "Cliente registrado correctamente.";
           
            CargarClientesGrid();
        }

      
    }
}