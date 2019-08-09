using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using storemanagement.Models;

namespace storemanagement.DAL
{
    public class StationaryDAL
    {
        private StoreManagement db = new StoreManagement();


        public async Task<Category> FindById(int id)
        {
            Category cat = await db.Categories.FindAsync(id);
            return cat;
        }

        public async Task<List<Category>> FindAllProduct()
        {
            List<Category> list = await db.Categories.ToListAsync();
            return list;
        }
        public async Task<Category> GetByCategory(string name)
        {
            Category cat  = await db.Categories.FirstOrDefaultAsync(x => x.Name == name);
            return cat;
        }

        public async Task<List<Category>> GetAllCategories()
        {
            List<Category> list = await db.Categories.ToListAsync();
            return list;
        }
        
    }
}