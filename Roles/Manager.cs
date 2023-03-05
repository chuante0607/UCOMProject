﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using UCOMProject.Models;
using UCOMProject.Methods;
using UCOMProject.Interfaces;
using UCOMProject.Extension;

namespace UCOMProject.Roles
{
    public class Manager : RoleManage, IHolidayReviewer
    {
        public Manager(RoleType role) : base(role) { }

        public override RoleManage GetRole()
        {
            return new Manager(RoleType.Manager);
        }

        public override async Task<EmployeeViewModel> GetEmployeeById(string eid)
        {
            //主管只能查自己部門員工的假別
            using (MyDBEntities db = new MyDBEntities())
            {
                int branchId = db.Employees.Find(eid).BranchId;
                if (CurrentUser.BranchId == branchId)
                {
                    EmployeeViewModel emp = await EmployeeUtility.GetEmpById(eid);
                    return emp;
                }
                else
                {
                    throw new Exception("部門主管只能查直屬部門員工資訊");
                }
            }
         
        }

        public override async Task<List<EmployeeViewModel>> GetEmployees()
        {
            return await EmployeeUtility.GetEmployees(new List<int> { (int)BranchType });
        }

        public override async Task<List<HolidayDetailViewModel>> GetHolidayDetails()
        {
            return await HolidayUtility.GetHolidayDetails(BranchType);
        }

        public async Task<bool> ReviewHolidayApply(List<HolidayDetailViewModel> data, ReviewType state)
        {
            return await HolidayUtility.EditHolidayDetailsState(data, state, CurrentUser);
        }

        public override async Task<List<HolidayViewModel>> GetHolidayInfosByEmp(string eid)
        {
            //主管只能查自己部門員工的假別
            using (MyDBEntities db = new MyDBEntities())
            {
                int branchId = db.Employees.Find(eid).BranchId;
                if (CurrentUser.BranchId == branchId)
                {
                    return await HolidayUtility.GetHolidayInfosByEmp(eid);
                }
                else
                {
                    return new List<HolidayViewModel>();
                }
            }
        }
    }
}