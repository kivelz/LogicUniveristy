using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using storemanagement.Models;

namespace storemanagement.DAL
{
    public class StationaryDAL
    {
        private StoreManagement db = new StoreManagement();


        public Category FindById(int id)
        {
            return db.Categories.Find(id);
        }

        public List<Category> FindAllProduct()
        {
            return db.Categories.ToList();
        }
        public Category GetByCategory(string name)
        {
            return db.Categories.Where(x => x.Name == name).FirstOrDefault();
        }
        
    }
}