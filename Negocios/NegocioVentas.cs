using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ENTIDADES;
using DATOS;


namespace Negocios
{
    public class NegocioVentas
    {
     public DatosVentas datos = new DatosVentas();



        public DataTable ListarComponentesActivos()
        {
            return datos.ObtenerComponentesActivos();
        }
   
        public void RegistrarVenta(Venta venta)
        {
            datos.RegistrarVenta(venta);
        }

        public DataTable ObtenerVistaVentasParaGrid()
        {
            return datos.ObtenerVistaVentas();
        }

        public DataTable FiltroVistaVentasParaGrid(int idventa)
        {
            return datos.FiltroVistaVentas(idventa);
        }
    }
}
