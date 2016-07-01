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

        public List<object> listaBuscarEncargados(String buscar)
        {
            try
            {
                var consulta = from e in contexto.Encargado
                               where e.Rut == buscar
                               select new { e.Rut};

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }

        }


    }
}