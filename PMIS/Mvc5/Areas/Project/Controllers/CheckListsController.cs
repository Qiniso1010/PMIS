using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Mvc5.Areas.Project.Context;
using Mvc5.Areas.Project.Models;
using Mvc5.ActionFilters;

namespace Mvc5.Areas.Project.Controllers
{
    public class CheckListsController : Controller
    {
        private ProjectContext db = new ProjectContext();
        private string Attr;
        private string Message;

        // GET: Project/CheckLists
        [NonAction]
        public async Task<ActionResult> Index()
        {
            return View(await db.CheckLists.ToListAsync());
        }

        // GET: Project/CheckLists/Details/5
        [AuthFilter]
        [HttpGet]
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CheckList checkList = await db.CheckLists.FindAsync(id);
            if (checkList == null)
            {
                return HttpNotFound();
            }
            return Json(new {Rows = checkList},JsonRequestBehavior.AllowGet);
        }


        // POST: Project/CheckLists/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,TasksId,Name,IsComplete,CreatedAt,CreatedBy")] CheckList checkList)
        {
            if (ModelState.IsValid)
            {
                db.CheckLists.Add(checkList);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(checkList);
        }
        

        // POST: Project/CheckLists/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AuthFilter]
        [ValidateInput(false)]
        public async Task<ActionResult> Edit([Bind(Include = "Id,TasksId,Name,Keterangan")] CheckList checkList)
        {
            if (ModelState.IsValid)
            {
                var m = await db.CheckLists.FindAsync(checkList.Id);
                m.Keterangan = checkList.Keterangan;
                m.Name = checkList.Name;
                m.CreatedBy = Session["UserName"].ToString();

                db.Entry(m).State = EntityState.Modified;
                await db.SaveChangesAsync();

                Attr = "Ok!";
                Message = "Edit Project Successfully.";
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
