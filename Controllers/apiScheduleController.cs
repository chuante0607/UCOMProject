﻿using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Drawing;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Http;
using UCOMProject.API;
using UCOMProject.Extension;
using UCOMProject.Methods;
using UCOMProject.Models;
using UCOMProject.Roles;

namespace UCOMProject.Controllers
{
    public class apiScheduleController : ApiController
    {
        public async Task<IHttpActionResult> Get()
        {
            var head = Request.Headers.Select(s => new { s.Key, s.Value }).FirstOrDefault(w => w.Key == "Authorization");
            string eid = "";
            foreach (var id in head.Value)
            {
                eid = id;
            }
            using (MyDBEntities db = new MyDBEntities())
            {
                Employee emp = db.Employees.Find(eid);
                RoleManage user = ConfirmIdentity(emp.JobRank, emp.Branch.xTranBranchEnum());
                user.CurrentUser = emp;
                ScheduleApiModel schedule = await ScheduleUtility.GetSchedule(user);
                schedule.plansByDay = await ScheduleUtility.GetPlansByDay();
                return Json(schedule);
            }
        }

        private RoleManage ConfirmIdentity(int rank, BranchType branch)
        {
            RoleManage user = null;
            switch (rank)
            {
                case 0:
                    user = new Admin(RoleType.Admin);
                    break;
                case 1:
                    user = new User(RoleType.User);
                    break;
                case 2:
                    user = new Manager(RoleType.Manager, branch);
                    break;
            }
            return user;
        }

        public void Put(int id, [FromBody] string value)
        {
        }

        public void Delete(int id)
        {
        }
    }
}
