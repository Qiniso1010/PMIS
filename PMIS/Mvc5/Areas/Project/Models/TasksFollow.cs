using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Project.Models
{
    public class TasksFollow
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int TasksId { get; set; }

        public virtual ICollection<TasksFollow> TasksFollows { get; set; }
    }
}