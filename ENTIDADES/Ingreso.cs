using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
   public class Ingreso
    {
        public int UsuarioID { get; set; }
        public int ProveedorID { get; set; }
        public DateTime Fecha { get; set; }
        public decimal Total { get; set; }
        public List<DetalleIngreso> Detalles { get; set; }
    }
}
