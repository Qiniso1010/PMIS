using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("o_surat_to_unit")]
    public class UserToUnit
    {
        [Key]
        [Column("id")]
        public int Id { get; set; }
        [Column("from_unit_id")]
        public int FromUnitId { get; set; }
        [Column("to_unit_id")]
        public int ToUnitId { get; set; }

        public virtual ICollection<UserToUnit> UserToUnits { get; set; }
    }
}