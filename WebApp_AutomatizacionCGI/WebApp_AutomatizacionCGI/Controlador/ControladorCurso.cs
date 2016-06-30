using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorCurso
    {
        bd_entities contexto = new bd_entities();

        public List<Curso> listaCursos()
        {
            try
            {
                return contexto.Curso.ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }


        public bool addCursos(Curso nuevo)
        {
            try
            {
                contexto.Curso.Add(nuevo);
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}