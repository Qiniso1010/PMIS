using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Mvc5.Areas.Auth.Libraries;

namespace Mvc5.ActionFilters
{
    public class AuthFilter : ActionFilterAttribute
    {

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            string UserId = Auth.GetUserId();
            if (UserId != null)
            {
                

                if (!Auth.IsLogin())
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                    {
                        { "action", "Logout" },
                        { "controller", "OAuth" },
                        { "Area", String.Empty }
                    });

                if (!Auth.ModuleSameWith(Mvc5.Areas.Auth.Libraries.Init.ModuleName))
                    filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                        {
                            { "action", "Logout" },
                            { "controller", "OAuth" },
                            { "Area", String.Empty }
                        });
            }
            else
            {
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary
                {
                    { "action", "Logout" },
                    { "controller", "OAuth" },
                    { "Area", String.Empty }
                });
            }
            base.OnActionExecuting(filterContext);
        }


    }
}
