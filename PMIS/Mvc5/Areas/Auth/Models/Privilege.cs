using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_privileges")]
    public class Privilege
    {
        public int id { get; set; }
        public int bagian_id { get; set; }
        public string roles { get; set; }
        public string direct { get; set; }
        public int is_active { get; set; }
        public int default_set { get; set; }
        public DateTime date_created { get; set; }

        public virtual ICollection<Privilege> Privileges { get; set; }

    }
}