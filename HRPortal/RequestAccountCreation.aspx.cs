using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
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

                var tCountryCodes = nav.countries;
                CountryTeleCodes.DataSource = tCountryCodes;
                CountryTeleCodes.DataValueField = "Telephone_Code";
                CountryTeleCodes.DataTextField = "Telephone_Code";
                CountryTeleCodes.DataBind();
                CountryTeleCodes.Items.Insert(0, new ListItem("--select Country Code--", ""));

                var postCodes = nav.postcodes;
                postalAddress.DataSource = postCodes;
                postalAddress.DataValueField = "Code";
                postalAddress.DataTextField = "Code";
                postalAddress.DataBind();
                postalAddress.Items.Insert(0, new ListItem("--select Postal Address--", ""));



            }
        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string RequesttoCreateAccount(string tagencyName, string tresidenctialAddress, string tpostalAddress, string ttelephoneNumber, string talternativePhoneNumber, string twhatsAppNo, string temailAddress, string twebsite, string tcontactName, string browsedFile, string tCity, string tpostaLAddressPoBox)
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


                    string status = Config.ObjNav.FnRegistration(tagencyName, ttelephoneNumber, tresidenctialAddress, tpostalAddress, talternativePhoneNumber, twhatsAppNo, twebsite, temailAddress, tcontactName, tCity, tpostaLAddressPoBox);
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

        protected void postalAddress_SelectedIndexChanged(object sender, EventArgs e)
        {
            var nav = new Config().ReturnNav();
            var cities = nav.postcodes.Where(r => r.Code == postalAddress.SelectedValue);
            foreach (var myCity in cities)
            {
                city.Text = myCity.City;

            }
        }

        protected void btn_accountcreation_Click(object sender, EventArgs e)
        {

            bool error = false;
            string msg = "";
            int txtresidence = 0;
            int txtapplicanttype = 0;
            int txtservicetype = 0;
            string tresidenctialAddress = "";
            string tagencyName = agencyName.Text.Trim();

            string BuildingName = residentialAddress.Text.Trim();
            string tStreetName = StreetName.Text.Trim();
            string tFloorNumber = FloorNumber.Text.Trim();
            string tRoomNumber = RoomNumber.Text.Trim();


            string tpostalAddress = postalAddress.SelectedValue.Trim();
            string ttelephoneNumber = telephoneNo.Text;
            string talternativePhoneNumber = alternativePhoneNumber.Text.Trim();
            string twhatsAppNo = whatsAppNo.Text.Trim();
            string temailAddress = emailAddress.Text.Trim();
            string twebsite = website.Text.Trim();
            string tcontactName = contactName.Text.Trim();
            string tCity = city.Text.Trim();
            string tpostaLAddressPoBox = postaLAddressPoBox.Text.Trim();

            tresidenctialAddress = BuildingName +" "+ tStreetName +" "+ tFloorNumber + " "+tRoomNumber;


            DateTime txtstartdate = new DateTime();


            decimal txtfees = 0;


            if (error)
            {
                acccountfeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
            else
            {


                try
                {
                    

                    string docNo = Convert.ToString(Session["ApplicationNo"]);
                    string status = Config.ObjNav.FnRegistration(tagencyName, ttelephoneNumber, tresidenctialAddress, tpostalAddress, talternativePhoneNumber, twhatsAppNo, twebsite, temailAddress, tcontactName, tCity, tpostaLAddressPoBox);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        string appNo = info[2];
                        String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";

                        if (FileUpload.HasFile)
                        {
                            try
                            {
                                if (Directory.Exists(filesFolder))
                                {
                                    String extension = System.IO.Path.GetExtension(FileUpload.FileName);
                                    if (new Config().IsAllowedExtension(extension))
                                    {
                                        String ApplicationNo = appNo;
                                        ApplicationNo = ApplicationNo.Replace('/', '_');
                                        ApplicationNo = ApplicationNo.Replace(':', '_');
                                        String documentDirectory = filesFolder + ApplicationNo + "/";                                     
                                      
                                        Boolean createDirectory = true;
                                        try
                                        {
                                            if (!Directory.Exists(documentDirectory))
                                            {
                                                Directory.CreateDirectory(documentDirectory);
                                            }
                                        }
                                        catch (Exception)
                                        {
                                            createDirectory = false;
                                            acccountfeedback.InnerHtml =
                                                                            "<div class='alert alert-danger'>We could not create a directory for your documents. Please try again" +
                                                                            "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                        }
                                        if (createDirectory)
                                        {
                                            string filename = documentDirectory + FileUpload.FileName;
                                            if (File.Exists(filename))
                                            {
                                                acccountfeedback.InnerHtml =
                                                                                   "<div class='alert alert-danger'>A document with the given name already exists. Please delete it before uploading the new document or rename the new document<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                            }
                                            else
                                            {
                                                FileUpload.SaveAs(filename);
                                                if (File.Exists(filename))
                                                {

                                                    Config.navExtender.AddLinkToRecord("Customer Registration Request", ApplicationNo, filename, "");


                                                }
                                                else
                                                {
                                                    acccountfeedback.InnerHtml =
                                                        "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                                }
                                            }
                                        }
                                    }
                                    else
                                    {
                                        acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }

                                }
                                else
                                {
                                    acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document's root folder defined does not exist in the server. Please contact support. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                }

                            }
                            catch (Exception ex)
                            {
                                acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                            }
                        }
                        else
                        {
                            acccountfeedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";


                        }


                        acccountfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";                        
                      
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS", "setTimeout(function() { window.location.replace('Login.aspx') }, 5000);", true);



                    }
                    else
                    {
                        acccountfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }

                catch (Exception m)
                {
                    acccountfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
        }


            

    //String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";

    //if (FileUpload.HasFile)
    //{
    //    try
    //    {
    //        if (Directory.Exists(filesFolder))
    //        {
    //            String extension = System.IO.Path.GetExtension(FileUpload.FileName);
    //            if (new Config().IsAllowedExtension(extension))
    //            {
    //                //string tDocCode = DocCode.Text.Trim();

    //                //String ApplicationNo = Request.QueryString["ApplicationNo"];
    //                //ApplicationNo = ApplicationNo.Replace('/', '_');
    //                //ApplicationNo = ApplicationNo.Replace(':', '_');
    //                String documentDirectory = filesFolder + "Registration" + "/";
    //                Boolean createDirectory = true;
    //                try
    //                {
    //                    if (!Directory.Exists(documentDirectory))
    //                    {
    //                        Directory.CreateDirectory(documentDirectory);
    //                    }
    //                }
    //                catch (Exception)
    //                {
    //                    createDirectory = false;
    //                    acccountfeedback.InnerHtml =
    //                                                    "<div class='alert alert-danger'>We could not create a directory for your documents. Please try again" +
    //                                                    "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

    //                }
    //                if (createDirectory)
    //                {
    //                    string filename = documentDirectory + FileUpload.FileName;
    //                    if (File.Exists(filename))
    //                    {
    //                        acccountfeedback.InnerHtml =
    //                                                           "<div class='alert alert-danger'>A document with the given name already exists. Please delete it before uploading the new document or rename the new document<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

    //                    }
    //                    else
    //                    {
    //                        FileUpload.SaveAs(filename);
    //                        if (File.Exists(filename))
    //                        {

    //                            Config.navExtender.AddLinkToRecord("License_Application Card", "", filename, "");                                     


    //                        }
    //                        else
    //                        {
    //                            acccountfeedback.InnerHtml =
    //                                "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
    //                        }
    //                    }
    //                }
    //            }
    //            else
    //            {
    //                acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
    //            }

    //        }
    //        else
    //        {
    //            acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document's root folder defined does not exist in the server. Please contact support. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
    //        }

    //    }
    //    catch (Exception ex)
    //    {
    //        acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

    //    }
    //}
    //else
    //{
    //    acccountfeedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";


    //}




        protected void attachDocumnt(object sender, EventArgs e)
        {
            String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";

            if (FileUpload.HasFile)
            {
                try
                {
                    if (Directory.Exists(filesFolder))
                    {
                        String extension = System.IO.Path.GetExtension(FileUpload.FileName);
                        if (new Config().IsAllowedExtension(extension))
                        {
                           
                            String documentDirectory = filesFolder + "Registration" + "/";
                            Boolean createDirectory = true;
                            try
                            {
                                if (!Directory.Exists(documentDirectory))
                                {
                                    Directory.CreateDirectory(documentDirectory);
                                }
                            }
                            catch (Exception)
                            {
                                createDirectory = false;
                                acccountfeedback.InnerHtml =
                                                                "<div class='alert alert-danger'>We could not create a directory for your documents. Please try again" +
                                                                "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                            }
                            if (createDirectory)
                            {
                                string filename = documentDirectory + FileUpload.FileName;
                                if (File.Exists(filename))
                                {
                                    acccountfeedback.InnerHtml =
                                                                       "<div class='alert alert-danger'>A document with the given name already exists. Please delete it before uploading the new document or rename the new document<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                }
                                else
                                {
                                    FileUpload.SaveAs(filename);
                                    if (File.Exists(filename))
                                    {

                                        Config.navExtender.AddLinkToRecord("License_Application Card", "", filename, "");


                                    }
                                    else
                                    {
                                        acccountfeedback.InnerHtml =
                                            "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }
                                }
                            }
                        }
                        else
                        {
                            acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        }

                    }
                    else
                    {
                        acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document's root folder defined does not exist in the server. Please contact support. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
                catch (Exception ex)
                {
                    acccountfeedback.InnerHtml = "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                }
            }
            else
            {
                acccountfeedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";


            }
        }
    }
}