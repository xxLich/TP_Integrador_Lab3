using DATOS;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
    public class NegocioCliente
    {
        DatosCliente dv = new DatosCliente();

        public DataTable ObtenerClientes()
        {
            return dv.ObtenerClientes();
        }


    }
}
