﻿using System.Web;
using System.Web.Mvc;

namespace AspNet.SSRS.Container.Example
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
