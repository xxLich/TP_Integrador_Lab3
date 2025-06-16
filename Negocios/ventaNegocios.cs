using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATOS;
using ENTIDADES;

namespace Negocios
{
    public class ventaNegocios
    {

       public DatosVenta datos = new DatosVenta();



        public DataTable ListarComponentesActivos()
        {
            return datos.ObtenerComponentesActivos();
        }

      /*  public DataTable ListarClientes()
        {
            return datos.ObtenerClientes();
        }
      */
        public void RegistrarVenta(Venta venta)
        {
            datos.RegistrarVenta(venta);
        }
       


    }
}
