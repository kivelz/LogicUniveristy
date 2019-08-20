using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Web;
using storemanagement.Models;

namespace storemanagement.DAL
{
    public class RequestDal
    {
        private StoreManagement db = new StoreManagement();

        public void Save(RequestItem request)
        {

            db.SaveChanges();
        }

        public void Add(RequestItem request)
        {
            db.RequestItems.Add(request);
        }

        public List<Request> GetAllRequest()
        {
            return db.Requests.ToList();
        }


        public List<Request> SearchRequestStatus(string status)
        {
            return db.Requests.Where(x => x.status.Contains(status)).ToList();
        }

        public List<Request> GetRequestItemByApproved(string dept)
        {
            return db.Requests.Where(x => x.status == "Approved" && x.deptName == dept).ToList();
        }

        public List<Request> GetRequestItemsOutstanding(string deptname, string status)
        {
            status = "pending";
            return db.Requests.Where(x => x.status == status && x.deptName == deptname).ToList();
        }
    }
}