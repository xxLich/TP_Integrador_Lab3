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
        private NegocioIngresos negocioIngresos = new NegocioIngresos();

        // Este método se ejecuta cuando la página se carga por primera vez.
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProveedores();
                CargarComponentes();
                txtFecha.Text = DateTime.Now.ToString("yyyy-MM-dd");  // Fecha predeterminada al día actual
            }
        }

        // Cargar los proveedores en el DropDownList
        private void CargarProveedores()
        {
            DataTable dtProveedores = negocioIngresos.ListarProveedores();
            ddlProveedor.DataSource = dtProveedores;
            ddlProveedor.DataTextField = "Nombre";
            ddlProveedor.DataValueField = "IDProveedor";
            ddlProveedor.DataBind();
            ddlProveedor.Items.Insert(0, new ListItem("Seleccione un proveedor", ""));
        }

        // Cargar los componentes en el DropDownList
        private void CargarComponentes()
        {
            DataTable dtComponentes = negocioIngresos.ListarComponentes();
            ddlComponente1.DataSource = dtComponentes;
            ddlComponente1.DataTextField = "Nombre";
            ddlComponente1.DataValueField = "IDComponente";
            ddlComponente1.DataBind();
            ddlComponente1.Items.Insert(0, new ListItem("Seleccione componente", ""));
        }

        // Este método se ejecuta cuando el usuario hace clic en el botón "Registrar Ingreso"
        protected void btnRegistrarIngreso_Click(object sender, EventArgs e)
        {
            // Verificar si los datos son válidos antes de procesar
            if (!ValidarFormulario())
                return;

            try
            {
                // Obtener el ID del usuario (puedes adaptar esto según la sesión de usuario)
                int usuarioId = 2;

                // Obtener los detalles del ingreso
                var detalles = ObtenerDetallesIngreso();

                if (detalles == null || detalles.Count == 0)
                {
                    MostrarMensaje("Error", "No se encontraron detalles válidos", true);
                    return;
                }

                // Crear un nuevo objeto de ingreso
                var nuevoIngreso = new Ingreso
                {
                    UsuarioID = usuarioId,
                    ProveedorID = Convert.ToInt32(ddlProveedor.SelectedValue),
                    Fecha = Convert.ToDateTime(txtFecha.Text),  // Usar la fecha ingresada
                    Detalles = detalles,
                    Total = CalcularTotal(detalles)  // Calcular el total
                };

                // Registrar el ingreso
                negocioIngresos.Registrar(nuevoIngreso);

                // Mostrar mensaje de éxito
                MostrarMensaje("Éxito", $"Ingreso registrado correctamente. Total: {nuevoIngreso.Total:C}", false);

                // Cargar los detalles en la tabla GridView
                gvDetalles.DataSource = detalles;
                gvDetalles.DataBind();
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error", $"Error: {ex.Message}", true);
            }
        }

        // Obtener los detalles del ingreso (componente, cantidad, precio)
        private List<DetalleIngreso> ObtenerDetallesIngreso()
        {
            var detalles = new List<DetalleIngreso>();

            // Verificar si el componente y los valores de cantidad y precio son válidos
            if (!string.IsNullOrEmpty(ddlComponente1.SelectedValue) &&
                !string.IsNullOrEmpty(txtCantidad1.Text) &&
                !string.IsNullOrEmpty(txtPrecio1.Text))
            {
                detalles.Add(new DetalleIngreso
                {
                    IDComponente = Convert.ToInt32(ddlComponente1.SelectedValue),
                    Cantidad = Convert.ToInt32(txtCantidad1.Text),
                    PrecioUnitario = Convert.ToDecimal(txtPrecio1.Text)
                });
            }

            return detalles;
        }

        // Calcular el total del ingreso (cantidad * precio unitario)
        private decimal CalcularTotal(List<DetalleIngreso> detalles)
        {
            decimal total = 0;
            foreach (var detalle in detalles)
            {
                total += detalle.Cantidad * detalle.PrecioUnitario;
            }
            return total;
        }

        // Validar los datos del formulario
        private bool ValidarFormulario()
        {
            if (string.IsNullOrEmpty(ddlProveedor.SelectedValue))
            {
                MostrarMensaje("Validación", "Seleccione un proveedor", true);
                return false;
            }

            if (string.IsNullOrEmpty(ddlComponente1.SelectedValue))
            {
                MostrarMensaje("Validación", "Seleccione un componente", true);
                return false;
            }

            if (string.IsNullOrEmpty(txtCantidad1.Text) || string.IsNullOrEmpty(txtPrecio1.Text))
            {
                MostrarMensaje("Validación", "Complete la cantidad y precio del componente", true);
                return false;
            }

            return true;
        }

        // Mostrar mensajes de éxito o error en la página
        private void MostrarMensaje(string titulo, string mensaje, bool isError)
        {
            // Mostrar un mensaje de alerta en la página
            string tipo = isError ? "alert-danger" : "alert-success"; // Clase de Bootstrap para el tipo de alerta
            string icono = isError ? "fa-exclamation-circle" : "fa-check-circle"; // Icono dependiendo de si es un error o éxito

            // Crear el HTML de la alerta
            string alertaHtml = $@"
                <div class='alert {tipo} alert-dismissible fade show' role='alert'>
                    <i class='fa {icono}'></i> <strong>{titulo}:</strong> {mensaje}
                    <button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button>
                </div>";

            // Mostrar el mensaje en un contenedor de alertas
          //  divAlertas.InnerHtml = alertaHtml;
        }
    }

}

