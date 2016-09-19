using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using Mvc5.Areas.Project.Context;

namespace Mvc5.Areas.Project.Context
{
    public class ProjectInitializer : System.Data.Entity.DropCreateDatabaseIfModelChanges<ProjectContext>
    {
        protected override void Seed(ProjectContext context)
        {

        }
    }
}