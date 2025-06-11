using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ENTIDADES
{
    class DetalleVenta
    {

        private int _NumVenta;
        private int _Componente;
        private int _Cantidad;
        private Decimal _PrecioUnitario;


        //set y get


        public int NumIngreso { get => _NumVenta; set => _NumVenta = value; }
        public int Componente { get => _Componente; set => _Componente = value; }
        public int Cantidad { get => _Cantidad; set => _Cantidad = value; }
        public decimal PrecioUnitario { get => _PrecioUnitario; set => _PrecioUnitario = value; }
    }
}
