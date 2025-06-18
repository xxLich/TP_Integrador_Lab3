using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Usuario
    {
        private string _Nombre;
        private string _Apellido;
        private string _Email;
        private string _Clave;
        private DateTime _FechaRegistro;
        private int _Rol;
        private bool _Activo;
        private int _IDUsuario;
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Apellido { get => _Apellido; set => _Apellido = value; }
        public int Rol { get => _Rol; set => _Rol = value; }
        public int IDUsuario { get => _IDUsuario; set => _IDUsuario = value; }
        public string Email { get => _Email; set => _Email = value; }
        public string Clave { get => _Clave; set => _Clave = value; }
        public DateTime FechaRegistro { get => _FechaRegistro; set => _FechaRegistro = value; }
        public bool Activo { get => _Activo; set => _Activo = value; }
    }
}
