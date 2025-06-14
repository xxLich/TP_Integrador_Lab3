using System;
using System.Configuration;
using System.Data.SqlClient;
using ENTIDADES;

namespace DATOS
{
    public class DatosUsuarios
    {
        private readonly string connectionString;

        public DatosUsuarios()
        {
            var setting = ConfigurationManager.ConnectionStrings["TP_INTEGRADOR_GP4"];
            if (setting == null)
                throw new Exception("No se encontró la cadena de conexión 'TP_INTEGRADOR_GP4' en Web.config.");

            connectionString = setting.ConnectionString;
        }

        public Usuario ObtenerUsuarioPorEmailYClave(string email, string clave)
        {
            Usuario usuario = null;

            using (SqlConnection cn = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Usuarios WHERE Email = @Email AND Clave = @Clave AND Activo = 1";

                SqlCommand cmd = new SqlCommand(query, cn);
                cmd.Parameters.AddWithValue("@Email", email);
                cmd.Parameters.AddWithValue("@Clave", clave); // Considera encriptar o hashear la clave si es necesario

                cn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    usuario = new Usuario
                    {
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Email = reader["Email"].ToString(),
                        Clave = reader["Clave"].ToString(),
                        Rol = Convert.ToInt32(reader["Rol"]),
                        FechaRegistro = Convert.ToDateTime(reader["FechaRegistro"]),
                        Activo = Convert.ToBoolean(reader["Activo"])
                    };
                }
            }

            return usuario;
        }
    }
}
