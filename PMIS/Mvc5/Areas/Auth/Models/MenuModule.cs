using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_menu_modules")]
    public class MenuModule
    {
        public int id { get; set; }
        public int menu_id { get; set; }
        public int modules_id { get; set; }
        public DateTime date_created { get; set; }

        public virtual ICollection<MenuModule> MenuModules { get; set; }
    }
}