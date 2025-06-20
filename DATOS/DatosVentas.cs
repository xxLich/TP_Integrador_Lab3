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
    public class DatosVentas
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
       
        AccesoDatos ad = new AccesoDatos();
     

        public bool RegistrarDetalleVenta(int idVenta, List<DetalleVenta> detalles)
        {
            using (SqlConnection con = ad.ObtenerConexion())
            {
                con.Open();

                foreach (var item in detalles)
                {
                    SqlCommand cmd = new SqlCommand(@"INSERT INTO DetalleVenta (IDVenta, IDComponente, Cantidad, PrecioUnitario)
                                                      VALUES (@IDVenta, @IDComponente, @Cantidad, @PrecioUnitario)", con);

                    cmd.Parameters.AddWithValue("@IDVenta", idVenta);
                    cmd.Parameters.AddWithValue("@IDComponente", item.Componente);
                    cmd.Parameters.AddWithValue("@Cantidad", item.Cantidad);
                    cmd.Parameters.AddWithValue("@PrecioUnitario", item.PrecioUnitario);

                    cmd.ExecuteNonQuery();
                }
            }

            return true;
        }
        public DataTable ObtenerVistaVentas()
        {
            DataTable dt = new DataTable();
            string consulta = @"
        SELECT *  FROM VW_Ventas";

            using (SqlConnection con = ad.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand(consulta, con);
               return ad.ObtenerTablaConComando("VW_Ventas", cmd);
                
            }

          
        }
        public DataTable FiltroVistaVentas(int IDVenta)
        {
            DataTable dt = new DataTable();
            string consulta = @"
        SELECT *  FROM VW_Ventas AS VWV
       WHERE VWV.IDVenta=@IDVenta";

            using (SqlConnection con = ad.ObtenerConexion())
            {
                SqlCommand cmd = new SqlCommand(consulta, con);
                cmd.Parameters.AddWithValue("IDVenta", IDVenta);
                return ad.ObtenerTablaConComando("VW_Ventas", cmd);

            }


        }
        public DataTable ObtenerResumenVentas()
        {
            using (SqlConnection conexion = ad.ObtenerConexion())
            {
                string consulta = "SELECT * FROM VW_ResumenVentas";
                SqlDataAdapter da = new SqlDataAdapter(consulta, conexion);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        public DataTable FiltrarResumenPorFecha(DateTime fecha)
        {
            using (SqlConnection conexion = ad.ObtenerConexion())
            {
                string consulta = "SELECT * FROM VW_ResumenVentas WHERE FechaVenta = @Fecha";
                SqlCommand cmd = new SqlCommand(consulta, conexion);
                cmd.Parameters.AddWithValue("@Fecha", fecha);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }














    }

}

