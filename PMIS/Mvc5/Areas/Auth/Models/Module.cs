using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_modules")]
    public class Module
    {
        public int id { get; set; }
        public string nama { get; set; }
        public bool? is_active { get; set; }

        public virtual ICollection<Module> Modules { get; set; }
    }
}