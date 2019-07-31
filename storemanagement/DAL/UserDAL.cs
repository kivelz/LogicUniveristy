using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using storemanagement.Models;


namespace storemanagement.DAL
{
    public partial class UserDAL
    {
        private StoreManagement db = new StoreManagement();


        //get all employee
        public List<Employee> GetAllEmployee()
        {
            return db.Employees.ToList();
        }
        public bool Exist(Employee emp)
        {
            bool isValid;
            if(db.Employees.Any(x => x.email.Equals(emp.email) && x.password.Equals(emp.password)))
            {
                isValid = true;
            }
            else
            {
                return false;
            }
            return isValid;
        }
        //Find employee id
        public Employee FindById(int id)
        {
            return db.Employees.Find(id);
        }

        public void Save(Employee employee)
        {
            db.SaveChanges();
        }
    }
}