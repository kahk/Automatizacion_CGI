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
    public partial class encuesta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cargarPreguntas();
                MultiView1.ActiveViewIndex = 0;
            }
        }

        public void cargarPreguntas()
        {
            bd_entities contexto = new bd_entities();
            var consulta = from p in contexto.Pregunta
                           orderby p.ID_Pregunta
                           select p;

            List<Pregunta> preguntasBD = consulta.ToList();
            lbBDP1.Text = preguntasBD.ElementAt(0).Pregunta1;
            lbBDP2.Text = preguntasBD.ElementAt(7).Pregunta1;
            lbBDP3.Text = preguntasBD.ElementAt(8).Pregunta1;
            lbBDP4.Text = preguntasBD.ElementAt(9).Pregunta1;
            lbBDP5.Text = preguntasBD.ElementAt(10).Pregunta1;
            lbBDP6.Text = preguntasBD.ElementAt(11).Pregunta1;
            lbBDP7.Text = preguntasBD.ElementAt(12).Pregunta1;
            lbBDP8.Text = preguntasBD.ElementAt(13).Pregunta1;
            lbBDP9.Text = preguntasBD.ElementAt(14).Pregunta1;
            lbBDP10.Text = preguntasBD.ElementAt(1).Pregunta1;
            lbBDP11.Text = preguntasBD.ElementAt(2).Pregunta1;
            lbBDP12.Text = preguntasBD.ElementAt(3).Pregunta1;
            lbBDP13.Text = preguntasBD.ElementAt(4).Pregunta1;
            lbBDP14.Text = preguntasBD.ElementAt(5).Pregunta1;
            lbBDP15.Text = preguntasBD.ElementAt(6).Pregunta1;
        }

        protected void Link_EnviarEncuesta_Click(object sender, EventArgs e)
        {

            try
            {
                string sugerencia = txtSugerencia.Text;
                string usuario = Session["IDUsuario"].ToString();
                string pass = Session["PUsuario"].ToString();

                bd_entities contexto = new bd_entities();
                var consulta = from c in contexto.Curso
                               where c.Usuario == usuario && c.Contraseña == pass
                               select c.ID_Curso;

                int idCursito = consulta.ToList().ElementAt(0);

                Encuesta enc = new Encuesta { Sugerencia = sugerencia, ID_Curso = idCursito };
                contexto.Encuesta.Add(enc);
                contexto.SaveChanges();

                

                Respuestas nuevo1 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP1.Text, Respuesta = pregunta1.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo1);
                contexto.SaveChanges();

                Respuestas nuevo2 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP2.Text, Respuesta = pregunta2.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo2);
                contexto.SaveChanges();

                Respuestas nuevo3 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP3.Text, Respuesta = pregunta3.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo3);
                contexto.SaveChanges();

                Respuestas nuevo4 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP4.Text, Respuesta = pregunta4.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo4);
                contexto.SaveChanges();

                Respuestas nuevo5 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP5.Text, Respuesta = pregunta5.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo5);
                contexto.SaveChanges();

                Respuestas nuevo6 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP6.Text, Respuesta = pregunta6.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo6);
                contexto.SaveChanges();

                Respuestas nuevo7 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP7.Text, Respuesta = pregunta7.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo7);
                contexto.SaveChanges();

                Respuestas nuevo8 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP8.Text, Respuesta = pregunta8.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo8);
                contexto.SaveChanges();

                Respuestas nuevo9 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP9.Text, Respuesta = pregunta9.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo9);
                contexto.SaveChanges();

                Respuestas nuevo10 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP10.Text, Respuesta = pregunta10.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo10);
                contexto.SaveChanges();

                Respuestas nuevo11 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP11.Text, Respuesta = pregunta11.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo11);
                contexto.SaveChanges();

                Respuestas nuevo12 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP12.Text, Respuesta = pregunta12.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo12);
                contexto.SaveChanges();

                Respuestas nuevo13 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP13.Text, Respuesta = pregunta13.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo13);
                contexto.SaveChanges();

                Respuestas nuevo14 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP14.Text, Respuesta = pregunta14.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo14);
                contexto.SaveChanges();

                Respuestas nuevo15 = new Respuestas { ID_Encuesta = enc.ID_Encuesta, ID_Pregunta = lbP15.Text, Respuesta = pregunta15.SelectedValue, ID_Curso = idCursito };
                contexto.Respuestas.Add(nuevo15);
                contexto.SaveChanges();
            }
            catch (Exception)
            {
                lbError.Visible = true;
            }

            Response.Redirect("index.aspx");

            

            //Curso buscarID = contexto.Curso.Find();
            

            Respuestas resp = new Respuestas { };

        }
        protected void Link_Siguiente_Vista0_Click(object sender, EventArgs e)
        {     
            MultiView1.ActiveViewIndex = 1;          
        }
        protected void Link_Siguiente_Vista1_Click(object sender, EventArgs e)
        {
            if (pregunta1.SelectedValue == "" || pregunta2.SelectedValue == "" || pregunta3.SelectedValue == "" || pregunta4.SelectedValue == "")
            {
                lbview2.Text = "Por favor, rellene su encuesta";
            }
            else
            {
                lbview2.Text = "";
                MultiView1.ActiveViewIndex = 2;
            }

        }

        protected void Link_Anterior_Vista2_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 1;           
        }

        protected void Link_Siguiente_Vista2_Click(object sender, EventArgs e)
        {
            if (pregunta5.SelectedValue == "" || pregunta6.SelectedValue == "" || pregunta7.SelectedValue == "" || pregunta8.SelectedValue == "")
            {
                lbview3.Text = "Por favor, rellene su encuesta";
            }
            else
            {
                lbview3.Text = "";
                MultiView1.ActiveViewIndex = 3;
            }
        }

        protected void Link_anterior_Vista3_Click(object sender, EventArgs e)
        {
            
            MultiView1.ActiveViewIndex = 2;
        }

        protected void Link_Siguiente_Vista3_Click(object sender, EventArgs e)
        {
            if (pregunta9.SelectedValue == "" || pregunta10.SelectedValue == "" || pregunta11.SelectedValue == "" || pregunta12.SelectedValue == "")
            {
                lbview4.Text = "Por favor, rellene su encuesta";
            }
            else
            {
                lbview4.Text = "";
                MultiView1.ActiveViewIndex = 4;
            }
        }

        protected void Link_Anterior_Vista4_Click(object sender, EventArgs e)
        {
            
            MultiView1.ActiveViewIndex = 3;
        }

        protected void Link_Siguiente_Vista4_Click(object sender, EventArgs e)
        {
            if (pregunta13.SelectedValue == "" || pregunta14.SelectedValue == "" || pregunta15.SelectedValue == "")
            {
                lbview5.Text = "Por favor, rellene su encuesta";
            }
            else
            {
                lbview5.Text = "";
                MultiView1.ActiveViewIndex = 5;
            }
        }

        protected void Link_Anterior_Vista5_Click(object sender, EventArgs e)
        {
            
            MultiView1.ActiveViewIndex = 4;
        }

       
    }
}