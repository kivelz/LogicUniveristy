using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using storemanagement.DAL;
using storemanagement.Models.DTO;

namespace storemanagement.Controllers
{
    public class StoreController : Controller
    {
        private readonly RequestDetailsContext _dbItem = new RequestDetailsContext();
        private readonly RequestDal _request = new RequestDal();
        // GET: Store
        public ActionResult Index()
        {
            ListOfRequest request = new ListOfRequest();

            request.item = _dbItem.GetAllRequestItem();
            request.request = _request.GetAllRequest();
            return View();
        }
    }
}