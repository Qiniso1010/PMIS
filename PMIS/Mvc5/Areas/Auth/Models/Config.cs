using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_config")]
    public class Config
    {
        public int id { get; set; }
        public string key_secure { get; set; }
        public string default_pass { get; set; }
        public string nama_aplikasi { get; set; }
        public string email { get; set; }
        public string versi { get; set; }
        public int active { get; set; }
        public int user_daftar_active { get; set; }
        public string nama_perusahaan { get; set; }
        public string contact { get; set; }
        public int pagin { get; set; }
        public string direct { get; set; }
        public DateTime date_created { get; set; }
        public DateTime date_update { get; set; }

        public virtual ICollection<Config> Configs { get; set; }



    }
}