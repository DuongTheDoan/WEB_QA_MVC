using Microsoft.AspNetCore.Mvc;

namespace Project.Controllers
{
    public class WishListController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
