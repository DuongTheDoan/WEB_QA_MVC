using Microsoft.AspNetCore.Mvc;
using Project.Models;
using X.PagedList;
using System.Data;

using System.Text.Json;
using Microsoft.Data.SqlClient;//SqlConnection, DataADapter, DataSet, DataCommand
using Project.Areas.Admin.Attributes;//dder nhin thay file CheckLogin.cs

using Project.Models;

namespace project.Areas.Admin.Controllers
{
    //trong Area ADmin phair co tag sau
    [Area("Admin")]
    [CheckLogin]
    public class CategoriesController : Controller
    {
        //Tao bien luu chuoi ket noi
        string strConnectionString;
        //Định nghĩa hàm tạo là hàm sẽ tự động được triệu gọi khi class này hoạt động
        public CategoriesController()
        {
            var config = new ConfigurationBuilder().SetBasePath(Directory.GetCurrentDirectory()).AddJsonFile("appsettings.json").Build();
            this.strConnectionString = config.GetConnectionString("MyConnectionString").ToString();
        }
        public IActionResult Index()
        {
            return Redirect("/Admin/Categories/Read");
        }
        public IActionResult Read(int? page)
        {
            //Suwr dung ADO  để truyền câu truy vấn SQL và lấy kết quả trả về
            //TẠo đối tượng DataTable để đổ dữ liệu từ kết quả truy vấn
            DataTable dtCategories = new DataTable();
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                //Taoj ddoi tuong DataAdapter de truyen cau lenh Sql va lay ket qua tra ve
                SqlDataAdapter da = new SqlDataAdapter("select * from Categories where ParentID = 0 order by Id desc", conn);
                //Fill dữ liệu từ da vào DataTable
                da.Fill(dtCategories);
            }
            //-----
            //do thư viện X.PagedList sử dụng List để phân trang, vì vậy cần chuyển đổi DataTable có tên là dtCategories sang List
            //Tạo đối tương List để lưu dữ liệu từ dtCategories chueyeern sang
            List<ItemCategory> listCategory = new List<ItemCategory>();
            //duyệt các row của dtCategories và tạo các row List để add vào List
            foreach (DataRow item in dtCategories.Rows)
            {
                listCategory.Add(new ItemCategory() { Id = Convert.ToInt32(item["id"]), ParentId = Convert.ToInt32(item["ParentId"]), Name = item["Name"].ToString() });
            }
            int pageSize = 4;
            int pageNumber = page ?? 1;
            return View("Read", listCategory.ToPagedList(pageNumber, pageSize));
        }
        //update
        public IActionResult Update(int id)
        {
            //tạo biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Categories/UpdatePost/" + id;
            //tao doi tuong data table de fill du lieu tu dataAdapter 
            DataTable dtCategory = new DataTable();
            // tao doi tuong data row la mot doi tuong trong data table de lay mot ban ghi 
            //lay một bản ghi tương ứng với id truyền vào
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                SqlDataAdapter da = new SqlDataAdapter("select*from Categories where Id = " + id, conn);
                // fill du lieu t da vao dt category
                da.Fill(dtCategory);
            }
            // ban chat cua dt category la mot table chua 1 row( do truy van o tren chi tra ve 1 row 
            return View("CreateUpdate", dtCategory);
        }
        //update - sau khi ấn nút submit
        [HttpPost]
        public IActionResult UpdatePost(int id, IFormCollection fc)
        {
            // su dung doi tuong i form 
            string _Name = fc["Name"].ToString().Trim();
            // su dung doi tuong request
            int _ParentId = Convert.ToInt32(Request.Form["ParentId"]);
            int _DisplayHomePage = !String.IsNullOrEmpty(Request.Form["DisplayHomePage"]) ? 1 : 0;
            //---
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("update Categories set Name=@var_name, ParentId = @var_parent_id, DisplayHomePage =@dis_play_home_page where Id = @id", conn);
                cmd.Parameters.AddWithValue("@var_name", _Name);
                cmd.Parameters.AddWithValue("@var_parent_id", _ParentId);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@dis_play_home_page", _DisplayHomePage);
                cmd.ExecuteNonQuery();
            }
            //---
            return Redirect("/Admin/Categories/Read");
        }
        public IActionResult Create()
        {
            //taoj biến action để đưa vào thuộc tính action của thẻ form
            ViewBag.action = "/Admin/Categories/CreatePost/";
            return View("CreateUpdate");
        }
        [HttpPost]
        public IActionResult CreatePost(IFormCollection fc)
        {
            //su dung doi tuong IFormCollection de lay du lieu theo kieu POST
            string _Name = fc["Name"].ToString().Trim();
            //su dung doi tuong Request de lay du lieu theo kieu POST
            int _ParentId = Convert.ToInt32(Request.Form["ParentId"]);
            int _DisplayHomePage = !String.IsNullOrEmpty(Request.Form["DisplayHomePage"]) ? 1 : 0;
            //---
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                //chu y: voi Update, Create phai Open connection
                conn.Open();
                SqlCommand cmd = new SqlCommand("insert into Categories(Name,ParentId,DisplayHomePage) values(@var_name,@var_parent_id,@display_home_page)", conn);
                //truyen cac gia tri vao chuoi truy van
                cmd.Parameters.AddWithValue("@var_name", _Name);
                cmd.Parameters.AddWithValue("@var_parent_id", _ParentId);
                cmd.Parameters.AddWithValue("@display_home_page", _DisplayHomePage);
                //thuc thi cau truy van
                cmd.ExecuteNonQuery();
            }
            //---
            return Redirect("/Admin/Categories/Read");
        }
        //delete
        public IActionResult Delete(int id)
        {
            //---
            using (SqlConnection conn = new SqlConnection(strConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("delete Categories  where Id = @id or ParentId = @id", conn);

                cmd.Parameters.AddWithValue("@id", id);

                cmd.ExecuteNonQuery();
            }
            //---

            return Redirect("/Admin/Categories/Read");
        }
    }
}