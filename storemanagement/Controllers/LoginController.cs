using System;
using System.Data.Entity.Core.Metadata.Edm;
using System.Diagnostics;
using System.Threading.Tasks;
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
        public async Task<ActionResult> Index(Employee model)
        {
            Employee emp = await db.EmployeeDetails(model);
          

            if (!ModelState.IsValid)
            {
                return View();
            }

            model.password = Crypto.Hash(model.password);

            if(emp != null)
            {
                emp.sessionId = Guid.NewGuid();
                Session["UserId"] = emp.sessionId;
                db.Save(model);
                return RedirectToAction("Category", "Stationary");
                
            }

            else 
            {
                ModelState.AddModelError("", "Invalid Username or Password");
            } 
                   
            return View(model);
        }
    }
}