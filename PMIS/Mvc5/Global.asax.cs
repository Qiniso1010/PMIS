using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Mvc5.App_Start;
using System.Data.Entity;
using Microsoft.Owin;
using Owin;
using Mvc5.Areas.Auth.Context;

namespace Mvc5
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
           
            //Database.SetInitializer(new DropCreateDatabaseIfModelChanges<ArsipContext>());
            //Database.SetInitializer(new DropCreateDatabaseIfModelChanges<LaporanContext>());
            //Database.SetInitializer(new DropCreateDatabaseIfModelChanges<EofficeContext>());
            Database.SetInitializer(new DropCreateDatabaseIfModelChanges<MemberContext>());

            AreaRegistration.RegisterAllAreas();
            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            
        }
    }
}