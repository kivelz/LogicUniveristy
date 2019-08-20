using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using storemanagement.Models;

namespace storemanagement.DAL
{
    public class DepartmentDal
    {
        private StoreManagement Db = new StoreManagement();

        public List<Department> GetAllDepartments()
        {
            return Db.Departments.ToList();
        }
    }
}