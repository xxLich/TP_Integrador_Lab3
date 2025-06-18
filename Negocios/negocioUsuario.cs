using DATOS;
using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Data;
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

       
        public bool agregarEmpleado(Usuario usuario)
        {
            return datosUsuarios.Agregar_Empleado(usuario);
           
        }

         public int EliminarUsuarioNegocio(int ID) //
        {
            Usuario usuario = new Usuario();

           usuario.IDUsuario = ID;
            int estado = datosUsuarios.EliminarUsuarioDatos(usuario);
            if (estado >= 1)
            {
                return estado;
            }
            else
            {
                return estado;
            }
        }

        public DataTable FiltrarUsuario(int id) //
        {
            return datosUsuarios.FiltrarUsuarios(id);
        }


    }
}