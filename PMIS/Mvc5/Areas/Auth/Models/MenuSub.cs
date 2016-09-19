using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    public class MenuSub
    {
        public int id { get; set; }
        public int module_id { get; set; }
        public int parent_id { get; set; }
        public int pri_id { get; set; }
        public string menu { get; set; }
        public string link { get; set; }
        public bool? is_active { get; set; }
        public string css_icon { get; set; }
        public int urut { get; set; }
        public int admin { get; set; }

        public virtual ICollection<MenuSub> MenusSub { get; set; }

    }
}