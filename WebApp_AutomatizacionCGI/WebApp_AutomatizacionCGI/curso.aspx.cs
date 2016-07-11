using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp_AutomatizacionCGI.Controlador;
using WebApp_AutomatizacionCGI.Modelo;
 
namespace WebApp_AutomatizacionCGI
{
    public partial class curso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ControladorPad control = new ControladorPad();
            if (!IsPostBack) {
                CargarInfo();


            }
        }

        public void CargarInfo()
        {
            try {
                ControladorPad control = new ControladorPad();
                string id_pad = control.BuscarPad_DeCurso(Session["IDUsuario"].ToString()) + "";

                if (id_pad == "-1")
                {
                    lb_numeropad.Text = "";
                    lb_infoPad.Text = "<b>Curso no disponible para hoy <br/>"+DateTime.Today.ToShortDateString()+"<br/> Contacte con Administrador</b>";
                    txt_CodigoDocente.Enabled = false;
                }
                else
                {
                    txt_CodigoDocente.Enabled = true;
                    lb_numeropad.Text = "Curso N° " + control.BuscarPad_DeCurso(Session["IDUsuario"].ToString());
                    int cod = 0;
                    int.TryParse(id_pad, out cod);
                    
                    lb_infoPad.Text = "<b>Fecha:</b> "+DateTime.Today.ToShortDateString()+"<br/><b>Hora Inicio:</b> " + control.hora_inicio(cod)+ "<br/><b>Hora Termino:</b> " + control.hora_fin(cod)
                                                 + "<br/><b>Sala:</b> " + control.sala(cod)+ "<br/><b>Sala Coffe:</b> " + control.sala_coffe(cod) 
                                                 + "<br/><b>Encargado:</b> "+control.Nombreencargado(cod) +" "+control.Apellidoencargado(cod) ;                    
                }
            }
            catch (Exception)
            {
                               
            }
            
           
        }

        protected void Link_RegistrarAsistencia_Click(object sender, EventArgs e)
        {
            ControladorPad control_pad = new ControladorPad();
            ControladorCursoDocente control_cd = new ControladorCursoDocente();
            ControladorAsistencia control_asist = new ControladorAsistencia();
            ControladorDocente control_do = new ControladorDocente();
            if (txt_CodigoDocente.Text == "")
            {
                lb_Bienvenida.Text = "ingrese un codigo";
                txt_CodigoDocente.Text = "";
                txt_CodigoDocente.Focus();
            }
            else
            {
                string codigo = txt_CodigoDocente.Text;
                try
                {
                    string id_pad = control_pad.BuscarPad_DeCurso(Session["IDUsuario"].ToString()) + "";

                    int cod = 0;
                    int.TryParse(id_pad, out cod);
                    int c_docentesencurso = control_cd.Buscar_Docente_En_AsistenciaCurso(cod, codigo).Count;
                    
                    if (c_docentesencurso == 0)
                    {
                        lb_Bienvenida.Text = "Usted no pertenece a este curso"; //no pertenece a este curso
                        txt_CodigoDocente.Text = "";
                        txt_CodigoDocente.Focus();
                    }
                    else
                    {
                        lb_Bienvenida.Text = "Bienvenido "+control_do.devolver_nombre(codigo)+" " + control_do.devolver_apellido(codigo) ;
                        string rut = control_do.devolver_rut(codigo);
                        int aux = control_asist.BuscarAsistenciaRepetida(rut, cod).Count;
                        if (aux == 0)
                        {
                            Asistencia nuevo = new Asistencia
                            {
                                ID_Pad = cod,
                                Rut_Docente = rut,
                                Estado = "Asistente"


                            };

                            if (control_asist.addAsistencia(nuevo))
                            {
                                txt_CodigoDocente.Text = "";
                                txt_CodigoDocente.Focus();
                            }
                        }
                        else
                        {
                            lb_Bienvenida.Text = "Usted Ya registro Asistencia";
                            txt_CodigoDocente.Text = "";
                            txt_CodigoDocente.Focus();
                        }
                       
                    }
                }
                catch (Exception)
                {

                }
            }        
        
            

        }

        protected void Link_CerrarCurso_Click(object sender, EventArgs e)
        {
            Session.Abandon();

            FormsAuthentication.SignOut();

            FormsAuthentication.RedirectToLoginPage();
        }
   
    }
}