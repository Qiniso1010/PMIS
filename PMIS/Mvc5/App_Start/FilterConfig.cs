using System.Web;
using System.Web.Mvc;
namespace Mvc5
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            //filters.Add(new CompressContentAttribute());
            //filters.Add(new MinifyHtmlAttribute());
            //filters.Add(new MinifyXmlAttribute());
            filters.Add(new HandleErrorAttribute());
        }
    }
}