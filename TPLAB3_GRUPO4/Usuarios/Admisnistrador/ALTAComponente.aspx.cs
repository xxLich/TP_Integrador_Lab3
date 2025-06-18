using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocios;
using ENTIDADES;

namespace TPLAB3_GRUPO4.Usuarios.Admisnistrador
{
    public partial class ALTAComponente : System.Web.UI.Page
    {
        NegocioComponente comp = new NegocioComponente();
        NegocioCategoria nc = new NegocioCategoria();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategoria();
            }
        }

        private void CargarCategoria()
        {
            var dtProvincias = nc.obtenerCategoria();
            ddlCategoria.DataSource = dtProvincias;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "IDCategoria";
            ddlCategoria.DataBind();


            ddlCategoria.Items.Insert(0, new ListItem("--SELECCIONAR Categoria--", "0"));
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
           
            try
            {

                DateTime fechaCreacion = DateTime.Parse(txtFecha.Text);


                Componente componente = new Componente

                {
                    Nombre = txtNombre.Text,
                    Descripcion = txtDescripcion.Text,
                    Categoria = ddlCategoria.SelectedIndex,
                    PrecioCosto = Decimal.Parse(txtPrecioCosto.Text),
                    PrecioVenta = Decimal.Parse(txtPrecioVenta.Text),
                    Stock = int.Parse(txtStock.Text),
                    FechaCreacion = fechaCreacion,
                    Estado = 1
                    
                };
                bool resultado = comp.agregarComponente(componente);

                if (resultado)
                {
                    lblMensaje.Text = "Componente agregado correctamente.";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMensaje.Text = "No se pudo agregar el Componente";
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                }

            }
            catch (Exception ex)
            {

            }


        }
    }
}