using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DATOS;

namespace Negocios
{
   public class negocioUsuario
    {
        DatosUsuarios datosUsuarios = new DatosUsuarios();

        public Usuario LoginUsuario(string email, string clave)
        {
            string claveHasheada = Seguridad.CalcularSHA256(clave);
            return datosUsuarios.ObtenerUsuarioPorEmailYClave(email, claveHasheada);

        }
    }
}