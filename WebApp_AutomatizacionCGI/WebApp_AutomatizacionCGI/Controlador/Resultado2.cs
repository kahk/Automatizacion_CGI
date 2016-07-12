using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class Resultado2
    {
        public string pregunta { get; set; }
        public int resultado1 { get; set; }
        public int resultado2 { get; set; }

        public Resultado2() { }

        public Resultado2(string p, int r1, int r2)
        {
            this.pregunta = p;
            this.resultado1 = r1;
            this.resultado2 = r2;
        }
    }
}