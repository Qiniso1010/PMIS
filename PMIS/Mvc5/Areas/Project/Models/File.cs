using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Project.Models
{
    public class File
    {
        public int Id { get; set; }
        public int TasksId { get; set; }
        public int CheckListId { get; set; }
        public string RealName { get; set; }
        public string Name { get; set; }
        public string Thumb { get; set; }
        public string FullPath { get; set; }
        public string ext { get; set; }
        public string Tipe { get; set; }
        public int UnitId { get; set; }

        public DateTime CreatedAt { get; set; }
        public string CreatedBy { get; set; }

        public virtual ICollection<File> Files { get; set; }
    }
}