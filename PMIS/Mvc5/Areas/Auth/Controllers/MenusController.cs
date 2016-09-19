using System;
using System.Linq;
using System.Web.Mvc;
using Mvc5.Areas.Auth.Context;
using Mvc5.Areas.Auth.Libraries;
using Mvc5.ActionFilters;
using System.Threading.Tasks;
using System.Collections.Generic;
using Mvc5.Areas.Auth.Models;
using MySql.Data.MySqlClient;

namespace Mvc5.Areas.Auth.Controllers
{
    public class MenusController : Controller
    {
       
       private MemberContext _menu = new MemberContext();

        // GET: CMenu
        [AuthFilter]
        public ActionResult Index()
        {
            var menu = _menu.Menus.ToList();

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AuthFilter]
        public JsonResult ListingMenuAdmin(string src)
        {
            int RoleId = Auth.Libraries.Auth.GetRoleId();
            string sql = "SELECT a.* FROM app_menu a " +
                    "LEFT JOIN app_menu_modules b ON a.id = b.menu_id " +
                    "LEFT JOIN app_modules c ON c.id = b.modules_id " +
                    "WHERE c.nama = @name";

            var list = this._menu.Menus.SqlQuery(
                sql,
                new MySqlParameter("name".ToLower(), Auth.Libraries.Init.ModuleName.ToLower())
            )
            .Where(s => s.pri_id == RoleId)
            .Where(s => s.parent_id == 0)
            .ToList()
            .Select(s => new {
                menux = s,
                submenu = _menu.Menus
                            .Where(x => x.parent_id == s.id)
                            .Where(x => x.is_active == true)
                            .Where(x => x.menu.ToLower().Contains(src.ToLower()))
                            .OrderBy(c => c.urut).ToList()
                       
            });
          



            return Json(new { rows = list.Select(s => new { s.menux, s.submenu }) }, JsonRequestBehavior.AllowGet);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                _menu.Dispose();
            }
            base.Dispose(disposing);
        }

    }
}