using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Project.Models
{
    public class MySetting
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Email { get; set; }
        public bool IsSendingEmail { get; set; }
        public string FullName { get; set; }

        public virtual ICollection<MySetting> MySettings { get; set; }
    }
}