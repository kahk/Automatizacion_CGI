using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApp_AutomatizacionCGI.Modelo;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class ControladorUsuario
    {
        bd_entities contexto = new bd_entities();
        public bool validarUsuario(String nombre, String clave)
        {
            try
            {
                var consulta = from u in contexto.Usuario
                               where u.Nickname.Equals(nombre) && u.Password.Equals(clave)
                               select u;
                bool valido = consulta.Count() == 1;
                if (valido == true)
                {
                    int estado_usuario = consulta.First().ID_Estado;
                    if (estado_usuario == 1)
                    {

                    }
                    else
                    {
                        valido = false;
                    }
                }
                return valido;
            }
            catch(Exception)
            {
                return false;
            }
        }
    }
}