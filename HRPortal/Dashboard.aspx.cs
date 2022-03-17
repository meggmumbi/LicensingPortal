using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    var nav = new Config().ReturnNav();
                    string email = Convert.ToString(Session["email"]);
                    var app = nav.Recognition_Equation_Header.Where(x => x.Email == email).ToList();
                    foreach (var item in app)
                    {
                        Session["ApplicationNo"] = item.Application_No;
                    }
                }
                catch
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}