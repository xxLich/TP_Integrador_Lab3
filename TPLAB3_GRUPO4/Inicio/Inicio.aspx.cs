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

            negocioUsuario negocio = new negocioUsuario();  // Instanciás la clase

            Usuario usuario = negocio.LoginUsuario(email, clave);  // Llamás al método en la instancia

            if (usuario != null)
            {
                Session["UsuarioLogueado"] = usuario;
                Response.Redirect("~/Inicio/Panel.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Usuario o contraseña incorrectos.');", true);
            }
        }
    }
    }
