using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    public class Clientes
    {

        public int IDCliente { get; set; }
        public string Nombre { get; set; }
        public string Domicilio { get; set; }
        public string Telefono { get; set; }
        public int DNI { get; set; }

        // Constructor vacío
        public Clientes() { }

        // Constructor con parámetros (opcional)
        public Clientes(int id, string nombre, string domicilio, string telefono, int dni)
        {
            IDCliente = id;
            Nombre = nombre;
            Domicilio = domicilio;
            Telefono = telefono;
            DNI = dni;
        }
    }
}
