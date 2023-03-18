﻿using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using UCOMProject.API;
using UCOMProject.Extension;
using UCOMProject.Models;
using UCOMProject.Roles;

namespace UCOMProject.Methods
{
    public static class ScheduleUtility
    {
        /// <summary>
        /// 取得Plans
        /// </summary>
        /// <returns></returns>
        public static async Task<List<Plan>> GetPlans()
        {
            using (MyDBEntities db = new MyDBEntities())
            {
                return await db.Plans.ToListAsync();
            }
        }

        /// <summary>
        /// 取得每天的plans人力計畫
        /// </summary>
        /// <returns></returns>
        public static async Task<List<Plan>> GetPlansByDay()
        {
            List<Plan> list = new List<Plan>();
            List<Plan> plans = await GetPlans();
            //(統計"每天"需求人力)
            foreach (Plan p in plans)
            {
                //plan只有start跟end 所以要轉成每天的人力所有-1天表示當天
                p.EndDate = p.EndDate.AddDays(-1);
                TimeSpan span = p.EndDate.Subtract(p.StartDate);
                int day = span.Days;
                for (int i = 0; i <= day; i++)
                {
                    list.Add(new Plan { Id = p.Id, PlanTitle = p.PlanTitle, StartDate = p.StartDate.AddDays(i), EndDate = p.StartDate.AddDays(i) });
                }
            }
            return list.OrderBy(o => o.StartDate).ToList();
        }

        /// <summary>
        /// 新增與更新Plans人力計畫
        /// </summary>
        /// <param name="plans"></param>
        /// <returns></returns>
        public static async Task<ApplyResult> HandlePlans(List<Plan> plans)
        {
            try
            {
                using (MyDBEntities db = new MyDBEntities())
                {
                    List<Plan> data = await db.Plans.ToListAsync();
                    foreach (Plan p in plans)
                    {
                        var hasData = data.FirstOrDefault(f => f.Id == p.Id);
                        if (hasData == null)
                        {
                            //沒存在就新增plan
                            db.Plans.Add(new Plan
                            {
                                Id = p.Id,
                                StartDate = p.StartDate,
                                EndDate = p.EndDate,
                                PlanTitle = p.PlanTitle
                            });
                        }
                        else
                        {
                            //有存在就更新plan
                            hasData.StartDate = p.StartDate;
                            hasData.EndDate = p.EndDate;
                            hasData.PlanTitle = p.PlanTitle;
                        }
                    }

                    await db.SaveChangesAsync();
                }
                return new ApplyResult { isPass = true, msg = "資料更新成功" };
            }
            catch (Exception ex)
            {
                return new ApplyResult { isPass = false, msg = ex.Message };
            }
        }

        /// <summary>
        /// 刪除Plan
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static async Task<ApplyResult> DeletePlan(Guid id)
        {
            using (MyDBEntities db = new MyDBEntities())
            {
                try
                {
                    var plan = await db.Plans.FindAsync(id);
                    if (plan != null)
                    {
                        db.Plans.Remove(plan);
                        await db.SaveChangesAsync();
                    }
                    return new ApplyResult { isPass = true, msg = "刪除資料成功" };
                }
                catch (Exception ex)
                {
                    return new ApplyResult { isPass = false, msg = ex.Message };
                }

            }
        }


        /// <summary>
        /// 取得A.B班的當年度的工作天(做2休2)
        /// </summary>
        public static List<List<ShiftViewModel>> GetWorkDayOfYearByMonth(ShiftType shift, int year)
        {
            const int WorkCycle = 4;
            List<List<ShiftViewModel>> workDayByMonth = new List<List<ShiftViewModel>>();
            //to do:
            //計算做2休2的週期
            bool isWork = false;
            for (int month = 1; month <= 12; month++)
            {
                List<ShiftViewModel> workDays = new List<ShiftViewModel>();
                //當年度的每個月有幾天
                int daysInMonth = DateTime.DaysInMonth(year, month);
                int day = 1;
                while (day <= daysInMonth)
                {
                    //currentDate屬於目前年份的第幾天
                    DateTime currentDate = new DateTime(year, month, day);
                    //round判斷哪幾天屬於A班或B班上班日
                    int round = currentDate.DayOfYear % WorkCycle;
                    switch (shift)
                    {
                        case ShiftType.A班:
                            isWork = round == 1 || round == 2 ? true : false;
                            break;
                        case ShiftType.B班:
                            isWork = round == 0 || round == 3 ? true : false;
                            break;
                        default:
                            break;
                    }
                    workDays.Add(new ShiftViewModel(shift, currentDate, isWork));
                    day++;
                }
                workDayByMonth.Add(workDays);
            }
            return workDayByMonth;
        }

