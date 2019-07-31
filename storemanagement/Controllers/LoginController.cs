using System.Web.Mvc;
using storemanagement.Models;
using storemanagement.DAL;

namespace storemanagement.Controllers
{
    public class LoginController : Controller
    {
        private UserDAL db = new UserDAL();
        // GET
        public ActionResult Index()
        {
            return
            View();
        }

        [HttpPost]
        public ActionResult Login(int id, string password)
        {
            Employee emp = db.FindById(id);

            if(!ModelState.IsValid)
            {
                return View(emp);
            }

            bool isValid = false;

            if(emp.Id == id && emp.password == password)
            {
                isValid = true;
            }

            if(!isValid)
            {
                ModelState.AddModelError("", "Invalid Username or Password");
            } else
            {
                return RedirectToAction("Index", emp);
            }
            return View(emp);
        }
    }
}