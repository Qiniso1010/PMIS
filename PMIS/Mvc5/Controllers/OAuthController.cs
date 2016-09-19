using System;
using System.Linq;
using System.Web.Mvc;
using Mvc5.Areas.Auth.Context;
using Mvc5.Areas.Auth.Libraries;
using System.Web;
using System.Web.Security;

namespace Mvc5.Controllers
{
    public class OAuthController : Controller
    {
        private MemberContext _member = new MemberContext();

        // GET: OAuth
        public ActionResult Index(string token)
        {
            Auth.IsClear();
            if (this.ValidateUser(token))
            {
                var user = (from a in _member.Users
                            join b in _member.UserTokens on a.id equals b.user_id
                            select new
                            {
                                b.token,
                                a.id,
                                a.username
                            }).ToList()
                         .Where(s => s.token.ToLower() == token.ToLower())
                         .FirstOrDefault();

                FormsAuthentication.Initialize();
                string UserData = _member.Users.Find(user.id).id.ToString();
                DateTime expire = DateTime.Now.AddDays(60);
                FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, user.username, DateTime.Now, expire, true, UserData, FormsAuthentication.FormsCookiePath);
                HttpCookie cookie = new HttpCookie(Init.CookieName, FormsAuthentication.Encrypt(ticket));
                cookie.HttpOnly = true;

                // Delete Current Token
                this._updateTokenUser(token);
                
                Response.Cookies.Set(cookie);
                return Redirect("~/");
            }

            return View("~/Areas/Auth/Views/Login/Index.cshtml");
        }

        // logout / keluar dari aplikasi
        public ActionResult Logout()
        {
            Auth.IsClear();
            return Redirect("~/Auth/Login");
        }


        [NonAction]
        protected bool ValidateUser(string token)
        {
            var _login = (from a in _member.Users
                         join b in _member.UserTokens on a.id equals b.user_id   
                         select new {
                             b.token
                         })
                         .Where(s => s.token.ToLower() == token.ToLower())
                         .FirstOrDefault();
            if (_login != null)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        [NonAction]
        protected void _updateTokenUser(string token)
        {
            var _token = _member.UserTokens.Where(s => s.token.ToLower() == token.ToLower()).FirstOrDefault();
            if (_token != null)
            {
                _member.UserTokens.Remove(_token);
                _member.SaveChanges();

                this._delete_token_by_id(token);
            }
        }

        [NonAction]
        protected void _delete_token_by_id(string token)
        {
            var user = _member.UserTokens.Where(s => s.token.ToLower() == token.ToLower()).FirstOrDefault();
            if (user != null)
            {
                 var _token = _member.UserTokens.Where(s => s.user_id == user.user_id).ToList();
                 foreach (var x in _token)
                 {
                     _member.UserTokens.Remove(x);
                     _member.SaveChanges();
                 }
            }
            else
            {
                
            }
        }

    }
}