        public static ShiftType GetShiftTypeByDate(DateTime date, int year)
        {
            var query = GetWorkDayOfYearByMonth(ShiftType.A班, year);
            ShiftViewModel result = query[date.Month - 1].Find(s => s.CheckDate == date);
            if (result != null)
            {
                //A班工作就取B班 反之亦然
                return result.IsWork ? ShiftType.B班 : ShiftType.A班;
            }
            else
            {
                return ShiftType.請選擇;
            }
        }

        /// <summary>
        /// 取得常日班的工作天
        /// </summary>
        /// <param name="year"></param>
        /// <returns></returns>
        public static List<List<ShiftViewModel>> GetWorkDayOfYearByMonth(string[] file, int year)
        {
            List<List<ShiftViewModel>> workDayByMonth = new List<List<ShiftViewModel>>();
            List<ShiftViewModel> ShiftViewModels = new List<ShiftViewModel>();
            using (MyDBEntities db = new MyDBEntities())
            {
                foreach (var line in file)
                {
                    List<string> str = line.Split(',').ToList();
                    if (DateTime.TryParseExact(str[0], "yyyyMMdd", CultureInfo.InvariantCulture, DateTimeStyles.None, out DateTime date))
                    {
                        if (str[2] == "2")
                        {
                            ShiftViewModels.Add(new ShiftViewModel(ShiftType.常日班, date, false));
                        }
                        else
                        {
                            ShiftViewModels.Add(new ShiftViewModel(ShiftType.常日班, date, true));
                        }
                    }
                }
            }

            workDayByMonth = ShiftViewModels.GroupBy(g => g.CheckDate.Month).Select(s => s.ToList()).ToList();
            return workDayByMonth;
        }

        /// <summary>
        /// 取得請假人數在Calendars所展示的資訊
        /// </summary>
        /// <returns></returns>
        public static async Task<List<CalendarApiModel>> GetCalendars(RoleManage user)
        {
            var query = await user.GetHolidayDetails();
            List<CalendarApiModel> calendars = new List<CalendarApiModel>();
            List<HolidayDetailViewModel> holidayDetails = query.ToList();
            foreach (HolidayDetailViewModel detail in holidayDetails)
            {
                string className = "";
                string backColor = "";
                string txtColor = "";
                if (detail.State != 2)
                    continue;
                switch (detail.Shift.xTranShiftEnum())
                {
                    case ShiftType.常日班:
                        className = "event_shiftW";
                        backColor = "#FED3D3";
                        txtColor = "#000";
                        break;
                    case ShiftType.A班:
                        className = "event_shiftA";

                        break;
                    case ShiftType.B班:
                        className = "event_shiftB";
                        backColor = "#fff";
                        txtColor = "#000";

                        break;
                    default:
                        break;
                }
                foreach (DateTime date in detail.RangDate)
                {
                    CalendarApiModel calendar = new CalendarApiModel();
                    calendar.id = detail.Id.ToString();
                    calendar.title = $"{detail.Name}";
                    calendar.start = date;
                    calendar.end = date.AddDays(1);
                    calendar.classNames = className;
                    calendar.backgroundColor = backColor;
                    calendar.textColor = txtColor;
                    calendar.remark = $"{ detail.Title} {detail.UsedDays}天：{detail.BeginDate.ToString("M/d")} - {detail.EndDate.ToString("M/d")}";
                    calendar.shift = detail.Shift;
                    calendar.eid = detail.EId;
                    calendars.Add(calendar);
                }
            }
            calendars = calendars.OrderBy(o => o.classNames).ToList();
            return calendars;
        }

