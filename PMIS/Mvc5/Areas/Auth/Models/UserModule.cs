using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_users_modul_connect")]
    public class UserModule
    {
        public int id { get; set; }
        public int modul_id { get; set; }
        public int user_id { get; set; }
        public DateTime date_created { get; set; }

        public virtual ICollection<UserModule> UserModules { get; set; }

    }
}