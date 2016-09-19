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
using Mvc5.Libraries;

namespace Mvc5.Areas.Project.Controllers
{
    public class CommentsController : Controller
    {
        private ProjectContext db = new ProjectContext();

        private string Attr;
        private string Message;

        // GET: Project/Comments
        [AuthFilter]
        [HttpGet]
        public JsonResult Index(int TasksId)
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            var comment = db.Comments
                       .Where(s => s.TasksId == TasksId)
                       .ToList()
                       .Select(s => new {
                           CommentText = s.CommentText,
                           Name = s.CreatedBy,
                           CreatedAt = s.CreatedAt,
                           UserId = s.UserId,
                           IsUser = (s.UserId != UserId ? false : true)
                       })
                       .OrderBy(s => s.CreatedAt);
            return Json(new { Rows = comment },JsonRequestBehavior.AllowGet);
        }

      
        // POST: Project/Comments/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateInput(false)]
        [AuthFilter]
        public async Task<ActionResult> Create([Bind(Include = "TasksId,CommentText")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                var m = new Comment();
                m.CommentText = Utilities.filterText(comment.CommentText);
                m.CreatedAt = DateTime.Now;
                m.CreatedBy = Session["UserName"].ToString();
                m.TasksId = comment.TasksId;
                m.UserId = Convert.ToInt32(Session["UserId"]);
                
                db.Comments.Add(m);
                await db.SaveChangesAsync();
                
                Attr = "Ok!";
                Message = "Send!";
            }

            return Json(new {Attr=Attr,Message=Message});
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
