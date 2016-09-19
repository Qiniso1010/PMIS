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
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;

namespace Mvc5.Areas.Project.Controllers
{
    public class FilesController : Controller
    {
        private ProjectContext db = new ProjectContext();

        private string Attr;
        private string Message;

        // GET: Project/Files
        [HttpGet]
        [AuthFilter]
        public async Task<ActionResult> Index(int TasksId,string key)
        {
            if (!String.IsNullOrEmpty(key))
            {
                var file = await db.Files
                        .Where(s => s.TasksId == TasksId)
                        .Where(s => s.Tipe == "LAMPIRAN")
                        .Where(s => s.RealName.ToLower().Contains(key.ToLower()) || s.Name.ToLower().Contains(key.ToLower()))
                        .OrderByDescending(s => s.CreatedAt)
                        .ToListAsync();

                return Json(new { Rows = file }, JsonRequestBehavior.AllowGet);
            }
            else
            {
                var file = await db.Files
                        .Where(s => s.TasksId == TasksId)
                        .Where(s => s.Tipe == "LAMPIRAN")
                        .OrderByDescending(s => s.CreatedAt)
                        .ToListAsync();

                return Json(new { Rows = file }, JsonRequestBehavior.AllowGet);
            }
            
        }

        // GET : Image Parent Project
        [HttpGet]
        [AuthFilter]
        public async Task<ActionResult> IndexProjectImage(int TasksId)
        {
            var file = await db.Files
                        .Where(s => s.TasksId == TasksId)
                        .Where(s => s.Tipe == "IMAGE")
                        .OrderByDescending(s => s.CreatedAt)
                        .ToListAsync();
            return Json(new { Rows = file }, JsonRequestBehavior.AllowGet);
        }

        // GET : Image Child Project
        [HttpGet]
        [AuthFilter]
        public async Task<ActionResult> IndexCheckListImage(int CheckListId)
        {
            var file = await db.Files
                        .Where(s => s.CheckListId == CheckListId)
                        .Where(s => s.Tipe == "IMAGE")
                        .OrderByDescending(s => s.CreatedAt)
                        .ToListAsync();
            return Json(new { Rows = file }, JsonRequestBehavior.AllowGet);
        }

        // UPLOAD LAMPIRAN
        [HttpPost]
        [AuthFilter]
        public virtual ActionResult Uploads(string name, int TasksId)
        {

            string FixedName;
            string FileSize;
            string FileExt;
            string Ext;
            string NewName;


            HttpPostedFileBase myFile = Request.Files["file"];
            if (!String.IsNullOrEmpty(name))
            {

                string Name = Utilities.FriendlyString(name);
            }
            else
            {

                string Name = Utilities.FriendlyString(myFile.FileName);
            }

            string Message = "File upload failed";

            if (myFile != null && myFile.ContentLength != 0)
            {
                string pathForSaving = Server.MapPath("~/Uploads/");
                if (Utilities.CreateFolderIfNeeded(pathForSaving))
                {
                    try
                    {
                        FileSize = Convert.ToString(myFile.ContentLength);
                        FileExt = Convert.ToString(myFile.ContentType);
                        Ext = Path.GetExtension(myFile.FileName);
                        NewName = Utilities.FriendlyString(myFile.FileName);

                        FixedName = String.Format("{0}-{1}{2}", NewName.Replace(Ext, ""), Path.GetRandomFileName(), Ext);


                        myFile.SaveAs(Path.Combine(pathForSaving, FixedName));

                        // insert database
                        this.createLampiran(FixedName, pathForSaving, FileExt, TasksId, myFile.FileName);

                        Attr = "Ok!";
                        Message = "File uploaded successfully!";
                    }
                    catch (Exception ex)
                    {
                        Attr = "Error!";
                        Message = string.Format("File upload failed: {0}", ex.ToString());
                    }
                }
            }
            return Json(new { Attr = "Ok!", Message = "Upload Berhasil" });
        }

