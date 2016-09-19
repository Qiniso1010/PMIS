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

namespace Mvc5.Libraries
{
    public static class Stored
    {
        public static string SecretKey = "%$#@#$8893";
        public static bool? IsLogin;
        public static IDbConnection db = new NpgsqlConnection(ConfigurationManager.ConnectionStrings["ProjectConn"].ConnectionString);
        public static IDbConnection dbMysql = new MySqlConnection(ConfigurationManager.ConnectionStrings["ConnExtMember"].ConnectionString);
        public static string Attr;
        public static string Message;
    }
}