using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class RequestAccountCreation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                

                var nav = new Config().ReturnNav();
               

                var postCodes = nav.postcodes;
                postalAddress.DataSource = postCodes;
                postalAddress.DataValueField = "Code";
                postalAddress.DataTextField = "City";
                postalAddress.DataBind();
                postalAddress.Items.Insert(0, new ListItem("--select Postal Address--", ""));



            }
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string RequesttoCreateAccount(string tagencyName, string tresidenctialAddress, string tpostalAddress, string ttelephoneNumber, string talternativePhoneNumber, string twhatsAppNo, string temailAddress, string twebsite)
        {
            var results = (dynamic)null;
            try
            {
                string FullNames = tagencyName;

                string fullName = FullNames.ToUpper();
                var names = fullName.Split(new string[] { " " }, StringSplitOptions.RemoveEmptyEntries);
                // var names = fullName.Split(' ');
                Boolean error = false;
                String message = "";
                string firstName = "";
                string middliN = "";
                string lastName = "";

                if (names.Length == 4)
                {
                    firstName = names[0];
                    middliN = names[1];
                    lastName = names[2] + names[3];

                }

                if (names.Length == 3)
                {
                    firstName = names[0];
                    middliN = names[1];
                    lastName = names[2];

                }
                if (names.Length == 2)
                {
                    firstName = names[0];
                    //string middliN = names[1];
                    lastName = names[1];

                }
                if (names.Length == 1)
                {
                    firstName = names[0];
                    // string middliN = names[1];
                    //string lastName = names[2];

                }



                var nav = new Config().ReturnNav();
                ttelephoneNumber = Regex.Replace(ttelephoneNumber, @"/^[^ 1 - 9A - Z] +|\s / gm", "");

                if (string.IsNullOrWhiteSpace(temailAddress))
                {
                    results = "Please Fill in Your Email Address";
                    return results;
                }

                string AuthenticationEmail = temailAddress.Trim().ToLower();

            

                Regex regex = new Regex(@"^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$");
                Match match = regex.Match(AuthenticationEmail);

                if (match.Success)
                {


                    string status = Config.ObjNav.FnRegistration(firstName, middliN, lastName, ttelephoneNumber, tresidenctialAddress, tpostalAddress, talternativePhoneNumber, twhatsAppNo, twebsite, AuthenticationEmail);
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
                else
                {
                    results = "Invalid Email Address";
                }



            }
            catch (Exception ex)
            {
                results = ex.Message;
            }
            return results;
        }

        protected void agencyType_SelectedIndexChanged(object sender, EventArgs e)
        {
            String kenyaCountry = DropDownList1.SelectedValue.Trim();
            if (kenyaCountry == "KE")
            {
                LocalAddress.Visible = true;
            }
            else
            {
                LocalAddress.Visible = false;
            }
        }
    }
}