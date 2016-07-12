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
            catch (Exception)
            {
                return false;
            }
        }

        public bool validarUsuario_root(String nombre, String clave)
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
                    string tipo = consulta.First().Tipo;

                    if (estado_usuario == 1 && tipo == "root")
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

        public List<object> listaUsuarios()
        {
            try
            {
                var consulta = from u in contexto.Usuario
                               join e in contexto.Estado on u.ID_Estado equals e.ID_Estado                               
                               select new { u.Rut, u.Nombre, u.Apellido, u.Nickname, u.Password, u.Tipo, u.ID_Estado, e.Detalle };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

       


        public string DevolverNombreUsuario (string nick) //devolver int
        {
            try
            {


                string consulta = (from u in contexto.Usuario                                
                                where u.Nickname == nick
                                select new { u.Nombre }).First().Nombre.ToString();

                return consulta;
            }
            catch (Exception)
            {
                return "";
            }

        }

        public string DevolverApellidoUsuario(string nick) //devolver int
        {
            try
            {


                string consulta = (from u in contexto.Usuario
                                   where u.Nickname == nick
                                   select new { u.Apellido }).First().Apellido.ToString();

                return consulta;
            }
            catch (Exception)
            {
                return "";
            }

        }

        public bool addUsuario(Usuario nuevo)
        {
            try
            {
                contexto.Usuario.Add(nuevo);
                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public bool ActualizarUsuario(Usuario nuevo)
        {
            try
            {
                Usuario original = new Usuario();
                original = contexto.Usuario.Find(nuevo.Rut);
                original.Nombre = nuevo.Nombre;
                original.Apellido = nuevo.Apellido;
                original.Nickname = nuevo.Nickname;
                original.Password = nuevo.Password;
                original.Tipo = nuevo.Tipo;
                original.ID_Estado = nuevo.ID_Estado;

                return contexto.SaveChanges() > 0;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public List<object> Buscar_nickname(string nick)
        {
            try
            {
                var consulta = from u in contexto.Usuario
                               where u.Nickname == nick
                               select new { u.Rut };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public List<object> Buscar_Rut(string rut)
        {
            try
            {
                var consulta = from u in contexto.Usuario
                               where u.Rut == rut
                               select new { u.Rut };

                return consulta.ToList<object>();
            }
            catch (Exception)
            {
                return null;
            }
        }


    }
}