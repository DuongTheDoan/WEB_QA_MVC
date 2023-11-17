using Microsoft.AspNetCore.Mvc;


using Project.Models;
using X.PagedList;

namespace Project.Controllers
{
    public class NewsController : Controller
    {
        public MyDbContext db = new MyDbContext();
        //detail
        public IActionResult Detail(int id)
        {
            var record = db.News.Where(item => item.Id == id).FirstOrDefault();
            return View("NewsDetail", record);
        }
    }
}
