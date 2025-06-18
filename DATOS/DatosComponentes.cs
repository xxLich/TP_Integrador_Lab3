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
    public class DatosComponentes
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
                    cmd.Parameters.AddWithValue("Estado", componente.Estado);

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

      public DataTable ObtenerComponentes()
{
    try
    {
        using (SqlConnection conexion = ad.ObtenerConexion())
        {
                    string consulta = "SELECT IDComponente, Nombre FROM Componentes WHERE Estado = 1";
                    SqlDataAdapter da = new SqlDataAdapter(consulta, conexion);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
                }
    }
    catch (Exception ex)
    {
        Console.WriteLine("Error al obtener los componentes: " + ex.Message);
        return null;
    }
}

        public DataTable FiltrarComponentes(int IDComponente)
        {
            
            string consulta = @"
         SELECT C.IDComponente,C.Nombre
             FROM  Componentes AS C
            
             WHERE C.IDComponente = @IDComponente AND C.Estado=1";

            // Crear el comando SQL
            SqlCommand cmd = new SqlCommand(consulta);
            cmd.Parameters.AddWithValue("@IDComponente", IDComponente);

            // Ejecutar la consulta y obtener la tabla
            if (ad.ExisteRegistroConComando(cmd))
            {
                return ad.ObtenerTablaConComando("Componentes", cmd);
            }

            return null;
        }

        public int EliminarMedicosDatos(Componente componente)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "BAJACOMPONENTES";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@IDComponente", componente.IDComponente);

            return ad.EjecutarProcedimientoAlmacenado(cmd, "BAJACOMPONENTES");
        }
        public DataTable ObtenerComponentePorID(int id)
        {
            using (SqlConnection conexion = ad.ObtenerConexion())
            {
                string query = "SELECT PrecioVenta FROM Componentes WHERE IDComponente = @id";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@id", id);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

    }
}

         