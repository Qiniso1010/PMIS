using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("m_user_set_plt")]
    public class UserPlt
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }

        [Column("user_id")]
        public int UserId { get; set; }
        [Column("to_user_id")]
        public int ToUserId { get; set; }
        [Column("email")]
        public string Email { get; set; }
        [Column("IsPLT")]
        public bool? IsPlt { get; set; }

        public virtual ICollection<UserPlt> UserPlts { get; set; }

    }
}