using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp_AutomatizacionCGI.Controlador;

namespace WebApp_AutomatizacionCGI
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MultiView1.ActiveViewIndex = 0;

            }
        }

        protected void Link_Ingresar_Click(object sender, EventArgs e)
        {
            ControladorUsuario control = new ControladorUsuario();
            if (txt_Usuario.Text == "")
            {
                lb_IngresoAdministrador.Text = "** Ingrese su nickname";
                txt_Usuario.Focus();
            }
            else
            {
                lb_IngresoAdministrador.Text = "";
                if (txt_Clave.Text == "")
                {
                    lb_IngresoAdministrador.Text = "** Ingrese su clave";
                    txt_Clave.Focus();
                }
                else
                {
                    lb_IngresoAdministrador.Text = "";
                    if (IsValid)
                    {

                        if (control.validarUsuario(txt_Usuario.Text, txt_Clave.Text))
                        {
                            lb_IngresoAdministrador.Text = "";
                            String datoUsuario = txt_Usuario.Text;
                            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, txt_Usuario.Text, DateTime.Now,
                                                                                             DateTime.Now.AddSeconds(500), false,
                                                                                             datoUsuario, FormsAuthentication.FormsCookiePath);
                            String encTicket = FormsAuthentication.Encrypt(ticket);

                            Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));

                            Session["IDUsuario"] = txt_Usuario.Text;


                            Response.Redirect("home.aspx");
                        }
                        else
                        {
                            lb_IngresoAdministrador.Text = "** Datos no validos";
                        }
                    }
                }
            }

         

        }

        protected void Link_IngresarEncargado_Click(object sender, EventArgs e)
        {
            ControladorEncargado control = new ControladorEncargado();
            ControladorCurso controlcurso = new ControladorCurso();
            String rut = txt_RutEncargado.Text;
            rut = rut.ToUpper();
            rut = rut.Replace("_", "");
            if (rut == "..-" || rut.Length < 11)
            {
                lb_IngresoEncargado.Text = "** Ingrese su rut";
                txt_RutEncargado.Focus();
            }
            else
            {
                if (txt_CodigoEncargado.Text == "")
                {
                    lb_IngresoEncargado.Text = "** Registre su codigo";
                    txt_CodigoEncargado.Focus();
                }
                else
                {
                    lb_IngresoEncargado.Text = "";
                    if (Validar.validarRut(rut))
                    {
                        lb_IngresoEncargado.Text = "";
                        if (IsValid)
                        {

                            if (control.validarEncargado(txt_RutEncargado.Text, txt_CodigoEncargado.Text))
                            {
                                lb_IngresoEncargado.Text = "";
                                String datoUsuario = txt_RutEncargado.Text;
                                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, txt_Usuario.Text, DateTime.Now,
                                                                                                 DateTime.Now.AddSeconds(500), false,
                                                                                                 datoUsuario, FormsAuthentication.FormsCookiePath);
                                String encTicket = FormsAuthentication.Encrypt(ticket);

                                Response.Cookies.Add(new HttpCookie(FormsAuthentication.FormsCookieName, encTicket));


                                Session["IDUsuario"] = txt_RutEncargado.Text;

                                Response.Redirect("curso.aspx");


                            }
                            else
                            {
                                lb_IngresoEncargado.Text = "Datos no validos";
                            }
                        }

                    }
                    else
                    {
                        lb_IngresoEncargado.Text = "Rut no valido";
                    }         

                }

            }
           
        }



        protected void Link_Encargado_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        protected void Link_Administrador_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Link_VistaEncuestas_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 3;
        }

        protected void Link_CargarEncuesta_Click(object sender, EventArgs e)
        {

        }

       
    }
}