using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
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
        public Employee EmployeeDetails(Employee emp)
        {
            var userDetails = db.Employees.FirstOrDefault(x => x.email == emp.email && x.password == emp.password);

            return userDetails;

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

        public async Task<string> DeptName(Employee emp)
        {
            emp = db.Employees.FirstOrDefault(x => x.Department.dept_name == emp.Department.dept_name);
            string dName = emp.Department.dept_name;
            return await Task.FromResult(dName);
        }

        public async Task<Employee> FindBySessionId(Guid guid)
        {
            Employee emp =  db.Employees.FirstOrDefault(x => x.sessionId == guid);
            return await Task.FromResult(emp);;
        }
    }
}