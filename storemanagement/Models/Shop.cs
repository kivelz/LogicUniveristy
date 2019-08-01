using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace storemanagement.Models.DAO
{
    public class Shop
    {
        public List<Product> productList { get; set; }
        public List<Category> categoryList { get; set; }
          
    }
}