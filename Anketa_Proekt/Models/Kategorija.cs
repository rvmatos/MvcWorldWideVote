//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Anketa_Proekt.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Kategorija
    {
        public Kategorija()
        {
            this.Anketas = new HashSet<Anketa>();
        }
    
        public int id_k { get; set; }
        public string ime_k { get; set; }
        public string opis_k { get; set; }
    
        public virtual ICollection<Anketa> Anketas { get; set; }
    }
}
