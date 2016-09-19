using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Dapper;
using System.Data;
using System.Data.SqlClient;
using MySql.Data.MySqlClient;
using System.Configuration;
using Npgsql;


namespace Mvc5.Areas.Auth.Libraries
{
    public class Init
    {
        public static string AppName = "Project Management Information System";
        public static string TagLine = "PT. Perkebunan Nusantara XIII ";
        public static string CookieName = "ptpn13";
        public static string ModuleName = "project";
        public static bool? IsLogin = false;
        public static string email = "biroumumkalbar@gmail.com";
        public static string password = "p4ss@biroumum";
        public static string GmailSMTP = "smtp.gmail.com";
        public static string SMTP = "";
        public static string ImageLogo = String.Format("{0}{1}",Areas.Auth.Libraries.Config.BaseUrl,"/Assets/Images/logo-header.png");
        //public static IDbConnection db = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["postConnAgenda"].ConnectionString);
        public static IDbConnection dbMysql = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnExtMember"].ConnectionString);
        public static string Attr;
        public static string Message;
    }
}