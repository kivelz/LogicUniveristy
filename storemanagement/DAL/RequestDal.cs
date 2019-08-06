using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using storemanagement.Models;

namespace storemanagement.DAL
{
    public class RequestDal
    {
        private StoreManagement db = new StoreManagement();

        public void Save(Request request)
        {
            db.SaveChanges();
        }
    }
}