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
    using System.ComponentModel.DataAnnotations;
    
    public partial class Anketa
    {
        public Anketa()
        {
            this.Glasas = new HashSet<Glasa>();
            this.Komentar_Za = new HashSet<Komentar_Za>();
            this.Ogranicuvanjas = new HashSet<Ogranicuvanja>();
            this.Kategorijas = new HashSet<Kategorija>();
            this.Mozni_Odgovori = new HashSet<Mozni_Odgovori>();

            this.GlasoviId = new List<int>();
            this.isSelected = false;
        }

        [Key]
        public int id_anketa { get; set; }

        [Required]
        [StringLength(200)]
        [Display(Name = "Question: ")]
        public string prasanje { get; set; }

        [StringLength(300)]
        [Display(Name = "Description: ")]
        public string opis_a { get; set; }

        [Required]
        [Display(Name = "Due date: ")]
        public System.DateTime kraen_datum { get; set; }

        [Required]
        public int id_lice { get; set; }

        [Required]
        public System.DateTime datum_kreiranje { get; set; }

        [Required]
        [Display(Name = "Multiple answers available: ")]
        public int multi_choice { get; set; }

        [Display(Name = "Image URL: ")]
        public string url_slika { get; set; }
    
        public virtual Louse Louse { get; set; }
        public virtual ICollection<Glasa> Glasas { get; set; }
        public virtual ICollection<Komentar_Za> Komentar_Za { get; set; }
        public virtual ICollection<Ogranicuvanja> Ogranicuvanjas { get; set; }
        public virtual ICollection<Kategorija> Kategorijas { get; set; }
        public virtual ICollection<Mozni_Odgovori> Mozni_Odgovori { get; set; }

        public List<int> GlasoviId { get; set; }

        public string komentarSodrzina { get; set; }

        public string mozen_odg { get; set; }

        public bool isSelected { get; set; }
    }
}
