using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ENTIDADES;
using DATOS;
using Negocios;

namespace TPLAB3_GRUPO4.Inicio
{
    public partial class Inicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            string email = txtUsuario.Text.Trim();
            string clave = txtContra.Text.Trim();

            byte[] claveHasheada = Seguridad.CalcularSHA256Bytes(clave);

            negocioUsuario negocio = new negocioUsuario();
            Usuario usuario = negocio.LoginUsuario(email, claveHasheada);

            if (usuario != null)
            {
                Session["UsuarioLogueado"] = usuario;

                if (usuario.Rol == 1)
                {
                    Response.Redirect("~/Usuarios/Admisnistrador/inicioAdmin.aspx");
                }
                else if (usuario.Rol == 2)
                {
                    Response.Redirect("~/Usuarios/Empleado/inicioEmpleado.aspx");
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Rol no reconocido.');", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Usuario o contraseña incorrectos.');", true);
            }
        }
    }
    }
