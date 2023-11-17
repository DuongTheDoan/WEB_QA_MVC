using Microsoft.AspNetCore.Mvc;
using BCrypt.Net;
using Project.Areas.Admin.Attributes;
namespace Project.Areas.Admin.Controllers
{
    // phải đặt tag sau trong controller của admin
    [Area("Admin")]

    [CheckLogin]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
              return View();
           // string pass = BCrypt.Net.BCrypt.HashPassword("123456");
           // return Content(pass);
        }
    }
}
