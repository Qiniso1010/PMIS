using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using Mvc5.Areas.Auth.Context;

namespace Mvc5.Areas.Auth.Libraries
{
    public class Auth
    {
        private static MemberContext _member = new MemberContext();

        // get userId By Cookie or Session
        public static string GetUserId()
        {
            var AuthCookie = HttpContext.Current.Request.Cookies[Areas.Auth.Libraries.Init.CookieName];
            var IsLogin = HttpContext.Current.Session["IsLogin"];
            var UserId = HttpContext.Current.Session["UserId"];

            if (AuthCookie != null && IsLogin == null)
            {
                var authTicket = FormsAuthentication.Decrypt(AuthCookie.Value);
                string data = authTicket.UserData;
                return data;
            }
            else if (AuthCookie == null && IsLogin != null)
            {
                return UserId.ToString();
            }
            else
            {
                return null;
            }
        }

        public static string __SessionId()
        {
            var AuthCookie = HttpContext.Current.Request.Cookies["ASP.NET_SessionId"];

            if (AuthCookie != null)
            {
                var SessionId = AuthCookie.Value;
                return SessionId;
            }
            else
            {
                return null;
            }
        }

        // set status login / not
        public static bool IsLogin()
        {
            if (GetUserId() != null)
            {
                return true;
            }
            else
            {
                return false;
            }
            
        }

        // Set Supervisor
        public static string IsSupervisor()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var user = _member.Users.Find(UserId);
                try
                {

                    var supervisor = _member.UserKas.Where(s => s.UnitId == user.unit_id).FirstOrDefault();
                    return Convert.ToString(supervisor.IsSet);
                }
                catch (Exception ex)
                {
                    return ex.ToString();
                }
            }
            else
            {
                return "UserId Not Valid!";
            }
        }

       

        // find role name <by user_id>
        public static string GetRoleName()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var user = _member.Users.Find(UserId);
                var role = _member.Privileges.Where(s => s.id.Equals(user.privileges_id)).FirstOrDefault();
                if (role != null)
                {
                    return role.roles;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
            
        }

        // find roleId <by user_id>
        public static int GetRoleId()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var user = _member.Users.Find(UserId);
                var role = _member.Privileges.Where(s => s.id.Equals(user.privileges_id)).FirstOrDefault();
                if (role != null)
                {
                    return role.id;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        // find unit name <by user_id>
        public static string GetUnitName()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var user = _member.Users.Find(UserId);
                var unit = _member.Units.Where(s => s.id == user.unit_id).FirstOrDefault();
                if (unit != null)
                {
                    return unit.nama_unit;
                }
                else
                {
                    return "-";
                }
            }
            else
            {
                return "-";
            }
           
        }

        // GET: Parent Unit
        public static int GetParentUnitId()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var user = _member.Users.Find(UserId);
                var sub_unit = _member.Units.Where(s => s.id == user.unit_id).FirstOrDefault();
                if (sub_unit != null)
                {
                    var parent_unit = _member.Units.Where(s => s.id == sub_unit.parent_unit).FirstOrDefault();
                    return parent_unit.id;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        // find / get unit id <by user_id>
        public static int GetUnitId()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var user = _member.Users.Find(UserId);
                var unit = _member.Units.Where(s => s.id == user.unit_id).FirstOrDefault();
                if (unit != null)
                {
                    return unit.id;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        // find and compare <by user_id>
        public static bool ModuleSameWith(string name)
        {
            try
            {
                if (GetUserId() != null)
                {
                    int UserId = Convert.ToInt32(GetUserId());
                    var module = (from a in _member.Modules
                                  join b in _member.UserModules on a.id equals b.modul_id
                                  select new
                                  {
                                      b.user_id,
                                      a.nama
                                  })
                              .Where(s => s.user_id == UserId)
                              .FirstOrDefault();
                    if (module.nama != null)
                    {
                        if (module.nama.ToLower().Equals(name))
                        {

                            return true;
                        }
                        else
                        {
                            return false;   
                        }
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
                
            }
            catch (Exception ex)
            {
                return false;
            }
           
            
        }

        // find module name <by user_id>
        public static string GetModuleName()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var module = (from a in _member.Modules
                              join b in _member.UserModules on a.id equals b.modul_id
                              select new
                              {
                                  b.user_id,
                                  a.nama
                              })
                          .Where(s => s.user_id.Equals(UserId))
                          .FirstOrDefault();
                if (module != null)
                {
                    return module.nama;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        // find module id <by user_id>
        public static int GetModuleId()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var module = (from a in _member.Modules
                              join b in _member.UserModules on a.id equals b.modul_id
                              select new
                              {
                                  b.user_id,
                                  a.nama,
                                  a.id
                              })
                          .Where(s => s.user_id.Equals(UserId))
                          .FirstOrDefault();
                if (module != null)
                {
                    return module.id;
                }
                else
                {
                    return 0;
                }
            }
            else
            {
                return 0;
            }
        }

        // get username <by user_id>
        public static string GetUserName()
        {   
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var user = _member.Users.Find(UserId);
                if (user != null)
                {
                    return user.username;
                }
                else
                {
                    return null;
                }
            }
            else
            {
                return null;
            }
        }

        // GET: Admin This Application not SuperAdmin 
        public static bool? GetIsAdmin()
        {
            if (GetUserId() != null)
            {
                int UserId = Convert.ToInt32(GetUserId());
                var user = (from a in _member.Privileges
                           join b in _member.Users on a.id equals b.privileges_id
                           select new {
                            b.id,
                            a.default_set

                           })
                           .Where(s => s.id.Equals(UserId))
                           .FirstOrDefault();
                if (user != null)
                {
                    if (user.default_set == 1)
                    {

                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
                           
            }
            else
            {
                return false;
            }
        }


        // clear session and cookie <if logout set>
        public static void IsClear()
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            FormsAuthentication.SignOut();
            HttpCookie cookie = new HttpCookie(Init.CookieName);
            HttpContext.Current.Response.Cookies.Remove(cookie.Value);
            HttpContext.Current.Response.Cookies.Remove(Init.CookieName);
            HttpContext.Current.Response.Cookies.Clear();
            HttpContext.Current.Response.Cookies[Init.CookieName].Expires = DateTime.Now.AddDays(-1);
        }
    }
}