using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;
namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorDocente
    {
        bd_entities contexto = new bd_entities();

        public List<Docente> listaDocentes()
        {
            try
            {
                return contexto.Docente.ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }


        public bool addDocentes(Docente nuevo)
        {
            try
            {
                contexto.Docente.Add(nuevo);
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ActualizarDocente(Docente nuevo)
        {
            try
            {
                Docente original = new Docente();
                original = contexto.Docente.Find(nuevo.Rut);
                original.Nombre = nuevo.Nombre;
                original.Apellido = nuevo.Apellido;
                original.Correo = nuevo.Correo;
                original.Fecha_Ingreso = nuevo.Fecha_Ingreso;
                original.ID_Estado = nuevo.ID_Estado;

                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<object> listaAsignar_Docentes()
        {
            try
            {
                var consulta = from d in contexto.Docente
                               where d.ID_Estado == 1
                               select new { d.Rut, d.Nombre, d.Apellido };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> listaGridView_Docentes()
        {
            try
            {
                var consulta = from d in contexto.Docente
                               join e in contexto.Estado on d.ID_Estado equals e.ID_Estado
                               select new { d.Rut, d.Nombre, d.Apellido, d.Correo, d.Fecha_Ingreso, d.ID_Estado, e.Detalle };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> listabuscarDocentes(string buscar)
        {
            try
            {
                var consulta = from d in contexto.Docente
                               where d.ID_Estado == 1 && d.Rut == buscar
                               select new { d.Rut, d.Nombre, d.Apellido };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> BuscarDocentesRepetidos(string rut)
        {
            try
            {
                var consulta = from d in contexto.Docente
                               where d.Rut == rut
                               select new { d.Rut};

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public String devolver_rut(string codigo)
        {
            try
            {
                String consulta = (from d in contexto.Docente
                                   where d.Codigo == codigo
                                   select new { d.Rut }).First().Rut.ToString();

                return consulta;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public String devolver_nombre(string codigo)
        {
            try
            {
                String consulta = (from d in contexto.Docente
                                   where d.Codigo == codigo
                                   select new { d.Nombre }).First().Nombre.ToString();

                return consulta;
            }
            catch (Exception)
            {
                return "";
            }
        }

        public String devolver_apellido(string codigo)
        {
            try
            {
                String consulta = (from d in contexto.Docente
                                   where d.Codigo == codigo
                                   select new { d.Apellido }).First().Apellido.ToString();

                return consulta;
            }
            catch (Exception)
            {
                return "";
            }
        }


        public List<object> Lista_Buscar_Docentes(string rut)
        {
            try
            {
                var consulta = from d in contexto.Docente
                               join e in contexto.Estado on d.ID_Estado equals e.ID_Estado
                               where d.Codigo == rut
                               select new { d.Rut, d.Nombre, d.Apellido, d.Correo, d.Fecha_Ingreso, d.ID_Estado, e.Detalle };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> Lista_Buscar_AsignarDocentes(string rut)
        {
            try
            {
                var consulta = from d in contexto.Docente
                               where d.ID_Estado == 1 && d.Codigo == rut
                               select new { d.Rut, d.Nombre, d.Apellido };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}