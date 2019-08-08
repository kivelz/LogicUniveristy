using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls.Expressions;
using storemanagement.DAL;
using storemanagement.Models;
using storemanagement.Models.DTO;

namespace storemanagement.Controllers
{
    public class StoreController : Controller
    {
        private readonly RequestDetailsContext _dbItem = new RequestDetailsContext();
        private readonly RequestDal _request = new RequestDal();
        // GET: Store
        public ActionResult Index(string status)
        {
            ListOfRequest listOfRequest = new ListOfRequest();
            List<Request> reqList;
            List<RequestItem> reqItem;

            if (status == null)
            {
                reqList = _request.GetAllRequest();
                listOfRequest.request = reqList;

            } else
            {
                reqList = _request.SearchRequestStatus(status);
                listOfRequest.request = reqList;
            }
            return View(listOfRequest);

        }
    }
}