        // POST : Upload Image 
        [HttpPost]
        [AuthFilter]
        public virtual ActionResult UploadImage(int TasksId,int CheckListId)
        {

            string FixedName;
            string FileSize;
            string FileExt;
            string Ext;


            HttpPostedFileBase myFile = Request.Files["file"];
            string Name = Utilities.FriendlyString(myFile.FileName);

            string Message = "File upload failed";

            if (myFile != null && myFile.ContentLength != 0)
            {
                string pathForSaving = Server.MapPath("~/Uploads/");
                if (Utilities.CreateFolderIfNeeded(pathForSaving))
                {
                    try
                    {
                        FileSize = Convert.ToString(myFile.ContentLength);
                        FileExt = Convert.ToString(myFile.ContentType);
                        Ext = Path.GetExtension(myFile.FileName);

                        FixedName = String.Format("{0}{1}", Path.GetRandomFileName(), myFile.FileName);

                        var saveImage = Path.Combine(pathForSaving, FixedName);

                        myFile.SaveAs(saveImage);


                        // Thumb
                        string NewName = String.Format("{0}{1}{2}",FixedName.Replace(Ext, ""),"_Thumb",Ext);
                        string large_image = String.Format("{0}{1}", FixedName.Replace(Ext, ""), Ext);
                        // insert database
                        this.createImage(large_image, NewName, pathForSaving, FileExt, TasksId, CheckListId);


                        using (var image = Image.FromFile(saveImage))
                        using (var newImage = Utilities.ScaleImage(image, 300, 300))
                        {
                            switch (Ext)
                            {
                                case ".png":
                                    newImage.Save(pathForSaving + NewName, ImageFormat.Png);
                                    break;
                                case ".jpg":
                                    newImage.Save(pathForSaving + NewName, ImageFormat.Jpeg);
                                    break;
                                case ".jpeg":
                                    newImage.Save(pathForSaving + NewName, ImageFormat.Jpeg);
                                    break;
                                case ".gif":
                                    newImage.Save(pathForSaving + NewName, ImageFormat.Gif);
                                    break;
                                case ".bmp":
                                    newImage.Save(pathForSaving + NewName, ImageFormat.Bmp);
                                    break;
                            }

                        }


                        using (var image = Image.FromFile(saveImage))
                        using (var newImage = Utilities.ScaleImage(image, 600, 600))
                        {
                            switch (Ext)
                            {
                                case ".png":
                                    newImage.Save(pathForSaving + large_image, ImageFormat.Png);
                                    break;
                                case ".jpg":
                                    newImage.Save(pathForSaving + large_image, ImageFormat.Jpeg);
                                    break;
                                case ".jpeg":
                                    newImage.Save(pathForSaving + large_image, ImageFormat.Jpeg);
                                    break;
                                case ".gif":
                                    newImage.Save(pathForSaving + large_image, ImageFormat.Gif);
                                    break;
                                case ".bmp":
                                    newImage.Save(pathForSaving + large_image, ImageFormat.Bmp);
                                    break;
                            }

                        }

                       

                        Attr = "Ok!";
                        Message = "File uploaded successfully!";
                    }
                    catch (Exception ex)
                    {
                        Attr = "Error!";
                        Message = string.Format("File upload failed: {0}", ex.ToString());
                    }
                }
            }
            return Json(new { Attr = "Ok!", Message = "Upload Berhasil" });
        }


        // POST : Upload From Editor
        [HttpPost]
        [AuthFilter]
        public virtual ActionResult UploadSummernote()
        {

            string FixedName;
            string FileSize;
            string FileExt;
            string Ext;
            string NewName;


            HttpPostedFileBase myFile = Request.Files["file"];
            string Name = Utilities.FriendlyString(myFile.FileName);

            string Message = "File upload failed";

            if (myFile != null && myFile.ContentLength != 0)
            {
                string pathForSaving = Server.MapPath("~/Uploads/");
                if (Utilities.CreateFolderIfNeeded(pathForSaving))
                {
                    try
                    {
                        FileSize = Convert.ToString(myFile.ContentLength);
                        FileExt = Convert.ToString(myFile.ContentType);
                        Ext = Path.GetExtension(myFile.FileName);
                        NewName = Utilities.FriendlyString(myFile.FileName);

                        FixedName = String.Format("{0}-{1}{2}", myFile.FileName.Replace(Ext,""), Path.GetRandomFileName(),Ext);


                        myFile.SaveAs(Path.Combine(pathForSaving, FixedName));


                        Attr = "Ok!";
                        Message = String.Format("{0}{1}","/Uploads/",FixedName);
                    }
                    catch (Exception ex)
                    {
                        Attr = "Error!";
                        Message = string.Format("File upload failed: {0}", ex.ToString());
                    }
                }
            }
            return Json(new { Attr = "Ok!", Message = Message });
        }

        // GET: Project/Files/Create
        [NonAction]
        [AuthFilter]
        protected void createLampiran(string name,string path, string ext,int TasksId,string realName)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    
                    var m = new Project.Models.File();
                    m.Name = name.ToString();
                    m.RealName = Utilities.ToUpperFirstLetter(realName.ToString());
                    m.FullPath = path;
                    m.ext = ext;
                    m.TasksId = TasksId;
                    m.CreatedAt = DateTime.Now;
                    m.CreatedBy = Session["UserName"].ToString();
                    m.Tipe = "LAMPIRAN";
                    m.UnitId = Convert.ToInt32(Session["UnitId"]);

                    db.Files.Add(m);
                    db.SaveChanges();

                   
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }

        // POST : Create Image
        [NonAction]
        [AuthFilter]
        protected void createImage(string large_image,string thumb, string path, string ext, int TasksId,int CheckListId)
        {
            try
            {
                if (ModelState.IsValid)
                {

                    var m = new Project.Models.File();
                    m.Thumb = thumb.ToString();
                    m.Name = large_image.ToString();
                    m.FullPath = path;
                    m.ext = ext;
                    m.TasksId = TasksId;
                    m.CheckListId = CheckListId;
                    m.CreatedAt = DateTime.Now;
                    m.CreatedBy = Session["UserName"].ToString();
                    m.Tipe = "IMAGE";
                    m.UnitId = Convert.ToInt32(Session["UnitId"]);

                    db.Files.Add(m);
                    db.SaveChanges();


                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }

        
        // POST: Project/Files/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Delete(int id)
        {
            Project.Models.File file = await db.Files.FindAsync(id);
            var thumb_path = String.Format("{0}{1}",file.FullPath,file.Thumb);
            var full_path = String.Format("{0}{1}", file.FullPath, file.Name);

            Utilities.DeleteFile(thumb_path);
            Utilities.DeleteFile(full_path);

            db.Files.Remove(file);
            await db.SaveChangesAsync();

            Attr = "Ok!";
            Message = "Delete Berhasil.";

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
