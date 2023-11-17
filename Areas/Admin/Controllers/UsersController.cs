using Microsoft.AspNetCore.Mvc;
using Project.Models;
using BC = BCrypt.Net.BCrypt;
using X.PagedList;

namespace Project.Areas.Admin.Controllers
{

    [Area("Admin")]
    public class UsersController : Controller
    {
         public MyDbContext db = new MyDbContext();
        public IActionResult Index()
        {
            return Redirect("/Admin/Users/Read");
        }
        public IActionResult Read(int? page)
            
        {
            // so ban ghi tren mot trang 
            int pageSize = 4;
            int pageNumber = page ?? 1;
           List<ItemUser> users = db.Users.OrderByDescending(item=>item.Id).ToList();
            return View("Read",users.ToPagedList(pageNumber,pageSize));
        }
      
        public IActionResult Delete(int id) 
        {

            ItemUser record = 
                db.Users.FirstOrDefault(item => item.Id == id);
            if (record != null) 
            {
                db.Users.Remove(record);
                db.SaveChanges();
            }
            return Redirect("/Admin/Users/Read");
        }
         public IActionResult Update(int id)
        {
            //tạo biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Users/UpdatePost/" + id;
            //lay một bản ghi tương ứng với id truyền vào
            ItemUser record = db.Users.FirstOrDefault(item => item.Id == id);

            return View("CreateUpdate", record);
        }
        //update - sau khi ấn nút submit
        [HttpPost]
        public IActionResult UpdatePost(int id, IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            string _Email = fc["Email"].ToString().Trim();
            string _Password = fc["Password"].ToString();
            //lay một bản ghi tương ứng với id truyền vào
            ItemUser record = db.Users.FirstOrDefault(item => item.Id == id );
            if (record != null)
            {  
                // kiem tra xem email nay da ton tai torng table users chua neu chua thi moi cho update
                ItemUser record_check = db.Users.FirstOrDefault
                    (item => item.Id !=
                    id && item.Email == _Email);
                if (record_check == null)
                {

                    record.Name = _Name;
                    record.Email = _Email;
                   
                    // neu nhu pass word khong eong thi up date password 
                    if(!String.IsNullOrEmpty(_Password))
                    {
                        //ma hoa passs 
                        _Password = BC.HashPassword(_Password);
                        record.Password = _Password;
                    }
                    //cập nhật lại dữ liệu
                    db.Update(record);
                    db.SaveChanges();
                }
                else
                    return Redirect("/Admin/Users/Update/" + id + 
                        "?notify=email-exists");
            }
            return Redirect("/Admin/Users/Read");
        }
        public IActionResult Create()
        {
            //taoj biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Users/CreatePost/";
            return View("CreateUpdate");
        }
        [HttpPost]
        public IActionResult CreatePost(IFormCollection fc)
        {
            string _Name = fc["Name"].ToString().Trim();
            string _Email = fc["Email"].ToString().Trim();
            string _Password = fc["Password"].ToString();
            //max hoa password
            _Password = BC.HashPassword(_Password);
            //Kieemr tra trong csdl da ton tai email chua, neu chua thi moi update
            ItemUser record_check = db.Users.FirstOrDefault(item =>
            item.Email == _Email);
            if (record_check == null)
            {
                ItemUser record = new ItemUser();
                record.Name = _Name;
                record.Email = _Email;
                record.Password = _Password;
                //capaj nhat lai csdl
                db.Update(record);
                db.SaveChanges();
            }
            else
                return Redirect("/Admin/Users/Update/?notify=email-exists");
            return Redirect("/Admin/Users/Read");
        }
    }
}
