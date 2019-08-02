using System.Web.Mvc;
using storemanagement.Models;
using storemanagement.DAL;
using storemanagement.Ulti;

namespace storemanagement.Controllers
{
    public class LoginController : Controller
    {
        private UserDAL db = new UserDAL();
        // GET
        public ActionResult Index()
        {
            return  View();
        }


        [HttpPost]
        public ActionResult Index(Employee model)
        {
            var userDetails = db.EmployeeDetails(model);

            if (!ModelState.IsValid)
            {
                return View();
            }

            model.password = Crypto.Hash(model.password);

            if(userDetails != null)
            {
                Session["UserId"] = userDetails.Id;
                return RedirectToAction("Index");
            }

            else 
            {
                ModelState.AddModelError("", "Invalid Username or Password");
            } 
                   
            return View(model);
        }
    }
}