using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using galeria.Models;
namespace galeria.Controllers
{
    public class GaleriaController : Controller
    {
        //
        // GET: /Galeria/

        public ActionResult Index()
        {
            DataClasses1DataContext db =
                new DataClasses1DataContext();
            ViewBag.lista = db.imagenes.ToList();
            return View();
        }

    }
}
