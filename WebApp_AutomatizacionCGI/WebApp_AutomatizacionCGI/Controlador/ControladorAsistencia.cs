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

        public bool ActualizarAsistencia(Asistencia nuevo)
        {
            try
            {
                Asistencia original = new Asistencia();
                original = contexto.Asistencia.Find(nuevo.ID_Asistencia);
                original.ID_Pad = original.ID_Pad;
                original.Rut_Docente = original.Rut_Docente;
                original.Estado = nuevo.Estado;
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool addAsistencia_Curso(int pad)
        {
            try
            {
                var consulta = from p in contexto.Pad
                               join c in contexto.Curso on p.ID_Curso equals c.ID_Curso
                               join e in contexto.Encargado on c.Rut_Encargado equals e.Rut
                               join cd in contexto.Curso_Docente on c.ID_Curso equals cd.ID_Curso
                               where p.ID_Pad == pad
                               select cd.Rut_Docente;

                string rut_x = "";
                for (int i = 0; i < consulta.Count(); i++)
                {
                    rut_x = consulta.ToList().ElementAt(i);
                    
                        Asistencia nuevo = new Asistencia
                        {
                            ID_Pad = pad,
                            Rut_Docente = rut_x,
                            Estado = "Sin Asistencia"
                        };


                        contexto.Asistencia.Add(nuevo);                        
                }
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public int Devolver_idAsistencia(int pad, string rut)
        {
            try
            {
                int consulta = (from a in contexto.Asistencia
                               where a.ID_Pad == pad && a.Rut_Docente == rut
                               select new { a.ID_Asistencia }).First().ID_Asistencia;

                return consulta;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        public List<object> Devolver_CantidadAsistencia_Pad(int pad)
        {
            try
            {
                var consulta = from a in contexto.Asistencia
                               where a.ID_Pad == pad
                               select new { a.ID_Asistencia };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> BuscarAsistenciaRepetida(string rut, int id_pad)
        {
            try
            {
                var consulta = from a in contexto.Asistencia
                               where a.Rut_Docente == rut && a.ID_Pad == id_pad && a.Estado == "Asistente"
                               select new { a.ID_Asistencia };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> Lista_AsistenciaXFecha(DateTime fecha)
        {
            try
            {
                var consulta = from a in contexto.Asistencia
                               join p in contexto.Pad on a.ID_Pad equals p.ID_Pad
                               join d in contexto.Docente on a.Rut_Docente equals d.Rut
                               where p.Fecha == fecha
                               select new { p.Fecha, p.ID_Pad, a.Rut_Docente, d.Nombre, d.Apellido, a.Estado };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> Lista_AsistenciaXRut(string rut)
        {
            try
            {
                var consulta = from a in contexto.Asistencia
                               join p in contexto.Pad on a.ID_Pad equals p.ID_Pad
                               join d in contexto.Docente on a.Rut_Docente equals d.Rut
                               where d.Codigo == rut
                               select new { p.Fecha, p.ID_Pad, a.Rut_Docente, d.Nombre, d.Apellido, a.Estado };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> Lista_MostrarAsistencia()
        {
            try
            {
                var consulta = from a in contexto.Asistencia
                               join p in contexto.Pad on a.ID_Pad equals p.ID_Pad
                               join d in contexto.Docente on a.Rut_Docente equals d.Rut                               
                               select new { p.Fecha, p.ID_Pad, a.Rut_Docente, d.Nombre, d.Apellido, a.Estado };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}