using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace storemanagement.Models.ApiModel
{
    public class EmployeeApiModel
    {
        public int EmployeeId { get; set; }
        public string name { get; set; }
        public string email { get; set; }
        public int phone { get; set; }
        public string password { get; set; }
        public Nullable<System.Guid> sessionId { get; set; }
        public int empNo { get; set; }
        public int DepartmentId { get; set; }
        public int RoleId { get; set; }
        public Nullable<int> MgrId { get; set; }
    }
}