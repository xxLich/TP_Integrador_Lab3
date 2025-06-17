using System;
using System.Data;
using Negocios;
using ENTIDADES;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace TPLAB3_GRUPO4.Usuarios.Admisnistrador
{
    public partial class AltaEmpleado : System.Web.UI.Page
    {
        negocioUsuario nu = new negocioUsuario();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnGuardarEmpleado_Click1(object sender, EventArgs e)
        {
            lblMensaje.Text= "ddlCargo.SelectedIndex";
            try
            {

                DateTime fechaRegistro = DateTime.Parse(txtFechaIngreso.Text);


                Usuario usuario = new Usuario

                {
                    Nombre = txtNombre.Text,
                    Apellido = txtApellido.Text,
                    Email = txtEmail.Text,
                    Clave = txtclave.Text,
                    Rol = ddlCargo.SelectedIndex


                };
                bool resultado = nu.agregarEmpleado(usuario);

                if (resultado)
                {
                    lblMensaje.Text = "Empleado agregado correctamente.";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;

                }
                else
                {
                    lblMensaje.Text = "No se pudo agregar el Empleado";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }
                
            }
            catch (Exception ex)
            {

            }
        }
    }
  }
