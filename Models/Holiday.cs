//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace UCOMProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Holiday
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Holiday()
        {
            this.HolidayDetails = new HashSet<HolidayDetail>();
        }
    
        public int HId { get; set; }
        public string Title { get; set; }
        public int TotalDays { get; set; }
        public bool ProveType { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HolidayDetail> HolidayDetails { get; set; }
    }
}
