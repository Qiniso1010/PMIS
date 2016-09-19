using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

namespace Mvc5.Libraries
{
    public class Connection : IDisposable
    {
        //The managed resource handle
        MySqlConnection conn = null;    

        public Connection(string path)
        {
            MySqlConnection conn = new MySqlConnection(ConfigurationManager.ConnectionStrings["conn"].ConnectionString);
            conn.Open();         
        }    
            
        public void Dispose()
        {      
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {       
            if (disposing == true)
            {
                conn.Close(); // call close here to close connection
            }
        }


        ~Connection()
        {        
            Dispose(false);
        }

    
    }
}