using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using storemanagement.DAL;

namespace storemanagement.Controllers
{
    public class StoreController : Controller
    {
        private RequestDetailsContext _dbItem = new RequestDetailsContext();
        private RequestDal _request = new RequestDal();
        // GET: Store
        public ActionResult Index()
        {

            return View();
        }
    }
}