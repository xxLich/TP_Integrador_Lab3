using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using DATOS;
using ENTIDADES;
namespace Negocios
{
   public class NegocioComponente
    {
        private readonly AccesoDatos accesoDatos = new AccesoDatos();
        readonly Componente componente = new Componente();
        readonly DatosComponentes datosC = new DatosComponentes();
        public bool agregarComponente(Componente componente)
        {

            return datosC.Agregar_Componente(componente);

        }
        public DataTable FiltrarComponentes(int id) //
        {
            return datosC.FiltrarComponentes(id);
        }
        public DataTable ObtenerComponentes()
        {
            return datosC.ObtenerComponentes();
        }
        public int EliminarComponenteNegocio(int ID) //
        {
           componente.IDComponente = ID;
            int estado = datosC.EliminarMedicosDatos(componente);
            if (estado >= 1)
            {
                return estado;
            }
            else
            {
                return estado;
            }
        }
        public DataTable ObtenerComponentePorID(int id)
        {
            return datosC.ObtenerComponentePorID(id);
        }


    }
}
    