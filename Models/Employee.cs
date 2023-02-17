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
    using Newtonsoft.Json;
    using System;
    using System.Collections.Generic;
    
    public partial class Employee
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Employee()
        {
            this.HolidayDetails = new HashSet<HolidayDetail>();
        }
    
        public string EId { get; set; }
        public string Name { get; set; }
        public string Image { get; set; }
        public string Branch { get; set; }
        public string JobTitle { get; set; }
        public int JobRank { get; set; }
        public string Sex { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string EnglishName { get; set; }
        public string Password { get; set; }
        public string Shift { get; set; }
        public System.DateTime StartDate { get; set; }
        [JsonIgnore]
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HolidayDetail> HolidayDetails { get; set; }
    }
}
