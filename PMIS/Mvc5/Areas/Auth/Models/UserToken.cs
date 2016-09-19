using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Mvc5.Areas.Auth.Models
{
    [Table("app_users_token_login")]
    public class UserToken
    {
        public int id { get; set; }
        public string token { get; set; }
        public int user_id { get; set; }
        public DateTime date_created { get; set; }

        public virtual ICollection<UserToken> UserTokens { get; set; }
    }
}