using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Usuario
    {
	private string _Nombre;
		private string _Apellido;
		private string _Email;
		private string _Clave;
		private DateTime _FechaRegistro;
        private int _Rol;
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Apellido { get => _Apellido; set => _Apellido = value; }
        public int Rol { get => _Rol; set => _Rol = value; }
        public string Email { get => _Email; set => _Email = value; }
        public DateTime FechaRegistro { get => _FechaRegistro; set => _FechaRegistro = value; }
       




    }
}
