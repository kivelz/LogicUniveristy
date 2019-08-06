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

        public void Add(RequestDetails details)
        {
            db.RequestDetails.Add(details);
        }

        public void Save(RequestDetails details)
        {
            db.SaveChanges();
        }
    }
}