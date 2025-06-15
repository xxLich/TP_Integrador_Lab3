using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DATOS
{
    class DatosComponentes
    {

        readonly AccesoDatos ad = new AccesoDatos();

        SqlCommand cmd = new SqlCommand();
        SqlConnection conexion = new SqlConnection();
        SqlDataAdapter adapter = new SqlDataAdapter();

        public bool Agregar_Componente(Componente componente)
        {
            try
            {
                using (SqlConnection conexion = ad.ObtenerConexion())
                {
                    if (conexion == null) throw new Exception("No se pudo establecer la conexión con la base de datos.");

                    SqlCommand cmd = new SqlCommand("ALTACOMPONENTES", conexion)
                    {
                        CommandType = CommandType.StoredProcedure
                    };

                    // Agregar parámetros del procedimiento almacenado
                    cmd.Parameters.AddWithValue("@Nombre", componente.Nombre);
                    cmd.Parameters.AddWithValue("@Descripcion", componente.Descripcion);
                    cmd.Parameters.AddWithValue("@IDCategoria", componente.Categoria);
                    cmd.Parameters.AddWithValue("@PrecioVenta", componente.PrecioVenta);
                    cmd.Parameters.AddWithValue("@PrecioCosto", componente.PrecioCosto);
                    cmd.Parameters.AddWithValue("@Stock", componente.Stock);
                    cmd.Parameters.AddWithValue("@FechaCreacion", componente.FechaCreacion);
                    cmd.Parameters.AddWithValue("Activo", 1);

                    // Ejecutar el comando
                    int filasAfectadas = cmd.ExecuteNonQuery();
                    return filasAfectadas > 0;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al agregar el Componente: " + ex.Message);
                return false;
            }
        }
    }
}

         