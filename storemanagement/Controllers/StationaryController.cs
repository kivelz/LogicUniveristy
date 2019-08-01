using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using storemanagement.Models;
using storemanagement.DAL;
using storemanagement.Models.DAO;

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
            List<Category> categories;

            categories = db.GetAllCategories();
            Category cat = db.GetByCategory(name);
            int catId = cat.Id;

            list = db1.FindById(catId);

            categories = db.GetAllCategories();

            Shop shop = new Shop();
            shop.categoryList = categories;
            shop.productList = list;
      
            return View(shop);
        }
    }
}