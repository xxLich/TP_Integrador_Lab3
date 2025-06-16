using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    public class DatosVenta
    {

        private string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["TP_INTEGRADOR_GP4"].ConnectionString;

        public DataTable ObtenerComponentesActivos()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT IDComponente, Nombre FROM Componentes WHERE Estado = 1";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        /*
        public DataTable ObtenerClientes()
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                string sql = "SELECT IDCliente, Nombre FROM Cliente WHERE Estado = 1";
                SqlDataAdapter da = new SqlDataAdapter(sql, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        */
        public void RegistrarVenta(Venta venta)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand("Registrar_Venta_Stock", conn);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@Usuario", venta.Usuario);
                cmd.Parameters.AddWithValue("@Cliente", venta.ClienteID);
                cmd.Parameters.AddWithValue("@fecha", venta.FechaVenta);
                cmd.Parameters.AddWithValue("@total", venta.Total);

                // Crear DataTable para Detalles
                DataTable detalleTable = new DataTable();
                detalleTable.Columns.Add("IDComponente", typeof(int));
                detalleTable.Columns.Add("Cantidad", typeof(int));
                detalleTable.Columns.Add("PrecioUnitario", typeof(decimal));

                foreach (var detalle in venta.Detalles)
                {
                    detalleTable.Rows.Add(detalle.Componente, detalle.Cantidad, detalle.PrecioUnitario);
                }

                SqlParameter tvp = cmd.Parameters.AddWithValue("@Detalles", detalleTable);
                tvp.SqlDbType = SqlDbType.Structured;
                tvp.TypeName = "TipoDetalleVenta"; // Definir tipo tabla en BD para ventas similar a TipoDetalleIngreso

                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }



    }
}
