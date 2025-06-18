using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using ENTIDADES;

namespace DATOS
{
    public class AccesoDatos
    {
        private readonly string rutaBD = ConfigurationManager.ConnectionStrings["TP_INTEGRADOR_GP4"].ConnectionString;

        public SqlConnection ObtenerConexion()
        {
            SqlConnection conexion = new SqlConnection(rutaBD);

            try
            {
                conexion.Open();
                return conexion;
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al abrir la conexión: {ex.Message}");
                return null;
            }
        }
        public DataTable ObtenerTablaConComando(string tabla, SqlCommand cmd)
        {
            DataSet ds = new DataSet();
            SqlConnection conexion = ObtenerConexion();
            cmd.Connection = conexion;
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds, tabla);
            conexion.Close();
            return ds.Tables[tabla];
        }
        public bool ExisteRegistroConComando(SqlCommand cmd)
        {
            bool estado = false;
            using (SqlConnection conexion = ObtenerConexion())
            {
                cmd.Connection = conexion;
                SqlDataReader datos = cmd.ExecuteReader();
                if (datos.Read())
                {
                    estado = true;
                }
            }

            return estado;
        }
        public int EjecutarProcedimientoAlmacenado(SqlCommand cmd, string sp)
        {
            int FilasCambiadas;
            SqlConnection Conexion = ObtenerConexion();
            SqlCommand _cmd = cmd;
            _cmd.Connection = Conexion;
            _cmd.CommandType = CommandType.StoredProcedure;
            _cmd.CommandText = sp;
            FilasCambiadas = _cmd.ExecuteNonQuery();
            Conexion.Close();
            return FilasCambiadas;
        }

        public SqlDataAdapter ObtenerAdaptador(string consulta, SqlConnection cn)
        {
            try
            {
                return new SqlDataAdapter(consulta, cn);
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al obtener el adaptador: {ex.Message}");
                return null;
            }
        }

        public DataTable ObtenerTabla(string nombreTabla, string consulta)
        {
            using (SqlConnection cn = ObtenerConexion())
            {
                if (cn == null) return null;

                SqlDataAdapter adap = ObtenerAdaptador(consulta, cn);
                DataSet ds = new DataSet();
                adap.Fill(ds, nombreTabla);
                return ds.Tables[nombreTabla];
            }
        }
    }



}