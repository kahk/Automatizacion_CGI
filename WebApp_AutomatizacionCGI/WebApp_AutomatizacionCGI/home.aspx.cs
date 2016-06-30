using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp_AutomatizacionCGI.Controlador;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 1;
                MostrarDocentes();
                Calendar1_Docentes.Visible = false;
                
            }
        }

        //--------------------------------------------------------vista docentes--------------------------------------------------------

        public void MostrarDocentes()
        {
            ControladorDocente control = new ControladorDocente();
            GridView_docentes.DataSource = control.listaDocentes();
            GridView_docentes.DataBind();
        }

        protected void LinkButto_abrircalendario_Click(object sender, EventArgs e)
        {
            if (Calendar1_Docentes.Visible)
            {
                Calendar1_Docentes.Visible = false;
            }
            else
            {
                Calendar1_Docentes.Visible = true;
            }
        }

        protected void Calendar1_Docentes_SelectionChanged(object sender, EventArgs e)
        {
            txt_fechaingresoDocente.Text = Calendar1_Docentes.SelectedDate.ToShortDateString();
            Calendar1_Docentes.Visible = false;
        }

        protected void btn_addDocente_Click(object sender, EventArgs e)
        {
            ControladorDocente control = new ControladorDocente();

            String nombre = txt_nombreDocente.Text;
            String rut = txt_rutDocente.Text +""+ txt_digitoDocente.Text;
            String apellido = txt_apellidoDocente.Text;
            DateTime fecha = Convert.ToDateTime(txt_fechaingresoDocente.Text);
            String correo = txt_correoDocente.Text;
            String codigo = rut;
            int id_Estado = 1;

            Docente nuevo = new Docente
            {
                Rut = rut,
                Nombre = nombre,
                Apellido = apellido,
                Fecha_Ingreso = fecha,
                Correo = correo,
                ID_Estado = id_Estado,
                Codigo = codigo

            };

            if (control.addDocentes(nuevo))
            {
                MostrarDocentes();
            }
        }

        protected void GridView_docentes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_docentes.EditIndex = e.NewEditIndex;
            MostrarDocentes();
          
        }

        protected void GridView_docentes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //valor anterior
           string rut = "";
            rut = GridView_docentes.DataKeys[e.RowIndex].Values[0].ToString();

            //valores nuevos
            TextBox txtnombreDoc = (TextBox)GridView_docentes.Rows[e.RowIndex].FindControl("TextBox1_nombreDocente");
            TextBox txtapellidoDoc = (TextBox)GridView_docentes.Rows[e.RowIndex].FindControl("TextBox2_apellidoDocente");
            TextBox txtcorreoDoc = (TextBox)GridView_docentes.Rows[e.RowIndex].FindControl("TextBox3_correoDocente");

            Docente nuevo = new Docente
            {
                Rut = rut,
                Nombre = txtnombreDoc.Text,
                Apellido = txtapellidoDoc.Text,
                Correo = txtcorreoDoc.Text
            };

            ControladorDocente control = new ControladorDocente();

            control.ActualizarDocente(nuevo);
            GridView_docentes.EditIndex = -1;
            MostrarDocentes();

        }

        protected void GridView_docentes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_docentes.EditIndex = -1;
            MostrarDocentes();
        }

        protected void GridView_docentes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_docentes.PageIndex = e.NewPageIndex;
            MostrarDocentes();
        }

        



        //--------------------------------------------------------vista docentes--------------------------------------------------------

    }
}