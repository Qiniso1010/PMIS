using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("m_unit_set_ka")]
    public class UserKa
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }
        [Column("unit_id")]
        public int UnitId { get; set; }
        [Column("IsSet")]
        public int IsSet { get; set; }

        public virtual ICollection<UserKa> UserKas { get; set; }
    }
}