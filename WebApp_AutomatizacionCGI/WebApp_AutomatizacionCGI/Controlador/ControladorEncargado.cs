using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorEncargado
    {
        bd_entities contexto = new bd_entities();

        public List<Encargado> listaEncargados()
        {
            try
            {
                return contexto.Encargado.ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool validarEncargado(String Rut, String Codigo)
        {
            try
            {
                var consulta = from e in contexto.Encargado
                               where e.Rut.Equals(Rut) && e.Codigo.Equals(Codigo)
                               select e;
                bool valido = consulta.Count() == 1;
                if (valido == true)
                {
                    int estado_encargado = consulta.First().ID_Estado;
                    if (estado_encargado == 1)
                    {

                    }
                    else
                    {
                        valido = false;
                    }
                }
                return valido;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<object> listaBuscarEncargados(String buscar)
        {
            try
            {
                var consulta = from e in contexto.Encargado
                               where e.Rut == buscar
                               select new { e.Rut };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }


        public bool addEncargados(Encargado nuevo)
        {
            try
            {
                contexto.Encargado.Add(nuevo);
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ActualizarEncargado(Encargado nuevo)
        {
            try
            {
                Encargado original = new Encargado();
                original = contexto.Encargado.Find(nuevo.Rut);
                original.Nombre = nuevo.Nombre;
                original.Apellido = nuevo.Apellido;
                original.Correo = nuevo.Correo;
                original.ID_Estado = nuevo.ID_Estado;

                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<object> listaGridview_Encargados()
        {
            try
            {
                var consulta = from e in contexto.Encargado
                               join es in contexto.Estado on e.ID_Estado equals es.ID_Estado
                               select new { e.Rut, e.Nombre, e.Apellido, e.Correo, e.ID_Estado, es.Detalle };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }

        }

        public List<object> BuscarEncargadosRepetidos(string rut)
        {
            try
            {
                var consulta = from e in contexto.Encargado
                               where e.Rut == rut
                               select new { e.Rut };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }




    }
}