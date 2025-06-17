using ENTIDADES;
using Negocios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPLAB3_GRUPO4.Usuarios.Empleado
{
    public partial class CargaIngreso : System.Web.UI.Page
    {


        private NegocioIngresos negocio = new NegocioIngresos();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProveedor.DataSource = negocio.ListarProveedores();
                ddlProveedor.DataTextField = "Nombre";
                ddlProveedor.DataValueField = "IDProveedor";
                ddlProveedor.DataBind();

                ddlComponente1.DataSource = negocio.ListarComponentes();
                ddlComponente1.DataTextField = "Nombre";
                ddlComponente1.DataValueField = "IDComponente";
                ddlComponente1.DataBind();

                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        protected void btnRegistrarIngreso_Click(object sender, EventArgs e)
        {
            var detalles = new List<DetalleIngreso>
        {
            new DetalleIngreso
            {
                IDComponente = Convert.ToInt32(ddlComponente1.SelectedValue),
                Cantidad = Convert.ToInt32(txtCantidad1.Text),
                PrecioUnitario = Convert.ToDecimal(txtPrecio1.Text)
            }
        };

            var ingreso = new Ingreso
            {
                UsuarioID = 2,
                ProveedorID = Convert.ToInt32(ddlProveedor.SelectedValue),
                Fecha = Convert.ToDateTime(txtFecha.Text),
                Detalles = detalles,
                Total = detalles.Sum(d => d.Cantidad * d.PrecioUnitario)
            };

            negocio.Registrar(ingreso);
            gvDetalles.DataSource = detalles;
            gvDetalles.DataBind();
        }


    }





}

