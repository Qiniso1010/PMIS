using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_users")]
    public class User
    {
        
        public int id { get; set; }
        public int privileges_id { get; set; }
        public string username { get; set; }
        public string email { get; set; }
        public string password { get; set; }
        public string token_key { get; set; }
        public bool? is_active { get; set; }
        public DateTime date_created { get; set; }
        public int? unit_id { get; set; }
        //public bool? RememberMe { get; set; }

        public virtual ICollection<User> Users { get; set; }
    }
}