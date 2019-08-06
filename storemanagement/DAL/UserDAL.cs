using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
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

        public string DeptName(Employee emp)
        {
            string empDeptName = "";
            Employee employee = new Employee();
            employee = db.Employees.FirstOrDefault(x => x.DepartmentId == emp.DepartmentId);
            empDeptName = employee.Department.dept_name;
            return empDeptName;
        }
    }
}