using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace storemanagement.Models.DTO
{
    public class RequisitionDTO
    {
        public int ProductId { get; set; }
        public string ProductCode { get; set; }
        public string ProductDescription { get; set; }
        public int Qty { get; set; }
        public int Metric { get; set; }

    }
}