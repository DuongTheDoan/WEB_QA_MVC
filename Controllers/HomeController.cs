using Microsoft.AspNetCore.Mvc;

namespace Project.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
             return View();
            //di  chuyeển đén trang admin
            //return Redirect("/Admin");
        }
    }
}
