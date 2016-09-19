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
using Mvc5.Areas.Auth.Context;
using Mvc5.Libraries;

namespace Mvc5.Areas.Project.Controllers
{
    public class TasksController : Controller
    {
        private ProjectContext db = new ProjectContext();
        private MemberContext _member = new MemberContext();

        private string Attr;
        private string Message;

        // GET: Project/Tasks
        [AuthFilter]
        [HttpGet]
        public ActionResult Index(string order, string search, string limit, string offset, string sort)
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            int UnitId = Convert.ToInt32(Session["UnitId"]);
            var tugas = db.Taskss
                        .Where(s => s.UnitId == UnitId)
                        .ToList()
                        .Select(s => new {
                            NameAndId = String.Format("{0}|{1}|{2}|{3}", s.Id, Utilities.ToUpperFirstLetter(s.Name), s.IsComplete, this.getImageThumb(s.Id)),
                            CreatedAt = s.CreatedAt,
                            IsComplete = s.IsComplete,
                            CreatedBy = String.Format("{0}|{1}|{2}|{3}|{4}|{5}", s.Id, s.IsComplete, s.CreatedBy, s.CreatedAt, this.__get_checklist(s.Id).ToString(),this.getFileCount(s.Id).ToString()),
                            Name = s.Name
                        });
            switch (order)
            {
                case "desc":
                    if (!string.IsNullOrEmpty(sort))
                    {
                        if (sort == "CreatedAt")
                        {
                            tugas = tugas.OrderByDescending(s => s.CreatedAt);
                        }
                        else if (sort == "NameAndId")
                        {
                            tugas = tugas.OrderByDescending(s => s.Name);
                        }

                    }
                    else
                    {
                        tugas = tugas.OrderByDescending(s => s.Name);
                    }

                    break;
                default:
                    tugas = tugas.OrderBy(s => s.Name);
                    break;
            }
            if (!String.IsNullOrEmpty(search))
            {
                tugas = tugas.Where(s => s.Name.ToLower().Contains(search.ToLower()) || s.CreatedBy.ToLower().Contains(search.ToLower()));
            }
            tugas = tugas.OrderBy(s => s.Name);

            return Json(new
            {
                rows = tugas.Skip(Convert.ToInt16(offset)).Take(Convert.ToInt16(limit)),
                total = tugas.Count()
            }, JsonRequestBehavior.AllowGet);
        }

        

       

        // GET: Project/Tasks/Details/5
        [HttpGet]
        [AuthFilter]
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tasks tasks = await db.Taskss.FindAsync(id);
            
            var files = db.Files.Where(s => s.TasksId == tasks.Id).ToList();
            var images = db.Files.Where(s => s.TasksId == tasks.Id)
                            .Where(s => s.Tipe == "IMAGE")
                            .OrderByDescending(s => s.CreatedAt)
                            .FirstOrDefault();

            var images_hitung = db.Files.Where(s => s.TasksId == tasks.Id)
                   .Where(s => s.Tipe == "IMAGE")
                   .OrderByDescending(s => s.CreatedAt)
                   .ToList()
                   .Count();


            if (files != null)
            {
                files = files.ToList();
            }
            else
            {
                files = null;
            }

