﻿using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using UCOMProject.Methods;
using UCOMProject.Models;
using UCOMProject.Roles;
using UCOMProject.API;
using System.Globalization;

namespace UCOMProject.Controllers
{
    [AuthorizationFilter]
    public class ScheduleController : Controller
    {
        JsonSerializerSettings camelSetting = new JsonSerializerSettings { ContractResolver = new CamelCasePropertyNamesContractResolver() };

        // GET: Production
        public ActionResult Index()
        {
            return View();
        }

        public async Task<ActionResult> Plan()
        {
            ViewBag.Source = JsonConvert.SerializeObject(await EmployeeUtility.GetEmployees(), camelSetting);
            return View();
        }

        public async Task<ActionResult> Warn(DateTime? date)
        {
            if (date != null)
            {
                DateTime checkDate = (DateTime)date;
                if (checkDate.Year == DateTime.Now.Year)
                {
                    ShiftType type = ScheduleUtility.GetShiftTypeByDate(checkDate, checkDate.Year);
                    var emps = await EmployeeUtility.GetEmployees();
                    List<EmployeeViewModel> employees = emps.Where(e => e.ShiftType == type).ToList();
                    return View(employees);
                }
            }
            return RedirectToAction("index", "NotFound");
        }

        public ActionResult Event()
        {
            return View();
        }
    }
}