using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Project.Models
{
    public class Comment
    {
        public int Id { get; set; }
        public int TasksId { get; set; }
        public string CommentText { get; set; }
        public DateTime CreatedAt { get; set; }
        public int UserId { get; set; }
        public int UnitId { get; set; }
        public string CreatedBy { get; set; }

        public virtual ICollection<Comment> Comments { get; set; }
    }
}