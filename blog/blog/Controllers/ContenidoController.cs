using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using blog.Models;
namespace blog.Controllers
{
    public class ContenidoController : Controller
    {
        //
        // GET: /Contenido/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Registrar() 
        {
            ConectorDataContext db = new ConectorDataContext();
            ViewBag.id=db.usuarios.OrderByDescending(a => a.id).First().id;
            return View();
        }
        [HttpPost]
        public ActionResult Registrar(contenido aa) 
        {
            
            if(ModelState.IsValid)
            {
                ConectorDataContext db = new ConectorDataContext();
                aa.fecha = DateTime.Now;
                aa.idUs = Convert.ToInt32(aa.idUs);
                db.contenidos.InsertOnSubmit(aa);
                db.SubmitChanges();
                return RedirectToAction("articulos","Contenido");
            }
            return View();
        }
        public ActionResult articulos()
        {
            ConectorDataContext db = new ConectorDataContext();
            List<Publicaciones> lista = db.contenidos.
                OrderByDescending(a => a.id).
                Where(a => a.idUs == a.usuario.id).
                Select(a => new Publicaciones() 
                {nickname=a.usuario.nickname,
                    email=a.usuario.email,
                    idC=a.id,content=a.content,
                    fecha=a.fecha}).ToList();
            ViewBag.lista = lista;
            return View();
        }
        public JsonResult publicarcomentarios(comentario cc) 
        {
            cc.fecha = DateTime.Now;
            cc.idUs = 1;
            
            ConectorDataContext db = new ConectorDataContext();
            db.comentarios.InsertOnSubmit(cc);
            db.SubmitChanges();
            rendercomentario obj = new rendercomentario() 
            {
                nickname=db.usuarios.Where(a=>a.id==cc.idUs).First().nickname,
                content=cc.content,
                fecha=cc.fecha.ToShortTimeString(),
                email = db.usuarios.Where(a => a.id == cc.idUs).First().email
            };
            return Json(new {data=obj});
        }
    }
}
