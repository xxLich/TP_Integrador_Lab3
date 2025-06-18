using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using  System.Data;
using DATOS;
namespace Negocios
{
    public class NegocioCategoria
    {
        DatosCategoria du = new DatosCategoria();
        public DataTable obtenerCategoria()
        {
            return du.ObtenerDatos("Categoria");
        }

    }
}
