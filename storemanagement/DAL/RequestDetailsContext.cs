using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using storemanagement.Models;

namespace storemanagement.DAL
{
    public class RequestDetailsContext
    {
        private StoreManagement db = new StoreManagement();

        public void Add(Request details)
        {
            db.Requests.Add(details);
          
        }

        public void Save(Request details)
        {
            db.SaveChanges();
        }

        public List<RequestItem> GetAllRequestItem()
        {
            return db.RequestItems.ToList();
        }
    }
}