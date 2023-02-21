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
    
    public partial class HolidayDetail
    {
        public int Id { get; set; }
        public string EId { get; set; }
        public int HId { get; set; }
        public System.DateTime BeginDate { get; set; }
        public System.DateTime EndDate { get; set; }
        public int State { get; set; }
        public string Remark { get; set; }
        public string Prove { get; set; }
        public int UsedDays { get; set; }
        public int BelongYear { get; set; }
        public System.DateTime ApplyDate { get; set; }
        [JsonIgnore]
        public virtual Employee Employee { get; set; }
        [JsonIgnore]
        public virtual Holiday Holiday { get; set; }
    }
}
