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
                CargarProductos();
                CargarClientes();
            }
        }
        private void CargarProductos()
        {
            ddlProducto.DataSource = negocioComponente.ObtenerComponentes();
            ddlProducto.DataTextField = "Nombre";
            ddlProducto.DataValueField = "IDComponente";
            ddlProducto.DataBind();
            ddlProducto.Items.Insert(0, new ListItem("-- Seleccione Producto --", "0"));
        }

        private void CargarClientes()
        {
            ddlCliente.DataSource = negocioCliente.ObtenerClientes();
            ddlCliente.DataTextField = "Nombre";
            ddlCliente.DataValueField = "IDCliente";
            ddlCliente.DataBind();
            ddlCliente.Items.Insert(0, new ListItem("-- Seleccione Cliente --", "0"));
        }

        protected void btnRegistrarVenta_Click(object sender, EventArgs e)
        {
            try
            {
                Venta venta = new Venta
                {
                    ClienteID = int.Parse(ddlCliente.SelectedValue),
                    Usuario = 2, // Reemplazar con el ID real del usuario logueado
                    FechaVenta = DateTime.Now,
                    Total = decimal.Parse(txtCantidad.Text) * decimal.Parse(txtPrecio.Text),
                    Estado = "1"
                };

                var detalle = new DetalleVenta
                {
                    Componente = int.Parse(ddlProducto.SelectedValue),
                    Cantidad = int.Parse(txtCantidad.Text),
                    PrecioUnitario = decimal.Parse(txtPrecio.Text)
                };

                venta.Detalles = new List<DetalleVenta> { detalle };

                // Guardar en la BDD
                negocioVenta.RegistrarVenta(venta);

                // Mostrar lo que se guardó
                DataTable dt = new DataTable();
                dt.Columns.Add("Componente");
                dt.Columns.Add("Cantidad");
                dt.Columns.Add("PrecioUnitario");
                dt.Columns.Add("Total");

                DataRow row = dt.NewRow();
                row["Componente"] = ddlProducto.SelectedItem.Text;
                row["Cantidad"] = detalle.Cantidad;
                row["PrecioUnitario"] = detalle.PrecioUnitario;
                row["Total"] = venta.Total;
                dt.Rows.Add(row);

                gvUltimaVenta.DataSource = dt;
                gvUltimaVenta.DataBind();

                Response.Write("<script>alert('Venta registrada correctamente');</script>");
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error al registrar la venta: " + ex.Message + "');</script>");
            }

        }
    }
    }
