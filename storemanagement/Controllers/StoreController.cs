using System;
using System.Collections.Generic;
using System.EnterpriseServices;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI.WebControls.Expressions;
using Antlr.Runtime;
using Microsoft.Ajax.Utilities;
using storemanagement.DAL;
using storemanagement.Models;
using storemanagement.Models.DTO;

namespace storemanagement.Controllers
{
    public class StoreController : Controller
    {
        private readonly RequestDal _request = new RequestDal();
        private readonly DepartmentDal _dept = new DepartmentDal();
        // GET: Store
        public ActionResult Index(string status)
        {
            List<Request> reqList = new List<Request>();
            List<Request> allRequest = _request.GetAllRequest();

            if (status == null)
            {
                foreach (var item in allRequest)
                {
                    if (item.RequestItems.FirstOrDefault(x => x.RequestId == item.RequestId) != null)
                    {
                        reqList.Add(item);
                    }


                }
                ViewBag.Title = "All Item Request";
                return View(reqList);
            }
            else
            {
                reqList = _request.SearchRequestStatus(status);
                ViewBag.Title = "Request Item by " + status;
                return View(reqList);
            }
        }

        public ActionResult Department(string deptname, string status)
        {
            DepartmentsRequestDTO requestByDept = new DepartmentsRequestDTO();
            requestByDept.Departments = _dept.GetAllDepartments();

            if (deptname != null && status == null)
            {

                requestByDept.ApprovedRequest = _request.GetRequestItemByApproved(deptname);
             
                return View(requestByDept);

            }
            else if (status != null)
            {
                requestByDept.OutstandingRequest = _request.GetRequestItemsOutstanding(deptname, status);
                return View(requestByDept);
            }


            return View(requestByDept);
        }
    }
}