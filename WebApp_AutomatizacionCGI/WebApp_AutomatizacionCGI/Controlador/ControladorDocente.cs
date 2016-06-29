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
                original.Estado = nuevo.Estado;
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}