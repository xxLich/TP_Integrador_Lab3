using DATOS;
using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Negocios
{
   public class negocioUsuario
    {
        DatosUsuarios datosUsuarios = new DatosUsuarios();

        public Usuario LoginUsuario(string email, byte[] claveHasheada)
        {
            DatosUsuarios datos = new DatosUsuarios();
            return datos.ObtenerUsuarioPorEmailYClave(email, claveHasheada);
        }
    }
}