using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorPad
    {
        bd_entities contexto = new bd_entities();

        public List<object> listaPad_Cursos(int id_curso)
        {
            try
            {
                var consulta = from p in contexto.Pad
                               join c in contexto.Curso on p.ID_Curso equals c.ID_Curso
                               where p.ID_Curso == id_curso
                               select new { p.ID_Curso, p.Sala, p.Sala_Coffe, p.Hora_Inicio, p.Hora_Termino, p.Fecha };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool addPad(Pad nuevo)
        {
            try
            {
                contexto.Pad.Add(nuevo);
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

    }
}