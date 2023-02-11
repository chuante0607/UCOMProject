﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace UCOMProject.Models
{
    public class HolidayDetailModel 
    {
        public int Id { get; set; }
        [Required]
        public string EId { get; set; }
        [Required]
        public int? HId { get; set; }
        [Required]
        [Range(0,999)]
        public double? UsedDays { get; set; }
        public double? UsedHours { get { return UsedDays * 10; } }
        [Required]
        public DateTime? BeginDate { get; set; }
        [Required]
        public DateTime? EndDate { get; set; }
        public bool? Allow { get; set; }
        [Required]
        public string Remark { get; set; }
        public List<DateTime?> RangeDate { get; set; }
    }
}