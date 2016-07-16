using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorEncuestas
    {
        bd_entities contexto = new bd_entities();

        public List<object> listaComentarios(DateTime fecha)
        {
            try
            {
                var consulta = from e in contexto.Encuesta join p in contexto.Pad on e.ID_Curso equals p.ID_Curso
                               where p.Fecha == fecha
                               select new { e.ID_Encuesta, e.Sugerencia };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}