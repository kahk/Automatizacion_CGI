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
            if (!IsPostBack) { }
        }

        protected void Link_CerrarCurso_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
        }

        protected void Link_AbrirAsistencia_Click(object sender, EventArgs e)
        {
            ControladorPad control = new ControladorPad();

            string rut = Session["IDUsuario"].ToString();
            
            string fecha = DateTime.Now.ToShortDateString();

            
            //control.BuscarPad_DeCurso(rut, fecha);
        }

        protected void Link_RegistrarAsistencia_Click(object sender, EventArgs e)
        {
            lb_Bienvenida.Text = "Bienvenido " + txt_CodigoDocente.Text;
            txt_CodigoDocente.Text = "";
            txt_CodigoDocente.Focus();
        }
    }
}