        /// <summary>
        /// Schedule頁面的所有資訊
        /// </summary>
        /// <returns></returns>
        public static async Task<ScheduleApiModel> GetSchedule(RoleManage user)
        {
            ScheduleApiModel schedule = new ScheduleApiModel();
            schedule.calendars = await GetCalendars(user);
            schedule.employees = await user.GetEmployees();
            var details = await HolidayUtility.GetHolidayDetails();
            schedule.plans = await GetPlans();
            string[] file = System.IO.File.ReadAllLines(System.Web.Hosting.HostingEnvironment.MapPath("~/Uploads/112年中華民國政府行政機關辦公日曆表.csv"), Encoding.Default);
            schedule.shifts = GetWorkDayOfYearByMonth(ShiftType.A班, DateTime.Now.Year);
            schedule.weekWorks = GetWorkDayOfYearByMonth(file, DateTime.Now.Year);
            int empsA = schedule.employees.Where(e => e.ShiftType == ShiftType.A班).ToList().Count();
            int empsB = schedule.employees.Where(e => e.ShiftType == ShiftType.B班).ToList().Count();
            int empsW = schedule.employees.Where(e => e.ShiftType == ShiftType.常日班).ToList().Count();

            //計算每天請假的人數
            schedule.leaveInfos = schedule.calendars.GroupBy(g => g.start).Select(group => new LeaveNumApiModel { date = group.Key, leaveNum = group.Count() }).ToList();

            //以下計算人力
            List<ScheduleNumApiModel> list = new List<ScheduleNumApiModel>();
            foreach (Plan p in schedule.plans.OrderBy(p => p.StartDate))
            {
                //plan日期是範圍
                TimeSpan days = p.EndDate.Subtract(p.StartDate);
                for (int i = 0; i < days.Days; i++)
                {
                    DateTime planDate = p.StartDate.AddDays(i);
                    ScheduleNumApiModel numModel = new ScheduleNumApiModel();
                    //shifts weekDays leaves索引由0開始表示1月
                    int month = planDate.Month - 1;
                    //planNum當天排程需求人力
                    numModel.planNum = int.Parse(p.PlanTitle);
                    //確認當天是A或B班出勤
                    ShiftViewModel shiftByDate = schedule.shifts[month].FirstOrDefault(shift => shift.CheckDate == planDate);
                    //確認當天常日班是否出勤
                    ShiftViewModel weekDayByDate = schedule.weekWorks[month].FirstOrDefault(shift => shift.CheckDate == planDate);
                    if (shiftByDate != null && weekDayByDate != null)
                    {
                        //shouldNum 當天應出勤出勤人力
                        numModel.shouldNum += shiftByDate.IsWork ? empsA : empsB;
                        numModel.shouldNum += weekDayByDate.IsWork ? empsW : 0;
                        //當天請假人力
                        numModel.leaveNum = details.Where(d => d.State == 2 && d.RangDate.Contains(planDate)).ToList().Count();
                    }
                    //實際人力不夠  在加到attendance於前端發送通知
                    if (numModel.realNum < 0)
                    {
                        List<string> shifts = new List<string>();
                        numModel.date = planDate;
                        //紀錄出勤班別
                        shifts.Add(shiftByDate.IsWork ? ShiftType.A班.ToString() : ShiftType.B班.ToString());
                        shifts.Add(weekDayByDate.IsWork ? ShiftType.常日班.ToString() : ShiftType.請選擇.ToString());
                        numModel.shouldShifts = shifts;
                        list.Add(numModel);
                    }
                }
            }
            schedule.attendance = list;
            return schedule;
        }

        /// <summary>
        /// 取得出勤表
        /// </summary>
        /// <returns></returns>
        public static async Task<List<Attendance>> GetAttendances()
        {
            using (MyDBEntities db = new MyDBEntities())
            {
                return await db.Attendances.ToListAsync();
            }
        }

        /// <summary>
        /// 取得出勤表指定日期
        /// </summary>
        /// <returns></returns>
        public static async Task<Attendance> GetAttendances(DateTime date)
        {
            using (MyDBEntities db = new MyDBEntities())
            {
                var query = await db.Attendances.ToListAsync();
                if (query == null)
                    throw new Exception($"{date}沒有指定日期的資訊");
                return query.Where(data => data.WorkDate == date).FirstOrDefault();
            }
        }

        /// <summary>
        /// 取得指定日期出勤表
        /// </summary>
        /// <param name="days"></param>
        /// <returns></returns>
        public static async Task<List<Attendance>> GetAttendances(List<DateTime> days)
        {
            List<Attendance> attendances = new List<Attendance>();
            using (MyDBEntities db = new MyDBEntities())
            {
                var query = await db.Attendances.ToListAsync();
                foreach (DateTime date in days)
                {
                    var result = query.Where(data => data.WorkDate == date).FirstOrDefault();
                    if (result == null)
                        throw new Exception($"{date}沒有指定日期的資訊");
                    attendances.Add(result);
                }
                return attendances;
            }
        }
    }
}