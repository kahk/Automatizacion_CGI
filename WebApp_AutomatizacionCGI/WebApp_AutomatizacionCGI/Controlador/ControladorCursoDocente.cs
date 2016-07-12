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

        public List<object> Buscar_Docente_En_AsistenciaCurso(int id_pad, string codigo)
        {
            try
            {
                var consulta = from cd in contexto.Curso_Docente
                               join d in contexto.Docente on cd.Rut_Docente equals d.Rut
                               join c in contexto.Curso on cd.ID_Curso equals c.ID_Curso
                               join p in contexto.Pad on c.ID_Curso equals p.ID_Curso
                               where d.Codigo == codigo && p.ID_Pad == id_pad
                               select new { cd.ID_Curso_Docente };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> Devolver_CantidadAsistencia_curso(int pad)
        {
            try
            {
                var consulta = from cd in contexto.Curso_Docente
                               join c in contexto.Curso on cd.ID_Curso equals c.ID_Curso
                               join p in contexto.Pad on c.ID_Curso equals p.ID_Curso
                               where p.ID_Pad == pad
                               select new { cd.ID_Curso_Docente };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> Devolver_CantidadDocentesAsignados(int curso)
        {
            try
            {
                var consulta = from cd in contexto.Curso_Docente                               
                               where cd.ID_Curso == curso
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