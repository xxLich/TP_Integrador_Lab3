using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTIDADES;
namespace DATOS
{
    public class DatosIngresos
    {

        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TP_INTEGRADOR_GP4"].ConnectionString;

        public void RegistrarIngreso(Ingreso ingreso)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Registrar_Ingreso_De_Stock", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Usuario", ingreso.UsuarioID);
                cmd.Parameters.AddWithValue("@Proveedor", ingreso.ProveedorID);
                cmd.Parameters.AddWithValue("@fecha", ingreso.Fecha);
                cmd.Parameters.AddWithValue("@total", ingreso.Total);

                // Tipo de tabla
                DataTable detalleTable = new DataTable();
                detalleTable.Columns.Add("IDComponente", typeof(int));
                detalleTable.Columns.Add("Cantidad", typeof(int));
                detalleTable.Columns.Add("PrecioUnitario", typeof(decimal));

                foreach (var detalle in ingreso.Detalles)
                {
                    detalleTable.Rows.Add(detalle.IDComponente, detalle.Cantidad, detalle.PrecioUnitario);
                }

                SqlParameter tvp = cmd.Parameters.AddWithValue("@Detalles", detalleTable);
                tvp.SqlDbType = SqlDbType.Structured;
                tvp.TypeName = "TipoDetalleIngreso";

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        public DataTable ObtenerProveedores()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT IDProveedor, Nombre FROM Proveedor";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable ObtenerComponentes()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT IDComponente, Nombre FROM Componentes WHERE Stock > 0";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }


    }
}
