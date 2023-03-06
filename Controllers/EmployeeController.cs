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
using System.Diagnostics;
using UCOMProject.Extension;

namespace UCOMProject.Controllers
{
    [AuthorizationFilter]
    public class EmployeeController : Controller
    {
        // GET: Employee
        JsonSerializerSettings camelSetting = new JsonSerializerSettings { ContractResolver = new CamelCasePropertyNamesContractResolver() };
        public ActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 建立員工資訊
        /// </summary>
        /// <returns></returns>
        public ActionResult Create()
        {
            ViewBag.Result = ViewBag.Result = JsonConvert.SerializeObject(new ApplyResult(), camelSetting);
            return View();
        }

        [HttpPost]
        public ActionResult Create(EmployeeViewModel emp)
        {
            try
            {
                ApplyResult result = new ApplyResult();
                if (ModelState.IsValid)
                {
                    result = EmployeeUtility.CreateEmpInfo(emp);
                    if (result.isPass)
                    {
                        string path = Server.MapPath($@"\img\{result.FileName}");
                        emp.ImageFile.SaveAs(path);
                        ViewBag.Result = JsonConvert.SerializeObject(result, camelSetting);
                    }
                    else
                    {
                        ViewBag.Result = JsonConvert.SerializeObject(result, camelSetting);
                    }
                    return View();
                }
                result.isPass = false;
                result.msg = "資料填寫不完整";
                ViewBag.Result = JsonConvert.SerializeObject(result, camelSetting);
                return View();
            }
            catch
            {
                return View();
            }
        }

        public async Task<ActionResult> Review()
        {
            RoleManage user = ConfirmIdentity();
            try
            {
                var emps = await user.GetEmployees();
                ViewBag.Source = JsonConvert.SerializeObject(emps, camelSetting);
                return View(emps);
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                return RedirectToAction("index", "NotFound");
            }
        }

        [HttpGet]
        public async Task<ActionResult> Detail(string eid)
        {
            RoleManage user = ConfirmIdentity();
            try
            {
                EmployeeViewModel emp = await user.GetEmployeeById(eid);
                return View(emp);
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
                return RedirectToAction("index", "NotFound");
            }
        }

        [HttpGet]
        public async Task<JsonResult> Allow(string eid)
        {

            return Json(JsonConvert.SerializeObject(null, camelSetting)); ;
        }

        // GET: Employee/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Employee/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Employee/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Employee/Delete/5
        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        private RoleManage ConfirmIdentity()
        {
            RoleManage user = null;
            switch (SessionEmp.CurrentEmp.JobRank)
            {
                case 0:
                    user = new Admin(RoleType.Admin);
                    break;
                case 1:
                    user = new User(RoleType.User);
                    break;
                case 2:
                    user = new Manager(RoleType.Manager ,SessionEmp.CurrentEmp.Branch.xTranBranchEnum());
                    break;
            }
            return user;
        }

    }
}
