using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace storemanagement.Models.DTO
{
    public class DepartmentsRequestDTO
    {
        public List<Request> ApprovedRequest { get; set; }
        public List<Department> Departments { get; set; }
        public List<Request> OutstandingRequest { get; set; }
    }
}