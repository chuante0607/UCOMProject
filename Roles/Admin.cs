﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using UCOMProject.Models;
using UCOMProject.Methods;
using UCOMProject.Interfaces;

namespace UCOMProject.Roles
{
    public class Admin : RoleManage, IHolidayReviewer, IAccountReviewer
    {
        public Admin(RoleType role) : base(role) { }

        public override RoleManage GetRole()
        {
            return new Admin(RoleType.Admin);
        }

        public override async Task<List<EmployeeViewModel>> GetEmployees()
        {
            return await EmployeeUtility.GetEmployees();
        }

        public override async Task<List<HolidayDetailViewModel>> GetHolidayDetails()
        {
            return await HolidayUtility.GetHolidayDetails();
        }

        public async Task<bool> ReviewHolidayApply(List<HolidayDetailViewModel> data, ReviewType state)
        {
            return await HolidayUtility.EditHolidayDetailsState(data, state, CurrentUser);
        }

        public async Task SetAccountRole(List<EmployeeViewModel> emps)
        {
            try
            {
                foreach (EmployeeViewModel emp in emps)
                {
                    await EmployeeUtility.UpdateEmpInfo(emp);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}

