using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace TokenField
{
    public partial class TokenForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<string> getEmp(string empdetails)
        {
            List<string> emp = new List<string>();
            string main = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
            SqlConnection con = new SqlConnection(main);
            string sqlquery = string.Format("Select Name from [dbo].[Sample_Table] where Name LIKE '%{0}%'", empdetails);
            con.Open();
            SqlCommand com = new SqlCommand(sqlquery, con);
            SqlDataReader sdr = com.ExecuteReader();
            while(sdr.Read())
            {
                emp.Add(sdr.GetString(0));
            }
            con.Close();
            return emp;
        }
    }
}