using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
 public   class Venta
    {
        private int _Usuario;
        DateTime _FechaVenta;
        private decimal _Total;
        private string _Estado;
        public int ClienteID { get; set; }
        public int Usuario { get => _Usuario; set => _Usuario = value; }
      
        public DateTime FechaVenta { get => _FechaVenta; set => _FechaVenta = value; }
        public decimal Total { get => _Total; set => _Total = value; }
      
        public string Estado { get => _Estado; set => _Estado = value; }
        public List<DetalleVenta> Detalles { get; set; }

        public Venta()
        {
            Detalles = new List<DetalleVenta>();
        }

    }
}
