using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mvc5.Areas.Auth.Controllers
{
    public class DefaultController : Controller
    {
        // GET: Auth/Default
        public ActionResult Index()
        {
            return View();
        }

        // GET: Auth/Default/Details/5
        public ActionResult Details(int id)
        {
            return View();
        }

        // GET: Auth/Default/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Auth/Default/Create
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

        // GET: Auth/Default/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Auth/Default/Edit/5
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

        // GET: Auth/Default/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Auth/Default/Delete/5
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
