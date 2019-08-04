using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using storemanagement.Models;

namespace storemanagement.DAL
{
    public class ProductDAL
    {
        private StoreManagement db = new StoreManagement();

        public List<Product> FindById(int id)
        {
            return db.Products.ToArray().Where(x => x.CategoryId == id).ToList();
        }
        public List<Product> GetAllProduct()
        {
            return db.Products.ToList();
        }
        public Product Find(int id)
        {
            return db.Products.Find(id);
        }
    }
}