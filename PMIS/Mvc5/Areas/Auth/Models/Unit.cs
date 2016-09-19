using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_unit")]
    public class Unit
    {
        public int id { get; set; }
        public int parent_unit { get; set; }
        public string nama_unit { get; set; }
        public int tipe { get; set; }
        public string kode { get; set; }
        public int urut { get; set; }
        public int? direktorat { get; set; }
        public bool? is_active { get; set; }
        public DateTime date_created { get; set; }

        public virtual ICollection<Unit> Units { get; set; }
    }
}