            if (tasks == null)
            {
                return HttpNotFound();
            }
            return Json(new { Rows = tasks, files = files, images = images, images_hitung = images_hitung }, JsonRequestBehavior.AllowGet);
        }

       
        // GET : Check List
        [AuthFilter]
        [HttpGet]
        public ActionResult CheckListIndex(int id,string order, string search, string limit, string offset, string sort)
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            int UnitId = Convert.ToInt32(Session["UnitId"]);

            var tugas = db.CheckLists
                        .Where(s => s.TasksId == id)
                        .Where(s => s.UnitId == UnitId)
                        .ToList()
                        .Select(s => new
                        {
                            NameAndId = String.Format("{0}|{1}|{2}|{3}", s.Id, Utilities.ToUpperFirstLetter(s.Name), s.IsComplete, this.getImageThumbCheckList(s.Id)),
                            CreatedAt = s.CreatedAt,
                            IsComplete = s.IsComplete,
                            CreatedBy = String.Format("{0}|{1}|{2}|{3}", s.Id, s.IsComplete, s.CreatedBy, s.CreatedAt),
                            Name = s.Name
                        });
            switch (order)
            {
                case "desc":
                    if (!string.IsNullOrEmpty(sort))
                    {
                        if (sort == "CreatedAt")
                        {
                            tugas = tugas.OrderByDescending(s => s.CreatedAt);
                        }
                        else if (sort == "NameAndId")
                        {
                            tugas = tugas.OrderByDescending(s => s.Name);
                        }

                    }
                    else
                    {
                        tugas = tugas.OrderByDescending(s => s.Name);
                    }

                    break;
                default:
                    tugas = tugas.OrderBy(s => s.Name);
                    break;
            }
            if (!String.IsNullOrEmpty(search))
            {
                tugas = tugas.Where(s => s.Name.ToLower().Contains(search.ToLower()) || s.CreatedBy.ToLower().Contains(search.ToLower()));
            }



            return Json(new
            {
                rows = tugas.Skip(Convert.ToInt16(offset)).Take(Convert.ToInt16(limit)),
                total = tugas.Count()
            }, JsonRequestBehavior.AllowGet);
        }

        // GET: Project Search
        [HttpGet]
        [AuthFilter]
        public JsonResult SearchProjects(string key)
        {
            int UserId = Convert.ToInt32(Session["UserId"]);
            int UnitId = Convert.ToInt32(Session["UnitId"]);
            var project = db.CheckLists
                      .Where(s => s.UnitId == UnitId)
                      .ToList()
                       .Select(s => new
                       {
                           Id = s.Id,
                           CreatedAt = s.CreatedAt,
                           Name = s.Name,
                           ProjectName = this.getNameProjectById(s.TasksId).ToString(),
                           CreatedBy = s.CreatedBy
                       });

            var file = db.Files
                       .Where(s => s.Tipe == "LAMPIRAN")
                       .Where(s => s.UnitId == UnitId)
                       .ToList()
                       .Select(s => new
                       {
                           Name = s.Name,
                           RealName = s.RealName,
                           ProjectName = this.getNameProjectById(s.TasksId).ToString(),
                           CreatedAt = s.CreatedAt,
                           CreatedBy = s.CreatedBy
                       });
            if (!String.IsNullOrEmpty(key))
            {
                if (project != null)
                {
                    project = project.Where(s => s.Name.ToLower().Contains(key.ToLower()));
                }
                if (file != null)
                {
                    file = file.Where(s => s.Name.ToLower().Contains(key.ToLower()));

                }
            }
            project = project.OrderBy(s => s.Name).ThenByDescending(s => s.CreatedAt);
            file = file.OrderBy(s => s.Name).ThenByDescending(s => s.CreatedAt);

            return Json(new
            {
                projects = project,
                files = file
            }, JsonRequestBehavior.AllowGet);
           
        }

        // POST: Project/Tasks/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AuthFilter]
        [ValidateInput(false)]
        public async Task<ActionResult> Create([Bind(Include = "Name,Keterangan")] Tasks tasks)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    string UserName = Session["UserName"].ToString();
                    int UnitId = Convert.ToInt32(Session["UnitId"]);
                    int UserId = Convert.ToInt32(Session["UserId"]);

                    var m = new Tasks();
                    m.Name = tasks.Name;
                    m.Keterangan = Utilities.filterText(tasks.Keterangan);
                    m.CreatedBy = UserName;
                    m.CreatedAt = DateTime.Now;
                    m.CreatedUnitBy = Session["UnitName"].ToString();
                    m.UserId = UserId;
                    m.Status = "new";
                    m.IsComplete = false;
                    m.IsActive = true;
                    m.SharedId = Guid.NewGuid().ToString();
                    m.UnitId = UnitId;

                    db.Taskss.Add(m);

                    await db.SaveChangesAsync();

                    Attr = "Ok!";
                    Message = "New Project Successfully To Adding On Database.";
                }
                catch (Exception ex)
                {
                    Attr = "Error!";
                    Message = String.Format("Error : {0}",ex.ToString());
                }
                
            }

            return Json(new { Attr = Attr, Message = Message });
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [AuthFilter]
        [ValidateInput(false)]
        public async Task<ActionResult> CheckListCreate([Bind(Include = "Name,TasksId,Keterangan")] CheckList tasks)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    string UserName = Session["UserName"].ToString();
                    int UnitId = Convert.ToInt32(Session["UnitId"]);
                    int UserId = Convert.ToInt32(Session["UserId"]);

                    var m = new CheckList();
                    m.Name = tasks.Name;
                    m.Keterangan = Utilities.filterText(tasks.Keterangan);
                    m.CreatedBy = UserName;
                    m.CreatedAt = DateTime.Now;
                    m.TasksId = tasks.TasksId; 
                    m.IsComplete = false;
                    m.UnitId = UnitId;
                    m.UserId = UserId;

                    db.CheckLists.Add(m);

                    await db.SaveChangesAsync();

                    Attr = "Ok!";
                    Message = "New Project Successfully To Adding On Database.";
                }
                catch (Exception ex)
                {
                    Attr = "Error!";
                    Message = String.Format("Error : {0}", ex.ToString());
                }

            }

            return Json(new { Attr = Attr, Message = Message });
        }

        [HttpPost]
        [AuthFilter]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> IsCompleteTask(int id)
        {
            bool IsCom;
            var task = db.Taskss.Find(id);
            if (task != null)
            {
                if (task.IsComplete == false)
                {
                    IsCom = true;
                }
                else
                {
                    IsCom = false;
                }

                task.IsComplete = IsCom;
                db.Entry(task).State = EntityState.Modified;
                await db.SaveChangesAsync();

                Attr = "Ok!";
                Message = "Successfully.";
            }

            return Json(new { Attr = Attr, Message = Message });
        }

        [HttpPost]
        [AuthFilter]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> IsCompleteCheckList(int id)
        {
            bool IsCom;
            var task = db.CheckLists.Find(id);
            if (task != null)
            {
                if (task.IsComplete == false)
                {
                    IsCom = true;
                }
                else
                {
                    IsCom = false;
                }

                task.IsComplete = IsCom;
                db.Entry(task).State = EntityState.Modified;
                await db.SaveChangesAsync();

                Attr = "Ok!";
                Message = "Successfully.";
            }

            return Json(new {Attr=Attr,Message=Message});
        }


        // POST: Project/Tasks/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AuthFilter]
        [ValidateInput(false)]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name,Keterangan")] Tasks tasks)
        {
            if (ModelState.IsValid)
            {
                var m = db.Taskss.Find(tasks.Id);
                m.Name = tasks.Name;
                m.Keterangan = Utilities.filterText(tasks.Keterangan);
                m.CreatedBy = Session["UserName"].ToString();
                m.CreatedUnitBy = Session["UnitName"].ToString();

                db.Entry(m).State = EntityState.Modified;
                await db.SaveChangesAsync();

                Attr = "Ok!";
                Message = "Edit Project Successfully.";
            }
            return Json(new { Attr = Attr,Message = Message });
        }

        // POST: Project/Tasks/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        [AuthFilter]
        public async Task<ActionResult> Delete(int id)
        {
            Tasks tasks = await db.Taskss.FindAsync(id);

            var checklist = db.CheckLists.Where(s => s.TasksId == tasks.Id).ToList();
            if (checklist != null)
            {
                foreach (var i in checklist) 
                {
                    db.CheckLists.Remove(i);
                    db.SaveChanges();    
                }
               
            }

            var comment = db.Comments.Where(s => s.TasksId == tasks.Id).ToList();
            if (comment != null)
            {
                foreach (var i in comment)
                {
                    db.Comments.Remove(i);
                    db.SaveChanges();
                }
            }

            var files = db.Files.Where(s => s.TasksId == tasks.Id).ToList();
            if (files != null)
            {
                foreach (var i in files)
                {
                    Utilities.DeleteFile(i.FullPath);
                    db.Files.Remove(i);
                }
            }



            db.Taskss.Remove(tasks);
            await db.SaveChangesAsync();

            Attr = "Ok!";
            Message = "Delete Project Successfully.";

            return Json(new {Attr = Attr,Message = Message});
        }

        // POST: Project/Tasks/Delete/5
        [HttpPost]
        [ValidateAntiForgeryToken]
        [AuthFilter]
        public async Task<ActionResult> CheckListDelete(int id)
        {
            CheckList tasks = await db.CheckLists.FindAsync(id);


            db.CheckLists.Remove(tasks);
            await db.SaveChangesAsync();

            Attr = "Ok!";
            Message = "Delete Project Successfully.";

            return Json(new { Attr = Attr, Message = Message });
        }

        // GET : Project Name
        protected string getNameProjectById(int id)
        {
            try
            {
                var project = db.Taskss.Find(id);
                if (project != null)
                {
                    return project.Name;
                }
                else
                {
                    return "-";
                }
            }
            catch (Exception ex)
            {
                return "-";
            }
            
        }

        [NonAction]
        private string getImageThumb(int id)
        {
            try
            {
                var images = db.Files.Where(s => s.TasksId == id)
                           .Where(s => s.Tipe == "IMAGE")
                           .OrderByDescending(s => s.CreatedAt)
                           .FirstOrDefault();
                if (images != null)
                {
                    return images.Thumb.ToString();
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        [NonAction]
        private string getImageThumbCheckList(int id)
        {
            try
            {
                var images = db.Files.Where(s => s.CheckListId == id)
                           .Where(s => s.Tipe == "IMAGE")
                           .OrderByDescending(s => s.CreatedAt)
                           .FirstOrDefault();
                if (images != null)
                {
                    return images.Thumb.ToString();
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {
                return null;
            }

        }

        [NonAction]
        protected int __get_checklist(int id)
        {
            try
            {
                var checklist = db.CheckLists
                                .Where(s => s.TasksId == id)
                                .Where(s => s.IsComplete == false)
                                .ToList();
                if (checklist != null)
                {
                    return checklist.Count();
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }

        }

        [NonAction]
        protected int getFileCount(int id)
        {
            try
            {
                var file = db.Files
                                .Where(s => s.TasksId == id)
                                .Where(s => s.Tipe == "LAMPIRAN")
                                .ToList();
                if (file != null)
                {
                    return file.Count();
                }
                else
                {
                    return 0;
                }
            }
            catch (Exception ex)
            {
                return 0;
            }

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
