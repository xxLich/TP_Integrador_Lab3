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



    }
}
