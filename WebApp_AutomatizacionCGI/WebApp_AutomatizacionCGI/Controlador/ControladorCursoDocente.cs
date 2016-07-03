using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorCursoDocente
    {
        bd_entities contexto = new bd_entities();

        public bool addCursoDocente(Curso_Docente nuevo)
        {
            try
            {
                contexto.Curso_Docente.Add(nuevo);
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<object> listaBuscarCurso_Docente(int id_curso, string rut)
        {
            try
            {
                var consulta = from cd in contexto.Curso_Docente
                               where cd.Rut_Docente == rut && cd.ID_Curso == id_curso
                               select new { cd.ID_Curso_Docente };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}