using Microsoft.AspNetCore.Mvc.Filters;
namespace Project.Areas.Admin.Attributes
{
    public class CheckLogin : ActionFilterAttribute //ke thua class ActionFilterAttribut
    {
        public override void OnActionExecuting(ActionExecutingContext context)
        {
            //lấy giá trị của session email
            string email = context.HttpContext.Session.GetString("admin_email");
            if (string.IsNullOrEmpty(email))
            {
                context.HttpContext.Response.Redirect("/Admin/Account/Login");
            }
            base.OnActionExecuting(context);
        }
    }
}
