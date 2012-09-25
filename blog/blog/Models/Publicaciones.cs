using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace blog.Models
{
    public class Publicaciones
    {
        public string nickname { set; get; }
        public string email { set; get; }
        public int idC { set; get; }
        public string content { set; get; }
        public DateTime fecha { set; get; }
    }
    public class rendercomentario 
    {
        public string nickname { set; get; }
        public string email { set; get; }
        public string content { set; get; }
        public string fecha { set; get; }    
    }
}