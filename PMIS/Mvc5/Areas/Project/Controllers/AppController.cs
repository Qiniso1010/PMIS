using Mvc5.ActionFilters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Mvc5.Areas.Auth.Libraries;
using Mvc5.Libraries;
using Mvc5.Areas.Auth.Context;

namespace Mvc5.Areas.Project.Controllers
{
    public class AppController : Controller
    {
        private MemberContext db = new MemberContext();
        // GET: Project/App
        [AuthFilter]
        public ActionResult Index()
        {
            string Username = Utilities.ToUpperFirstLetter(Areas.Auth.Libraries.Auth.GetUserName()).ToString();
            string UnitName = Areas.Auth.Libraries.Auth.GetUnitName().ToString();
            int UnitId = Areas.Auth.Libraries.Auth.GetUnitId();
            int ParentUnitId = Areas.Auth.Libraries.Auth.GetParentUnitId();

            string UserId = Areas.Auth.Libraries.Auth.GetUserId();

            ViewBag.Title = "Application - " + Areas.Auth.Libraries.Init.AppName;
            ViewBag.Username = Username;
            ViewBag.UnitName = UnitName;
            ViewBag.TagLine = Areas.Auth.Libraries.Init.TagLine;

            Session["UnitName"] = UnitName;
            Session["Username"] = Username;
            Session["UnitId"] = ParentUnitId.ToString(); //UnitId.ToString();
            Session["UserId"] = UserId;

            int UserIdx = Convert.ToInt32(UserId);
            var user = db.Users.Find(UserIdx);

            Session["SuperAdmin"] = Areas.Auth.Libraries.Auth.GetIsAdmin();
            Session["IsSupervisor"] = db.UserKas.Where(s => s.UnitId == user.unit_id).FirstOrDefault() != null ? db.UserKas.Where(s => s.UnitId == user.unit_id).FirstOrDefault().IsSet.ToString() : null;//Areas.Auth.Libraries.Auth.IsSupervisor().ToString();
           

            ViewBag.IsSupervisor = Session["IsSupervisor"];
            ViewBag.IsDefault = Session["SuperAdmin"];

            return View();
        }
    }
}