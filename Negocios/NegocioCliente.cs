using DATOS;
using ENTIDADES;
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

        public void AgregarCliente(Clientes cliente)
        {
            dv.AgregarCliente(cliente);
        }

    }
}
