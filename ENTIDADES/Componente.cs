using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class Componente
    {

		private string _Nombre;
		private string _Descripcion;
		private int _Categoria;
		private decimal _PrecioVenta;
		private decimal _PrecioCosto;
		private int _Stock;
		private DateTime _FechaCreacion;
       
        public string Nombre { get => _Nombre; set => _Nombre = value; }
        public string Descripcion { get => _Descripcion; set => _Descripcion = value; }
        public int Categoria { get => _Categoria; set => _Categoria = value; }
        public decimal PrecioVenta { get => _PrecioVenta; set => _PrecioVenta = value; }
        public decimal PrecioCosto { get => _PrecioCosto; set => _PrecioCosto = value; }
        public int Stock { get => _Stock; set => _Stock = value; }
        public DateTime FechaCreacion { get => _FechaCreacion; set => _FechaCreacion = value; }
      }




    }
}
