using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Mvc5.Areas.Auth.Context;
using Mvc5.Areas.Auth.Models;
using Mvc5.ActionFilters;
using Mvc5.Libraries;

namespace Mvc5.Areas.Auth.Controllers
{
    public class UsersController : Controller
    {
        private MemberContext db = new MemberContext();
        private static string Attr;
        private static string Message;

        // GET: Auth/Users
        public async Task<ActionResult> Index()
        {
            return View(await db.Users.ToListAsync());
        }

        // GET : Check Current Password
        [AuthFilter]
        [HttpGet]
        public async Task<JsonResult> CheckCurrentPassword(string password)
        {
            try
            {
                int UserId = Convert.ToInt32(Session["UserId"]);

                var user = await db.Users.FindAsync(UserId);
                if (user != null)
                {
                    var pass = Secure.EncryptPassword(password);
                    if (user.password == pass.ToString())
                    {
                        Attr = "Ok!";
                        Message = "True";
                    }
                    else
                    {
                        Attr = "Error!";
                        Message = "False";
                    }
                }
                else
                {
                    Attr = "Error!";
                    Message = "False";
                }
            }
            catch (Exception ex)
            {
                Attr = "Error!";
                Message = "False";
            }

            return Json(new { Attr = Attr, Message = Message }, JsonRequestBehavior.AllowGet);
        }

      

       

        // POST: Auth/Users/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "password")] User user)
        {
            if (ModelState.IsValid)
            {
                int UserId = Convert.ToInt32(Session["UserId"]);

                var m = await db.Users.FindAsync(UserId);
                m.password = Secure.EncryptPassword(user.password);
                db.Entry(m).State = EntityState.Modified;

                await db.SaveChangesAsync();

                Attr = "Ok!";
                Message = "Update password berhasil.";


            }
            return Json(new { Attr = Attr, Message = Message });
        }

     


        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
