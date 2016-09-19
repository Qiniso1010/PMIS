using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mvc5.Areas.Project.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Project/Default
        public ActionResult Index()
        {
            return View();
        }

        // GET: Project/Default/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Project/Default/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Project/Default/Create
        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Project/Default/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Project/Default/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Project/Default/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Project/Default/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
