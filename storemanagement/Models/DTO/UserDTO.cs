using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace storemanagement.Models.DTO
{
   
    public class UserDTO
    {
        public UserDTO()
        {
        }

        public UserDTO(Manager emp)
        {
            EmployeeId = emp.EmployeeId;
            name = emp.name;
            email = emp.email;
            phone = emp.phone;
            password = emp.password;
            empNo = emp.empNo;
            deptId = emp.DepartmentId;
            RoleId = emp.RoleId;
        }

        public int EmployeeId { get; set; }
        [Required]
        public string name { get; set; }
        [Required]
        [DataType(DataType.EmailAddress)]
        public string email { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string password { get; set; }
        public int phone { get; set; }
        public int empNo { get; set; }
        public int deptId { get; set; }
        public int RoleId { get; set; }

    }

}