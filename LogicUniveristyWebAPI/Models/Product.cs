//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LogicUniveristyWebAPI.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.RequestItems = new HashSet<RequestItem>();
        }
    
        public int Id { get; set; }
        public string item_code { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }
        public int reorderLvl { get; set; }
        public int reorderQty { get; set; }
        public int balance { get; set; }
        public int UnitsId { get; set; }
        public double price { get; set; }
    
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RequestItem> RequestItems { get; set; }
        public virtual Unit Unit { get; set; }
    }
}
