using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace DATOS
{
    public class DatosCategoria
    {
        AccesoDatos ad = new AccesoDatos();
        public DataTable ObtenerDatos(string tabla)
        {

            string consulta = $"SELECT * FROM {tabla}";
            DataTable dt;
            return dt = ad.ObtenerTabla($"{tabla}", consulta);
        }


    }
}
