using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ENTIDADES;
using System.Data;
using Negocios;
namespace TPLAB3_GRUPO4.Usuarios.Admisnistrador
{
    public partial class MODComponente : System.Web.UI.Page
    {
        DataTable dt = new DataTable();
        NegocioComponente nc = new NegocioComponente();
        
        NegocioCategoria ncategoria = new NegocioCategoria();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
         public void CargarGrid()
        {
            dt = nc.FiltrarComponentes(Convert.ToInt32(txtbuscar.Text));
            CargarGrid(dt);

        }
        public void CargarGrid(DataTable dt)
        {
           grdBajaC.DataSource = dt;
            grdBajaC.DataBind();
        }
        protected void btnBuscarID_Click(object sender, EventArgs e)
        {
            dt = nc.FiltrarComponentes(Convert.ToInt32(txtbuscar.Text));

            if (dt != null && dt.Rows.Count > 0)
            {
                CargarGrid(dt);
                lblMensaje.Text = string.Empty;
            }
            else
            {
                grdBajaC.DataSource = null;
                grdBajaC.DataBind();
                lblMensaje.Text = "No se encontró el Componente.";
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void grdEditC_RowEditing(object sender, GridViewEditEventArgs e)
        {
            btnBuscarID.Visible = false;
            grdBajaC.EditIndex = e.NewEditIndex;
            CargarGrid();
            GridViewRow row = grdBajaC.Rows[e.NewEditIndex];
            DropDownList ddlCategoria = (DropDownList)row.FindControl("ddlCategoria");
            if (ddlCategoria != null)
            {
                CargarCategoria(ddlCategoria);
            }
        }
        protected void grdUpdC_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int _IDComponente = int.Parse(((Label)grdBajaC.Rows[e.RowIndex].FindControl("lblIDComponente")).Text); ;
            string _Nombre = ((TextBox)grdBajaC.Rows[e.RowIndex].FindControl("txtNombre")).Text;
            string _Descripcion = ((TextBox)grdBajaC.Rows[e.RowIndex].FindControl("txtDescripcion")).Text;
            int _ddlCategoria = int.Parse(((DropDownList)grdBajaC.Rows[e.RowIndex].FindControl("ddlCategoria")).SelectedValue);
            decimal _PrecioVenta = decimal.Parse(((TextBox)grdBajaC.Rows[e.RowIndex].FindControl("txtPrecioVenta")).Text);
            decimal _PrecioCosto = decimal.Parse(((TextBox)grdBajaC.Rows[e.RowIndex].FindControl("txtPrecioCosto")).Text);
            int _Stock= int.Parse(((TextBox)grdBajaC.Rows[e.RowIndex].FindControl("txtStock")).Text);
            TextBox txtFechaCreacion = (TextBox)grdBajaC.Rows[e.RowIndex].FindControl("txtFechaCreacion");
            DateTime _fechaCreacion = DateTime.Parse(txtFechaCreacion.Text);


            Componente comp = new Componente
            {
                IDComponente = _IDComponente,
                Nombre = _Nombre,
                Descripcion=_Descripcion,
                Categoria = _ddlCategoria,
                PrecioVenta = _PrecioVenta,
                PrecioCosto = _PrecioCosto,
                Stock=_Stock,
                FechaCreacion=_fechaCreacion


            };

            nc.ModificarComponente(comp);
            grdBajaC.EditIndex = -1;
            CargarGrid();
            lblMensaje.Text = "Componente Modificado con exito";
            lblMensaje.ForeColor = System.Drawing.Color.Green;

            btnBuscarID.Visible = true;
        }

        protected void grdCancelEditC_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            btnBuscarID.Visible = true;
            grdBajaC.EditIndex = -1;
            CargarGrid();
        }

        private void CargarCategoria(DropDownList ddlCategoria)
        {
            var dtProvincias = ncategoria.obtenerCategoria();
            ddlCategoria.DataSource = dtProvincias;
            ddlCategoria.DataTextField = "Nombre";
            ddlCategoria.DataValueField = "IDCategoria";
            ddlCategoria.DataBind();


            ddlCategoria.Items.Insert(0, new ListItem("--SELECCIONAR Categoria--", "0"));
        }

        protected void btnVolver_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Usuarios/Admisnistrador/inicioAdmin.aspx");
        }
    }
}