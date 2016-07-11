using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorAsistencia
    {
        bd_entities contexto = new bd_entities();

        public bool addAsistencia(Asistencia nuevo)
        {
            try
            {
                contexto.Asistencia.Add(nuevo);
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<object> BuscarAsistenciaRepetida(string rut, int id_pad)
        {
            try
            {
                var consulta = from a in contexto.Asistencia
                               where a.Rut_Docente == rut && a.ID_Pad == id_pad
                               select new { a.ID_Asistencia };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}