using System;
using System.Collections.Generic;
using System.Diagnostics.Eventing.Reader;
using System.Linq;
using System.Threading.Tasks;
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
        public async Task<ActionResult> Category(string name)
        {
            if (Session["UserId"] != null)
            {
                List<Product> list;
                List<Category> categories;
                Shop shop;


                Category cat = await db.GetByCategory(name);
               

                categories = await db.GetAllCategories();

                if (cat == null)
                {
                
                    list = db1.GetAllProduct();
                    shop = new Shop {categoryList = categories, productList = list};
                    return View(shop);
                }
                else
                {
                    int catId = cat.Id;
                    list = db1.FindById(catId);

                    categories = await db.GetAllCategories();

                    shop = new Shop {categoryList = categories, productList = list};

                    return View(shop);
                } 

            }
            else
            {
                return RedirectToAction("Index", "Login");
            }
           
        }
    }
}