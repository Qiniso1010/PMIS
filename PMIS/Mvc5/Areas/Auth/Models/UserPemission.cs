using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_users_permission")]
    public class UserPemission
    {
        public int id { get; set; }
        public int role_id { get; set; }
        public int module_id { get; set; }
        public int bisa_insert { get; set; }
        public int bisa_delete { get; set; }
        public int bisa_edit { get; set; }
        public int bisa_akses { get; set; }
        public DateTime date_created { get; set; }

        public virtual ICollection<UserPemission> UserPermissions { get; set; }
    }
}