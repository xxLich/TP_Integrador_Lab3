using ENTIDADES;
using Negocios;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPLAB3_GRUPO4.Usuarios.Empleado
{
    public partial class CargaVenta : System.Web.UI.Page
    {

        NegocioVentas negocioVenta = new NegocioVentas();
        NegocioComponente negocioComponente = new NegocioComponente();
        NegocioCliente negocioCliente = new NegocioCliente();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlProducto.DataSource = negocioComponente.ObtenerComponentes();
                ddlProducto.DataTextField = "Nombre";
                ddlProducto.DataValueField = "IDComponente";
                ddlProducto.DataBind();
                ddlProducto.Items.Insert(0, new ListItem("-- Seleccione Producto --", ""));

                ddlCliente.DataSource = negocioCliente.ObtenerClientes();
                ddlCliente.DataTextField = "Nombre";
                ddlCliente.DataValueField = "IDCliente";
                ddlCliente.DataBind();
                ddlCliente.Items.Insert(0, new ListItem("-- Seleccione Cliente --", ""));
            }
        }

        protected void ddlProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idComponente = int.Parse(ddlProducto.SelectedValue);
            DataTable dt = negocioComponente.ObtenerComponentePorID(idComponente);

            if (dt.Rows.Count > 0)
            {
                decimal precio = Convert.ToDecimal(dt.Rows[0]["PrecioVenta"]);
                txtPrecio.Text = precio.ToString("0.00");
            }
        }

        protected void btnRegistrarVenta_Click(object sender, EventArgs e)
        {
            int cantidad = int.Parse(txtCantidad.Text);
            decimal precio = decimal.Parse(txtPrecio.Text);

            Venta venta = new Venta
            {
                ClienteID = int.Parse(ddlCliente.SelectedValue),
                Usuario = 2,
                FechaVenta = DateTime.Now,
                Total = cantidad * precio,
                Estado = "1",
                Detalles = new List<DetalleVenta>
            {
                new DetalleVenta
                {
                    Componente = int.Parse(ddlProducto.SelectedValue),
                    Cantidad = cantidad,
                    PrecioUnitario = precio
                }
            }
            };

            negocioVenta.RegistrarVenta(venta);

            gvUltimaVenta.DataSource = new[]
            {
            new
            {
                Componente = ddlProducto.SelectedItem.Text,
                Cantidad = cantidad,
                PrecioUnitario = precio,
                Total = venta.Total
            }
        };
            gvUltimaVenta.DataBind();
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Empleado/inicioEmpleado.aspx");
        }
    }
}
    
