using DATOS;
using ENTIDADES;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class IngresoNegocio
{
    private IngresoDatos datos = new IngresoDatos();

    public void Registrar(Ingreso ingreso)
    {
        datos.RegistrarIngreso(ingreso);
    }

    public DataTable ListarProveedores()
    {
        return datos.ObtenerProveedores();
    }

    public DataTable ListarComponentes()
    {
        return datos.ObtenerComponentes();
    }
}