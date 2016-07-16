using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp_AutomatizacionCGI.Controlador
{
    public class Resultado
    {
        public string pregunta { get; set; }
        public int resultado1 { get; set; }
        public int resultado2 { get; set; }
        public int resultado3 { get; set; }
        public int resultado4 { get; set; }
        public int resultado5 { get; set; }
        public int resultado6 { get; set; }
        public int resultado7 { get; set; }
        public int resultado8 { get; set; }
        public int resultado9 { get; set; }

        public Resultado() { }

        public Resultado(string p, int r1, int r2, int r3, int r4, int r5, int r6, int r7, int r8, int r9)
        {
            this.pregunta = p;
            this.resultado1 = r1;
            this.resultado2 = r2;
            this.resultado3 = r3;
            this.resultado4 = r4;
            this.resultado5 = r5;
            this.resultado6 = r6;
            this.resultado7 = r7;
            this.resultado8 = r8;
            this.resultado9 = r9;
        }
    }
}