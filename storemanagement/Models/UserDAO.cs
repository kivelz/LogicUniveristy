using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace storemanagement.Models
{
    public class UserDAO
    {
        private int id { get; set; }
        private string name { get; set; }
        private string code { get; set; }
        private int contact { get; set; }
        private int fax { get; set; }
        private string address { get; set; }
    }
}