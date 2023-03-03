﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UCOMProject.Interfaces
{
    interface IAccountReviewer
    {
        Task<bool> ReviewEmployeeAccount(string eid);
        Task<bool> ReviewEmployeeAccount(List<string> eid);
    }
}
