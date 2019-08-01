using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using storemanagement.Models;
using storemanagement.DAL;

namespace storemanagement.Controllers
{
    public class StationaryController : Controller
    {
        private StationaryDAL db = new StationaryDAL();
        private ProductDAL db1 = new ProductDAL();
        // GET: Stationary
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Category(string name)

        {
            List<Product> list;

           using(StoreManagement db = new StoreManagement())
            {
                Category cat = db.Categories.Where(x => x.Name == name).FirstOrDefault();
                int catId = cat.Id;

                list = db.Products.ToArray().Where(x => x.CategoryId == catId).ToList();
                

            }
            return View(list);
        }
    }
}