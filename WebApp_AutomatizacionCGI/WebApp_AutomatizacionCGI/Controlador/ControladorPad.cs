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
                               join est in contexto.Estado on p.ID_Estado equals est.ID_Estado
                               where p.ID_Curso == id_curso
                               select new { p.ID_Pad, p.ID_Curso, p.Sala, p.Sala_Coffe, p.Hora_Inicio, p.Hora_Termino, p.Fecha, p.ID_Estado, est.Detalle };

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

        public bool ActualizarPad(Pad nuevo)
        {
            try
            {
                Pad original = new Pad();
                original = contexto.Pad.Find(nuevo.ID_Pad);
                original.Sala = nuevo.Sala;
                original.Sala_Coffe = nuevo.Sala_Coffe;
                original.Hora_Inicio = nuevo.Hora_Inicio;
                original.Hora_Termino = nuevo.Hora_Termino;
                original.Fecha = nuevo.Fecha;
                original.ID_Estado = nuevo.ID_Estado;

                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public int BuscarPad_DeCurso(string rut) //devolver int
        {
            try
            {


                int consulta = (from p in contexto.Pad
                                join c in contexto.Curso on p.ID_Curso equals c.ID_Curso
                                join e in contexto.Encargado on c.Rut_Encargado equals e.Rut
                                where e.Rut == rut && p.Fecha == DateTime.Today
                               select new { p.ID_Pad }).First().ID_Pad;

                return consulta;
            }
            catch (Exception)
            {
                return -1;
            }

        }

    }
}