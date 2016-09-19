using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Mvc5.Libraries
{
    public static class Validation
    {
        public static void CleanAllBut(this ModelStateDictionary modelState, params string[] includes)
        {
            modelState.Where(x => includes.Any(i => String.Compare(i, x.Key, true) == 0))
            .ToList()
            .ForEach(k => modelState.Remove(k));
        }
    }
}