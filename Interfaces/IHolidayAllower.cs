﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UCOMProject.Models;

namespace UCOMProject.Interfaces
{
    public interface IHolidayReview
    {
       Task<bool> Review(List<HolidayDetailViewModel> data , ReviewType state);
    }
}
