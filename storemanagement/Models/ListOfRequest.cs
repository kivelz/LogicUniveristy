using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace storemanagement.Models.DTO
{
    public class ListOfRequest
    {
        public List<Request> request { get; set; }
        public List<RequestItem> item { get; set; }
    }
}