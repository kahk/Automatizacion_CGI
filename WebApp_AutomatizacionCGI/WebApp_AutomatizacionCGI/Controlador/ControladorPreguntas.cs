using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorPreguntas
    {
        bd_entities contexto = new bd_entities();

        public List<object> listaPreguntas()
        {
            try
            {
                var consulta = from p in contexto.Pregunta
                               orderby p.ID_Pregunta
                               select p;

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}