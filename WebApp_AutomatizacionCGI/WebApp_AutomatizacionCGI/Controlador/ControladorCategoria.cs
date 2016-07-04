using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorCategoria
    {
        bd_entities contexto = new bd_entities();

        public List<Categoria> listaCursos()
        {
            try
            {
                return contexto.Categoria.ToList();
            }
            catch (Exception)
            {
                return null;
            }
        }
    }
}