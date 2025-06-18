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
    public class NegocioIngresos
    {

        private DatosIngresos datos = new DatosIngresos();

        public void Registrar(Ingreso ingreso)
        {
            datos.RegistrarIngreso(ingreso);
        }

        public DataTable ListarProveedores()
        {
            return datos.ObtenerProveedores();
        }

        public DataTable ListarComponentes()
        {
            return datos.ObtenerComponentes();
        }
    }
}
