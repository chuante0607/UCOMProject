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
    
    public partial class OverTimeDetail
    {
        public int Id { get; set; }
        public string EId { get; set; }
        public System.DateTime OverTimeDate { get; set; }
        public bool UserCheck { get; set; }
        [JsonIgnore]
        public virtual Employee Employee { get; set; }
    }
}
