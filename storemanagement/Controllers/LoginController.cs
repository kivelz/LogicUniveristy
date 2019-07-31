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
            bool exist = db.Exist(model);

            if (!ModelState.IsValid)
            {
                return View();
            }

            bool isValid = false;
            model.password = Crypto.Hash(model.password);

            if(exist)
            {
                return RedirectToAction("Index");
            }

            else if (!isValid)
            {
                ModelState.AddModelError("", "Invalid Username or Password");
            } 
                   
            return View(model);
        }
    }
}