using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class ForgotPass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string Resetpassword(string temailaddress)
        {
            var results = (dynamic)null;


            try
            {

                string status = Config.ObjNav.PortalResetPassword(temailaddress);
                string[] info = status.Split('*');
                if (info[0] == "success")
                {
                    results = info[0];
                }
                else
                {
                    results = info[1];
                }

            }
            catch (Exception ex)
            {
                results = ex.Message;
            }

            return results;
        }


    }
}