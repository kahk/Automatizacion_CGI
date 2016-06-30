using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorEstado
    {
        bd_entities contexto = new bd_entities();

        public List<Estado> listaEstados()
        {
            try
            {
                return contexto.Estado.ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}