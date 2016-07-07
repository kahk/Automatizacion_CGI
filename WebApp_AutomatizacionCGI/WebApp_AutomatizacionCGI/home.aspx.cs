using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Collections;
using System.Web.UI.WebControls;
using WebApp_AutomatizacionCGI.Controlador;
using WebApp_AutomatizacionCGI.Modelo;
using System.Web.Security;
using System.Drawing;
using System.Drawing.Imaging;

namespace WebApp_AutomatizacionCGI
{
    public partial class home : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {


                MultiView1.ActiveViewIndex = 0;
                MostrarDocentes();

                MostrarCursos(); //view add cursos

                Mostrar_AsignarDocentes(); //mostrar gridview asignar docentes

                MostrarEstado_Docentes(); //Mostrar cb Estado Panel Docente

                MostrarEstado_Encargados(); //mostrar cb estado panel encargado

                MostrarEncargados(); //cargar gridview vista encargado

                MostrarEstado_Cursos();

                MostrarEstado_Pad();


            }
        }

        //MENU DE NAVEGACION

        protected void Link_VistaDocentes_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }

        protected void Link_VistaEncargados_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Link_VistaCursos_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }

        //METODOS GENERALES

        protected void btn_volver_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        public void MostrarEstado_Docentes()
        {
            ControladorEstado control = new ControladorEstado();

            cb_EstadoDocente.DataSource = control.listaEstado();
            cb_EstadoDocente.DataTextField = "Detalle";
            cb_EstadoDocente.DataValueField = "ID_Estado";
            cb_EstadoDocente.DataBind();
            cb_EstadoDocente.SelectedIndex = 0;
        }

        public void MostrarEstado_Encargados()
        {
            ControladorEstado control = new ControladorEstado();

            cb_EstadoEncargado.DataSource = control.listaEstado();
            cb_EstadoEncargado.DataTextField = "Detalle";
            cb_EstadoEncargado.DataValueField = "ID_Estado";
            cb_EstadoEncargado.DataBind();
            cb_EstadoEncargado.SelectedIndex = 0;
        }

        public void MostrarEstado_Cursos()
        {
            ControladorEstado control = new ControladorEstado();

            cb_EstadoCurso.DataSource = control.listaEstado();
            cb_EstadoCurso.DataTextField = "Detalle";
            cb_EstadoCurso.DataValueField = "ID_Estado";
            cb_EstadoCurso.DataBind();
            cb_EstadoCurso.SelectedIndex = 0;
        }

        public void MostrarEstado_Pad()
        {
            ControladorEstado control = new ControladorEstado();

            cb_EstadoPad.DataSource = control.listaEstado();
            cb_EstadoPad.DataTextField = "Detalle";
            cb_EstadoPad.DataValueField = "ID_Estado";
            cb_EstadoPad.DataBind();
            cb_EstadoPad.SelectedIndex = 0;
        }


        //VISTA DOCENTES

        public void MostrarDocentes()
        {
            ControladorDocente control = new ControladorDocente();
            GridView_docentes.DataSource = control.listaGridView_Docentes();
            GridView_docentes.DataBind();
        }

        protected void Link_AbrirModalDocente_Click(object sender, EventArgs e)
        {
            ModalPopupExtender0_ModalDocente.Show();


            txt_rutDocente.Visible = true;
            txt_digitoDocente.Visible = true;
            lb_RutDocente.Visible = false;
            cb_EstadoDocente.Enabled = false;
            cb_EstadoDocente.SelectedValue = "1";
            txt_rutDocente.Text = "";
            txt_digitoDocente.Text = "";
            txt_nombreDocente.Text = "";
            txt_apellidoDocente.Text = "";
            txt_correoDocente.Text = "";
            txt_fechaingresoDocente.Text = "";


            Link_addDocente.Visible = true;
            Link_EditarDocente.Visible = false;
        }

        protected void Link_addDocente_Click(object sender, EventArgs e)
        {
            ControladorDocente control = new ControladorDocente();

            String nombre = txt_nombreDocente.Text;
            String rut = txt_rutDocente.Text + "-" + txt_digitoDocente.Text;
            String apellido = txt_apellidoDocente.Text;
            DateTime fecha = Convert.ToDateTime(txt_fechaingresoDocente.Text);
            String correo = txt_correoDocente.Text;
            String codigo = rut;
            int id_Estado = 0;
            int.TryParse(cb_EstadoDocente.SelectedValue, out id_Estado);

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

        protected void GridView_docentes_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)  //editar controles visibles entre los modal pop up
        {
            Label lbcodigoDocente = (Label)GridView_docentes.Rows[e.NewSelectedIndex].FindControl("Label1");
            Label lbNombreDocente = (Label)GridView_docentes.Rows[e.NewSelectedIndex].FindControl("Label2");
            Label lbApellidoDocente = (Label)GridView_docentes.Rows[e.NewSelectedIndex].FindControl("Label3");
            Label lbCorreoDocente = (Label)GridView_docentes.Rows[e.NewSelectedIndex].FindControl("Label4");
            Label lbFechaIngresoDocente = (Label)GridView_docentes.Rows[e.NewSelectedIndex].FindControl("Label5");
            Label lbEstadoDocente = (Label)GridView_docentes.Rows[e.NewSelectedIndex].FindControl("Label7");

            String fecha = Convert.ToString(lbFechaIngresoDocente.Text);
            String rut = Convert.ToString(lbcodigoDocente.Text);

            lb_RutDocente.Text = rut;
            txt_rutDocente.Visible = false;
            txt_digitoDocente.Visible = false;
            lb_RutDocente.Visible = true;
            cb_EstadoDocente.Enabled = true;

            Link_addDocente.Visible = false;
            Link_EditarDocente.Visible = true;

            txt_nombreDocente.Text = lbNombreDocente.Text;
            txt_apellidoDocente.Text = lbApellidoDocente.Text;
            txt_correoDocente.Text = lbCorreoDocente.Text;
            cb_EstadoDocente.SelectedValue = lbEstadoDocente.Text;
            txt_fechaingresoDocente.Text = fecha.Substring(0, 10);

            //generar barcode
          
                LabelKit.BarcodeGenerator code = new LabelKit.BarcodeGenerator();
                System.Drawing.Graphics g = Graphics.FromImage(new Bitmap(1, 1));
                System.Drawing.Bitmap bmp = new System.Drawing.Bitmap(1, 1, PixelFormat.Format32bppArgb);

                g = Graphics.FromImage(bmp);
                code.DrawCode128(g, rut, 0, 0).Save(Server.MapPath("./barcodes/" + rut + ".png"), ImageFormat.Png);
                Image_codigo.ImageUrl = "./barcodes/" + rut + ".png";
                    
            
        }

        protected void Link_ModificarDocente_Click(object sender, EventArgs e)
        {
            ModalPopupExtender0_ModalDocente.Show();
        }

        protected void Link_EditarDocente_Click(object sender, EventArgs e)
        {
            ControladorDocente control = new ControladorDocente();
            int id_estado = 0;
            int.TryParse(cb_EstadoDocente.SelectedValue, out id_estado);
            DateTime fecha = Convert.ToDateTime(txt_fechaingresoDocente.Text);

            Docente nuevo = new Docente
            {
                Rut = lb_RutDocente.Text,
                Nombre = txt_nombreDocente.Text,
                Apellido = txt_apellidoDocente.Text,
                Correo = txt_correoDocente.Text,
                Fecha_Ingreso = fecha,
                ID_Estado = id_estado

            };
            if (control.ActualizarDocente(nuevo))
            {
                MostrarDocentes();
            }
        }



        protected void Link_AbrirModalCodigoDocente_Click(object sender, EventArgs e)
        {
            ModalPopupExtender_Barcode.Show();
        }



        protected void GridView_docentes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_docentes.PageIndex = e.NewPageIndex;
            MostrarDocentes();
        }


        //VISTA ENCARGADOS

        public void MostrarEncargados()
        {
            ControladorEncargado control = new ControladorEncargado();
            GridView_Encargados.DataSource = control.listaGridview_Encargados();
            GridView_Encargados.DataBind();
        }

        protected void Link_AbrirModalEncargado_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3_encargadonuevo.Show();

            txt_RutEncargardo.Visible = true;
            txt_DigitoEncargado.Visible = true;
            lb_RutEncargado.Visible = false;
            cb_EstadoEncargado.Enabled = false;
            cb_EstadoEncargado.SelectedValue = "1";
            Link_EditarEncargado.Visible = false;
            Link_GuardarEncargado.Visible = false;
            Link_GuardarEncargado_VistaEncargado.Visible = true;

            txt_NombreEncargado.Text = "";
            txt_ApellidoEncargado.Text = "";
            txt_CorreoEncargado.Text = "";

        }

        protected void GridView_Encargados_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Label lbcodigoEncargado = (Label)GridView_Encargados.Rows[e.NewSelectedIndex].FindControl("Label1");
            Label lbNombreEncargado = (Label)GridView_Encargados.Rows[e.NewSelectedIndex].FindControl("Label2");
            Label lbApellidoEncargado = (Label)GridView_Encargados.Rows[e.NewSelectedIndex].FindControl("Label3");
            Label lbCorreoEncargado = (Label)GridView_Encargados.Rows[e.NewSelectedIndex].FindControl("Label4");

            Label lbEstadoEncargado = (Label)GridView_Encargados.Rows[e.NewSelectedIndex].FindControl("Label6");


            String rut = Convert.ToString(lbcodigoEncargado.Text);

            lb_RutEncargado.Text = rut;

            txt_RutEncargardo.Visible = false;
            txt_DigitoEncargado.Visible = false;
            lb_RutEncargado.Visible = true;
            cb_EstadoEncargado.Enabled = true;

            Link_GuardarEncargado_VistaEncargado.Visible = false;
            Link_GuardarEncargado.Visible = false;
            Link_EditarEncargado.Visible = true;

            txt_NombreEncargado.Text = lbNombreEncargado.Text;
            txt_ApellidoEncargado.Text = lbApellidoEncargado.Text;
            txt_CorreoEncargado.Text = lbCorreoEncargado.Text;

            cb_EstadoEncargado.SelectedValue = lbEstadoEncargado.Text;

            LabelKit.BarcodeGenerator code = new LabelKit.BarcodeGenerator();
            System.Drawing.Graphics g = Graphics.FromImage(new Bitmap(1, 1));
            System.Drawing.Bitmap bmp = new System.Drawing.Bitmap(1, 1, PixelFormat.Format32bppArgb);

            g = Graphics.FromImage(bmp);
            code.DrawCode128(g, rut, 0, 0).Save(Server.MapPath("./barcodes/" + rut + ".png"), ImageFormat.Png);
            Image_BarcodeEncargado.ImageUrl = "./barcodes/" + rut + ".png";


        }

        protected void Link_AbrirModalCodigoEncargado_Click(object sender, EventArgs e)
        {
            ModalPopupExtender_BadCodeEncargado.Show();
        }

        protected void Link_ModificarEncargado_Click(object sender, EventArgs e)
        {
            ModalPopupExtender3_encargadonuevo.Show();
        }


        protected void Link_EditarEncargado_Click(object sender, EventArgs e)
        {
            ControladorEncargado control = new ControladorEncargado();
            int id_estado = 0;
            int.TryParse(cb_EstadoEncargado.SelectedValue, out id_estado);


            Encargado nuevo = new Encargado
            {
                Rut = lb_RutEncargado.Text,
                Nombre = txt_NombreEncargado.Text,
                Apellido = txt_ApellidoEncargado.Text,
                Correo = txt_CorreoEncargado.Text,
                ID_Estado = id_estado

            };
            if (control.ActualizarEncargado(nuevo))
            {
                MostrarEncargados();
            }
        }


        protected void Link_GuardarEncargado_VistaEncargado_Click(object sender, EventArgs e)
        {
            ControladorEncargado control = new ControladorEncargado();

            int id_Estado = 0;
            int.TryParse(cb_EstadoEncargado.SelectedValue, out id_Estado);

            string rut = txt_RutEncargardo.Text;
            string digito = txt_DigitoEncargado.Text;
            string nombre = txt_NombreEncargado.Text;
            string apellido = txt_ApellidoEncargado.Text;
            string correo = txt_CorreoEncargado.Text;
            string codigo = rut;

            string rd = rut + "-" + digito;
            Encargado nuevo = new Encargado
            {
                Rut = rd,
                Nombre = nombre,
                Apellido = apellido,
                Correo = correo,
                ID_Estado = id_Estado,
                Codigo = codigo

            };

            if (control.addEncargados(nuevo))
            {
                MostrarEncargados();
            }
        }

        protected void Link_GuardarEncargado_Click(object sender, EventArgs e)  //vista curso
        {
            ControladorEncargado control = new ControladorEncargado();

            int id_Estado = 0;
            int.TryParse(cb_EstadoEncargado.SelectedValue, out id_Estado);

            string rut = txt_RutEncargardo.Text;
            string nombre = txt_NombreEncargado.Text;
            string apellido = txt_ApellidoEncargado.Text;
            string correo = txt_CorreoEncargado.Text;
            string codigo = rut;

            Encargado nuevo = new Encargado
            {
                Rut = rut,
                Nombre = nombre,
                Apellido = apellido,
                Correo = correo,
                ID_Estado = id_Estado,
                Codigo = codigo

            };

            if (control.addEncargados(nuevo))
            {
                ModalPopupExtender1_cursonuevo.Show();
                txt_RutEncargardo_Curso.Text = rut;
            }
        }

        protected void Link_BuscarEncargado_Click(object sender, EventArgs e)
        {

        }

        //VISA CURSOS

        public void MostrarCursos()
        {
            ControladorCurso control = new ControladorCurso();
            GridView_cursos.DataSource = control.listaCurso_Pad();
            GridView_cursos.DataBind();
        }

        protected void Link_AbrirModalCurso_Click(object sender, EventArgs e)
        {
            ModalPopupExtender1_cursonuevo.Show();
            Link_GuardarCurso.Visible = true;
            Link_EditarCurso.Visible = false;
            lbCurso.Visible = false;
            cb_EstadoCurso.Enabled = false;
            cb_EstadoCurso.SelectedValue = "1";
            txt_RutEncargardo_Curso.Text = "";
            txt_detalleCurso.Text = "";
        }

        protected void GridView_cursos_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Label lbCodigoCurso = (Label)GridView_cursos.Rows[e.NewSelectedIndex].FindControl("Label1");
            lb_idcurso.Text = lbCodigoCurso.Text;
            MostrarPad_Curso();

            Label lbRutEncargado = (Label)GridView_cursos.Rows[e.NewSelectedIndex].FindControl("Label2");
            Label lbDetalleCurso = (Label)GridView_cursos.Rows[e.NewSelectedIndex].FindControl("Label5");
            Label lbEstadoCurso = (Label)GridView_cursos.Rows[e.NewSelectedIndex].FindControl("Label6");


            Link_GuardarCurso.Visible = false;
            Link_EditarCurso.Visible = true;
            txt_RutEncargardo_Curso.Text = lbRutEncargado.Text;
            txt_detalleCurso.Text = lbDetalleCurso.Text;
            cb_EstadoCurso.SelectedValue = lbEstadoCurso.Text;

        }



        protected void Link_BuscarCurso_Click(object sender, EventArgs e)
        {

        }

        protected void Link_ModificarCurso_Click(object sender, EventArgs e)
        {
            Link_GuardarCurso.Visible = false;
            Link_EditarCurso.Visible = true;
            cb_EstadoCurso.Enabled = true;
            ModalPopupExtender1_cursonuevo.Show();
        }

        protected void Link_EditarCurso_Click(object sender, EventArgs e)
        {
            ControladorCurso control = new ControladorCurso();
            int id_estado = 0;
            int.TryParse(cb_EstadoCurso.SelectedValue, out id_estado);

            int id_curso = 0;
            int.TryParse(lb_idcurso.Text, out id_curso);

            Curso nuevo = new Curso
            {
                ID_Curso = id_curso,
                Rut_Encargado = txt_RutEncargardo_Curso.Text,
                Detallecurso = txt_detalleCurso.Text,
                ID_Estado = id_estado

            };
            if (control.ActualizarCurso(nuevo))
            {
                MostrarCursos();
            }
        }


        protected void Link_GuardarCurso_Click(object sender, EventArgs e)
        {
            ControladorCurso control = new ControladorCurso();

            ControladorEncargado controlEnc = new ControladorEncargado();

            string rut = txt_RutEncargardo_Curso.Text;
            string detalle = txt_detalleCurso.Text;

            if (rut == "" || detalle == "")
            {
                lbCurso.Text = "rellene los campos";
                txt_RutEncargardo_Curso.Text = rut;
                txt_detalleCurso.Text = detalle;
                lbCurso.Visible = true;
                ModalPopupExtender1_cursonuevo.Show();
            }
            else
            {
                //validar que exista rut de encargado   
                int aux = controlEnc.listaBuscarEncargados(rut).Count;

                if (aux == 0)
                {
                    lb_encargadoNoencontrado.Text = "El encargado que Ingreso no existe <br/> Desea crear uno nuevo?";
                    ModalPopupExtender2_ConfirmarEncargado.Show();
                }
                else
                {
                    Curso nuevo = new Curso
                    {
                        Rut_Encargado = rut,
                        Detallecurso = detalle,
                        ID_Estado = 1

                    };

                    if (control.addCursos(nuevo))
                    {
                        MostrarCursos();
                    }


                    lbCurso.Visible = false;
                    txt_RutEncargardo_Curso.Text = "";
                    txt_detalleCurso.Text = "";
                }
            }
        }


        protected void Link_si_Click(object sender, EventArgs e) //modal creacion encargado en caso de no encontrar rut;
        {
            Link_GuardarEncargado.Visible = true;
            Link_GuardarEncargado_VistaEncargado.Visible = false;
            ModalPopupExtender3_encargadonuevo.Show();
        }


        protected void GridView_cursos_PageIndexChanging(object sender, GridViewPageEventArgs e)  //paginacion gridview cursos
        {
            GridView_cursos.PageIndex = e.NewPageIndex;
        }


        //PAD

        public void MostrarPad_Curso()
        {
            int id_curso = 0;
            int.TryParse(lb_idcurso.Text, out id_curso);

            ControladorPad control = new ControladorPad();
            GridView_detallePad.DataSource = control.listaPad_Cursos(id_curso);
            GridView_detallePad.DataBind();
        }

        protected void Link_ModalPad_Click(object sender, EventArgs e)
        {
            ModalPopupExtender4_detallecurso.Show();
        }

        protected void Link_NuevoPad_Click(object sender, EventArgs e)
        {
            ModalPopupExtender5_padnuevo.Show();
            Link_EditarPad.Visible = false;
            Link_GuardarPad.Visible = true;
            cb_EstadoPad.Enabled = false;
            cb_EstadoPad.SelectedValue = "1";


            txt_SalaPad.Text = "";
            txt_SalaCoffe.Text = "";
            txt_horainicioPad.Text = "";
            txt_horafinPad.Text = "";
            txt_fechapad.Text = "";

        }

        protected void GridView_detallePad_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Label lbCodigoPad = (Label)GridView_detallePad.Rows[e.NewSelectedIndex].FindControl("Label1");
            Label lbSalaPad = (Label)GridView_detallePad.Rows[e.NewSelectedIndex].FindControl("Label3");
            Label lbSalaCoffePad = (Label)GridView_detallePad.Rows[e.NewSelectedIndex].FindControl("Label4");
            Label lbHoraInicioPad = (Label)GridView_detallePad.Rows[e.NewSelectedIndex].FindControl("Label5");
            Label lbHoraTerminoPad = (Label)GridView_detallePad.Rows[e.NewSelectedIndex].FindControl("Label6");
            Label lbFechaPad = (Label)GridView_detallePad.Rows[e.NewSelectedIndex].FindControl("Label7");
            Label lbEstadoPad = (Label)GridView_detallePad.Rows[e.NewSelectedIndex].FindControl("Label8");

            String fecha = Convert.ToString(lbFechaPad.Text);

            txt_rutDocente.Visible = false;
            txt_digitoDocente.Visible = false;
            lb_RutDocente.Visible = true;
            cb_EstadoDocente.Enabled = true;
            Link_GuardarPad.Visible = false;
            Link_EditarPad.Visible = true;
            Link_addDocente.Visible = false;

            Link_EditarDocente.Visible = true;

            txt_SalaPad.Text = lbSalaPad.Text;
            txt_SalaCoffe.Text = lbSalaCoffePad.Text;
            txt_horainicioPad.Text = lbHoraInicioPad.Text;
            txt_horafinPad.Text = lbHoraTerminoPad.Text;
            txt_fechapad.Text = fecha.Substring(0, 10);
            cb_EstadoPad.SelectedValue = lbEstadoPad.Text;
            lb_codigoPad.Text = lbCodigoPad.Text;
        }
        protected void Link_ModificarPad_Click(object sender, EventArgs e)
        {
            ModalPopupExtender5_padnuevo.Show();
            cb_EstadoPad.Enabled = true;
        }

        protected void Link_EditarPad_Click(object sender, EventArgs e)
        {
            ControladorPad control = new ControladorPad();
            int id_estado = 0;
            int.TryParse(cb_EstadoPad.SelectedValue, out id_estado);

            int id_pad = 0;
            int.TryParse(lb_codigoPad.Text, out id_pad);
            DateTime fecha = Convert.ToDateTime(txt_fechapad.Text);

            TimeSpan hinicio;
            TimeSpan.TryParse(txt_horainicioPad.Text, out hinicio);

            TimeSpan htermino;
            TimeSpan.TryParse(txt_horafinPad.Text, out htermino);

            Pad nuevo = new Pad
            {
                ID_Pad = id_pad,
                Sala = txt_SalaPad.Text,
                Sala_Coffe = txt_SalaCoffe.Text,
                Hora_Inicio = hinicio,
                Hora_Termino = htermino,
                Fecha = fecha,

                ID_Estado = id_estado

            };
            if (control.ActualizarPad(nuevo))
            {
                MostrarPad_Curso();
                ModalPopupExtender4_detallecurso.Show();
            }
        }

        
        protected void Link_GuardarPad_Click(object sender, EventArgs e)
        {
            ControladorPad control = new ControladorPad();
            int id_curso = 0;
            int.TryParse(lb_idcurso.Text, out id_curso);

            string sala = txt_SalaPad.Text;
            string coffe = txt_SalaCoffe.Text;

            string hora_inicio = txt_horainicioPad.Text;
            string hora_fin = txt_horafinPad.Text;

            DateTime fecha = Convert.ToDateTime(txt_fechapad.Text);
            int id_estado = 1;

            TimeSpan hinicio;
            TimeSpan.TryParse(txt_horainicioPad.Text, out hinicio);

            TimeSpan htermino;
            TimeSpan.TryParse(txt_horafinPad.Text, out htermino);

            Pad nuevo = new Pad
            {
                ID_Curso = id_curso,
                Sala = sala,
                Sala_Coffe = coffe,
                Hora_Inicio = hinicio,
                Hora_Termino = htermino,
                Fecha = fecha,
                ID_Estado = id_estado

            };

            if (control.addPad(nuevo))
            {
                MostrarPad_Curso();
                ModalPopupExtender4_detallecurso.Show();
            }
        }


        //ASIGNAR DOCENTES

        public void Mostrar_AsignarDocentes()
        {
            ControladorDocente control = new ControladorDocente();

            GridView_asignardocentes.DataSource = control.listaAsignar_Docentes();
            GridView_asignardocentes.DataBind();
        }


        protected void Link_viewAsignarDocentes_Curso_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 4;
        }

        protected void Link_volverviewcursos_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }

        protected void GridView_asignardocentes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_asignardocentes.PageIndex = e.NewPageIndex;
            Mostrar_AsignarDocentes();
        }
        protected void GridView_asignardocentes_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            Label lbcodigoDocente = (Label)GridView_asignardocentes.Rows[e.NewSelectedIndex].FindControl("Label1");

            int id_curso = 0;
            int.TryParse(lb_idcurso.Text, out id_curso);
            string rut = lbcodigoDocente.Text;

            ControladorCursoDocente control = new ControladorCursoDocente();

            int aux = control.listaBuscarCurso_Docente(id_curso, rut).Count;

            if (aux == 0)
            {
                Curso_Docente nuevo = new Curso_Docente
                {
                    ID_Curso = id_curso,
                    Rut_Docente = rut
                };

                if (control.addCursoDocente(nuevo))
                {

                }
            }
            else
            {

            }
        }

        protected void Link_CerrarSession_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
        }

      
    }
}