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
    public class DatosCliente
    {

        AccesoDatos ad = new AccesoDatos();

        // Método para obtener los clientes
        public DataTable ObtenerClientes()
        {
            using (SqlConnection conexion = ad.ObtenerConexion())
            {
                string consulta = "SELECT IDCliente, Nombre FROM Cliente";
                SqlDataAdapter da = new SqlDataAdapter(consulta, conexion);
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }

        // Método para agregar un nuevo cliente
        public void AgregarCliente(Clientes cliente)
        {
            using (SqlConnection conexion = ad.ObtenerConexion())
            {
                string consulta = "INSERT INTO Cliente (Nombre, Domicilio, Telefono, DNI) VALUES (@Nombre, @Domicilio, @Telefono, @DNI)";
                SqlCommand cmd = new SqlCommand(consulta, conexion);

                // Agregar parámetros
                cmd.Parameters.AddWithValue("@Nombre", cliente.Nombre);
                cmd.Parameters.AddWithValue("@Domicilio", cliente.Domicilio);
                cmd.Parameters.AddWithValue("@Telefono", cliente.Telefono);

                cmd.Parameters.AddWithValue("@DNI", cliente.DNI == 0 ? (object)DBNull.Value : cliente.DNI);

               
                cmd.ExecuteNonQuery();
            }
        }



    }
}
