using Mvc5.ActionFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mvc5.Areas.Auth.Context;
using Mvc5.Areas.Auth.Models;
using System.Web.Security;
using Mvc5.Areas.Auth.Libraries;
using Mvc5.Libraries;

namespace Mvc5.Areas.Auth.Controllers
{
    public class LoginController : Controller
    {

        private MemberContext db = new MemberContext();
        // GET: Auth/Login
        [AuthIsLoginFilter]
        public ActionResult Index()
        {
            ViewBag.Title = Mvc5.Areas.Auth.Libraries.Init.AppName;
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(User user)
        {
            bool Remember = false;
            ViewBag.Title = Mvc5.Areas.Auth.Libraries.Init.AppName;

            user = new User() { username = user.username, password = user.password };

            if (!string.IsNullOrEmpty(user.username) || !string.IsNullOrEmpty(user.password))
            {
                if (this.__auth(user.username, user.password) == true)
                {
                    if (Remember == true)
                    {
                        FormsAuthentication.Initialize();
                        string UserData = db.Users.Find(__user_id(user.username, user.password)).id.ToString();
                        DateTime expire = DateTime.Now.AddDays(60);
                        FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(1, user.username, DateTime.Now, expire, true, UserData, FormsAuthentication.FormsCookiePath);
                        HttpCookie cookie = new HttpCookie(Mvc5.Areas.Auth.Libraries.Init.CookieName, FormsAuthentication.Encrypt(ticket));
                        cookie.HttpOnly = true;
                        Response.Cookies.Set(cookie);
                        return Redirect("~/");
                    }
                    else
                    {
                        Session["IsLogin"] = true;
                        Session["UserId"] = db.Users.Find(__user_id(user.username, user.password)).id.ToString();
                        return Redirect("~/");
                    }

                }
                else
                {
                    ViewBag.Message = "Username atau Password yang anda masukan salah.";
                }
            }
            return View(user);
        }


        // logout / keluar dari aplikasi
        public ActionResult Logout()
        {
            Areas.Auth.Libraries.Auth.IsClear();
            return Redirect("~/");
        }


        private bool __auth(string username, string password)
        {
            var user = from s in db.Users.ToList()
                       select s;
            if (user.Any(s => s.username == username.ToLower() && s.password == Secure.EncryptPassword(password)))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        private int __user_id(string username, string password)
        {
            var user = from s in db.Users.ToList()
                       select s;
            user = user.Where(s => s.username == username.ToLower() && s.password == Secure.EncryptPassword(password));
            return user.FirstOrDefault().id;
        }

    }
}