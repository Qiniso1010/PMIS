using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Project.Models
{
    public class Tasks
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string SharedId { get; set; }
        public bool? IsActive { get; set; }
        public DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; }
        public string CreatedUnitBy { get; set; }
        public int UserId { get; set; }
        public int UnitId { get; set; }
        public bool? IsComplete { get; set; }
        public string Status { get; set; }

        public string Keterangan { get; set; }

        public virtual ICollection<Tasks> Taskss { get; set; }
    }
}