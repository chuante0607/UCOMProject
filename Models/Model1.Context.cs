﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MyDBEntities : DbContext
    {
        public MyDBEntities()
            : base("name=MyDBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Branch> Branches { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Employee> Employees { get; set; }
        public virtual DbSet<HolidayDetail> HolidayDetails { get; set; }
        public virtual DbSet<Plan> Plans { get; set; }
        public virtual DbSet<Holiday> Holidays { get; set; }
        public virtual DbSet<Attendance> Attendances { get; set; }
    }
}
