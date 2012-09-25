using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using blog.Models;
namespace blog.Controllers
{
    public class UsuarioController : Controller
    {
        //
        // GET: /Usuario/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Registrar() 
        {

            return View();
        }
        [HttpPost]
        public ActionResult Registrar(usuario newuser, string repass) 
        {
            if(ModelState.IsValid)
            {
                ConectorDataContext db = new ConectorDataContext();
                newuser.fecha = DateTime.Now;
                db.usuarios.InsertOnSubmit(newuser);
                db.SubmitChanges();
                return RedirectToAction("exito","Usuario");
            }
            return View();
        }
        public ActionResult exito() 
        {
            return View();
        }
    }
}
