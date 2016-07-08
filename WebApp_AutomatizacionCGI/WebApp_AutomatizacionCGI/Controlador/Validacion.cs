using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class Validar
    {
        //public static bool validarRut(string rut)
        //{

        //    bool validacion = false;
        //    try
        //    {
        //        rut = rut.ToUpper();
        //        rut = rut.Replace(".", "");
        //        rut = rut.Replace("-", "");
        //        int rutAux = int.Parse(rut.Substring(0, rut.Length - 1));

        //        char dv = char.Parse(rut.Substring(rut.Length - 1, 1));

        //        int m = 0, s = 1;
        //        for (; rutAux != 0; rutAux /= 10)
        //        {
        //            s = (s + rutAux % 10 * (9 - m++ % 6)) % 11;
        //        }
        //        if (dv == (char)(s != 0 ? s + 47 : 75))
        //        {
        //            validacion = true;
        //        }
        //    }
        //    catch (Exception)
        //    {
        //    }
        //    return validacion;
        //}

        public static bool validarRut(string rut)
        {
            int Digito;
            int Contador;
            int Multiplo;
            int Acumulador;
            string RutDigito;
            char dv;
            int rutAux = 0;

            rut = rut.ToUpper();
            rut = rut.Replace(".", "");
            rut = rut.Replace("-", "");
            rut = rut.Replace("_", "");

            int cantidad = rut.Length;

            rutAux = int.Parse(rut.Substring(0, rut.Length - 1));


            dv = char.Parse(rut.Substring(rut.Length - 1, 1));

            Contador = 2;
            Acumulador = 0;

            while (rutAux != 0)
            {
                Multiplo = (rutAux % 10) * Contador;
                Acumulador = Acumulador + Multiplo;
                rutAux = rutAux / 10;
                Contador = Contador + 1;

                if (Contador == 8)
                {
                    Contador = 2;
                }
            }

            Digito = 11 - (Acumulador % 11);
            RutDigito = Digito.ToString().Trim();
            if (Digito == 10)
            {
                RutDigito = "K";
            }
            if (Digito == 11)
            {
                RutDigito = "0";
            }


            if (RutDigito.ToString() == dv.ToString())
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public static bool validarEmail(String email)
        {
            bool validar = false;
            int Analizar = email.IndexOf("@");
            if (Analizar > 0)
            {
                if (email.IndexOf("@", Analizar + 1) > 0)
                {
                    return validar;
                }
                int i = email.IndexOf(".", Analizar);
                if (i - 1 > Analizar)
                {
                    if (i + 1 < email.Length)
                    {
                        string r = email.Substring(i + 1, 1);
                        if (r != ".")
                        {
                            validar = true;
                        }
                    }
                }
            }
            return validar;

        }

    }
}