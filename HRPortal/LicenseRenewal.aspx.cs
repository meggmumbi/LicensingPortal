using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class LicenseRenewal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                var nav = new Config().ReturnNav();

                var countries = nav.Countries.ToList();
                country.DataSource = countries;
                country.DataTextField = "Name";
                country.DataValueField = "Code";
                country.DataBind();
                country.Items.Insert(0, new ListItem("--select--", ""));

                country.SelectedValue = "KE";

              

                HOAC.DataSource = countries;
                HOAC.DataTextField = "Name";
                HOAC.DataValueField = "Code";
                HOAC.DataBind();
                HOAC.Items.Insert(0, new ListItem("--select--", ""));

                HOAC.SelectedValue = "KE";

                var Countyz = nav.County.ToList();
                county.DataSource = Countyz;
                county.DataTextField = "Description";
                county.DataValueField = "Code";
                county.DataBind();
                county.Items.Insert(0, new ListItem("--select--", ""));


                CountryNationality.DataSource = countries;
                CountryNationality.DataTextField = "Name";
                CountryNationality.DataValueField = "Code";
                CountryNationality.DataBind();
                CountryNationality.Items.Insert(0, new ListItem("--select--", ""));


                countryStudy.DataSource = countries;
                countryStudy.DataTextField = "Name";
                countryStudy.DataValueField = "Code";
                countryStudy.DataBind();
                countryStudy.Items.Insert(0, new ListItem("--select--", ""));

                countryStudy.SelectedValue = "KE";

                if (countryStudy.SelectedValue == "KE")
                {
                    kenLoc.Visible = true;
                }


                    var LicenseType = nav.LicenceTypeList.ToList();
                licenseType.DataSource = LicenseType;
                licenseType.DataTextField = "Description";
                licenseType.DataValueField = "Code";
                licenseType.DataBind();
                licenseType.Items.Insert(0, new ListItem("--select--", ""));

                email.Text = Convert.ToString(Session["email"]);



                string docNo = Request.QueryString["ApplicationNo"];
            if (docNo != null)
            {
                var data = nav.LicenceApplicationHeader.Where(x => x.Application_No == docNo).ToList();
                if (data.Count > 0)
                {
                    

                        foreach (var item in data)
                        {
                            licenseType.SelectedValue = item.Licence_Type;
                            string addresTyp = item.Physical_Address_Status;
                            string AppCategory = item.Application_Category;
                            string appType = item.Applicant_Type;
                            country.SelectedValue = item.Country_Region_Code;
                            PhysicalLocation.Text = item.Physical_Location;
                            certNo.Text = item.Registration_Certificate;
                            txtDateInc.Text = Convert.ToString(item.Registration_Date);
                            email.Text = item.Email;
                            string certificateType = item.Certificate_Type;
                            hoaName.Text = item.HOA_Name;
                            HOAC.SelectedValue = item.HOA_Country;
                            string formCizizen = item.HOA_Form_of_Citizenship;
                            string citizenshipTypeS = item.Citizenship_Type;
                            hoaId.Text = item.HOA_ID_NO;
                            hoaPass.Text = item.HOA_Passport_No;
                            HoaDesignation.Text = item.HOA_Designation;
                            HeadPhone.Text = item.HOA_Telephone_No;
                            hoaWhatsapp.Text = item.HOA_Whatsapp_No;
                            headEmail.Text = item.HOA_Email_Address;
                            PayingAmount.Text = Convert.ToString(item.Application_Amount);


                            PhysicalLocation.Text = item.Building_Name;
                            StreetName.Text = item.Street_Name;
                            FloorNumber.Text = item.Floor_Name;
                            RoomNumber.Text = item.Room_Number;

                            if (addresTyp == "Owned")
                            {
                                addrresstype.SelectedValue = "1";
                            }
                            else if (addresTyp == "Leased")
                            {
                                addrresstype.SelectedValue = "2";
                            }

                            if (formCizizen == "Birth")
                            {
                                hoacitizen.SelectedValue = "1";
                            }
                            else if (formCizizen == "Naturalization")
                            {
                                hoacitizen.SelectedValue = "2";
                            }
                            if (certificateType == "Certificate of Incorporation")
                            {
                                certType.SelectedValue = "1";
                            }
                            else if (certificateType == "Certificate of Registration")
                            {
                                certType.SelectedValue = "2";
                            }
                            if (citizenshipTypeS == "Local")
                            {
                                citizenshipType.SelectedValue = "1";
                            }
                            else if (citizenshipTypeS == "Foreign")
                            {
                                citizenshipType.SelectedValue = "2";
                            }


                            Session["ApplicationNo"] = item.Application_No;
                            
                        }

                    }
                }
            }
          }


        protected void addapplication_Click(object sender, EventArgs e)
        {
            try
            {
                bool error = false;
                string msg = "";
                int txtresidence = 0;
                int txtapplicanttype = 0;
                int txtservicetype = 0;

                string tLicenceType = licenseType.SelectedValue.Trim();
                int tPhysicalAddressStatus = Convert.ToInt32(addrresstype.SelectedValue.Trim());

                string temail = email.Text.Trim();
                string txtcountry = country.SelectedValue;
                string ttPhysicalLocation = PhysicalLocation.Text.Trim();
                string tcertNo = certNo.Text.Trim();
                DateTime tIncorpDate = Convert.ToDateTime(txtDateInc.Text.Trim());
                string tCustomerNumber = Convert.ToString(Session["InstitutionNo"]);
                string thoaName = hoaName.Text.Trim();
                string tcountryCitizen = HOAC.SelectedValue.Trim();
                int tformCitizen = Convert.ToInt32(hoacitizen.SelectedValue.Trim());
                string thoaId = hoaId.Text.Trim();
                string thoaPass = hoaPass.Text.Trim();
                string tHoaDesignation = HoaDesignation.Text.Trim();
                string tHeadPhone = HeadPhone.Text.Trim();
                string thoaWhatsapp = hoaWhatsapp.Text.Trim();
                string theadEmail = headEmail.Text.Trim();
                int certificateType = Convert.ToInt32(certType.SelectedValue);

                string BuildingName = PhysicalLocation.Text.Trim();
                string tStreetName = StreetName.Text.Trim();
                string tFloorNumber = FloorNumber.Text.Trim();
                string tRoomNumber = RoomNumber.Text.Trim();

                var dateValue = tIncorpDate as DateTime? ?? new DateTime();



                if (dateValue.Date > DateTime.Now.Date)
                {
                    error = true;
                    msg = "Date value should not be a future date";

                }



                DateTime txtstartdate = new DateTime();


                decimal txtfees = 0;


                if (error)
                {
                    linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    string docNo = Convert.ToString(Session["ApplicationNo"]);
                    String status = Config.ObjNav.FnLicenceApplicationHeader(temail, docNo, tPhysicalAddressStatus, tLicenceType, tCustomerNumber, tcertNo,
                      tIncorpDate, thoaName, tcountryCitizen, tformCitizen, thoaId, thoaPass, tHoaDesignation, tHeadPhone, thoaWhatsapp, theadEmail, certificateType,
                      BuildingName, tStreetName, tFloorNumber, tRoomNumber);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        Session["ApplicationNo"] = info[2];
                        Nexttostep2.Visible = true;
                        linesfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        Response.Redirect("LicenseRenewal.aspx?step=2&&ApplicationNo=" + info[2]);



                    }
                    else
                    {
                        linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string selectedFacilities(List<Targets> targetNumber)
        {

            HtmlGenericControl NewControl = new HtmlGenericControl();
            var results = (dynamic)null;
            int category = 0;
            string part = "";

            try
            {
                if (targetNumber == null)
                {
                    targetNumber = new List<Targets>();
                }
                NewControl.ID = "feedback";

                foreach (Targets target in targetNumber)
                {


                    if (target.quantity == "")
                    {

                        target.quantity = String.IsNullOrWhiteSpace(target.quantity) ? "0" : target.quantity; ;
                    }

                    string InitiativeNumber = target.TargetNumber;
                    var nav1 = new Config().ReturnNav();




                    var status = Config.ObjNav.FnInsertRenewalacilities(target.ApplicationNo, target.TargetNumber, Convert.ToInt32(target.quantity), target.category,Convert.ToInt32(target.adequacy));
                    string[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        NewControl.ID = "feedback";
                        NewControl.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        results = info[0];
                    }
                    else if (info[0] == "danger")
                    {

                        NewControl.ID = "feedback";
                        NewControl.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        results = info[1];


                    }


                }

            }
            catch (Exception ex)
            {
                results = ex.Message;
            }
            return results;
        }

        //protected void nationality_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    string tnationality = nationality.SelectedValue.Trim();
        //    if (tnationality == "2")
        //    {
        //        country.Visible = true;
        //    }
        //    else if (tnationality == "1")
        //    {
        //        country.Visible = false;
        //    }
        //}

        //protected void studentButton_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        bool error = false;
        //        string msg = "";
        //        string tApplicationNo = Request.QueryString["ApplicationNo"];
        //        string tstudentName = studentName.Text.Trim();
        //        int tgender = Convert.ToInt32(gender.SelectedValue.Trim());
        //        string tcountryOfOrigin = CountryNationality.SelectedValue.Trim();
        //        string tiIdNumber = idnumber.Text.Trim();
        //        string tAcademic = academic.SelectedValue.Trim();
        //        string tuniversityCountry = universityCountry.SelectedValue.Trim();
        //        DateTime trecruitedDate = Convert.ToDateTime(recruitedDate.Text.Trim());
        //        string tuniversityName = universityName.Text.Trim();
        //        string tPassportNo = passportNo.Text.Trim();



        //        decimal txtfees = 0;


        //        if (error)
        //        {
        //            keyStaff.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //        }
        //        else
        //        {

        //            String status = ""; /*Config.ObjNav.FnInsertStudentDetails(tApplicationNo, tstudentName, tgender, tcountryOfOrigin, tiIdNumber, tiIdNumber, tAcademic, tuniversityCountry, trecruitedDate, tuniversityName, tPassportNo);*/
        //            String[] info = status.Split('*');
        //            if (info[0] == "success")
        //            {
        //                keyStaff.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //            }
        //            else
        //            {
        //                keyStaff.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //            }
        //        }
        //    }
        //    catch (Exception m)
        //    {
        //        keyStaff.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //    }
        //}
        protected void nextstep_Click(object sender, EventArgs e)
        {
            int num1;
            string str;
            try
            {
                num1 = Convert.ToInt32(Request.QueryString["step"].Trim());
                str = Request.QueryString["ApplicationNo"].Trim();

            }
            catch (Exception ex)
            {
                num1 = 0;
                str = "";
            }
            int num2 = num1 + 1;
            Response.Redirect("LicenseRenewal.aspx?ApplicationNo=" + str + "&step=" + num2);
        }
        protected void previousstep_Click(object sender, EventArgs e)
        {
            int num1;
            string str;
            try
            {
                num1 = Convert.ToInt32(Request.QueryString["step"].Trim());
                str = Request.QueryString["ApplicationNo"].Trim();

            }
            catch (Exception ex)
            {
                num1 = 0;
                str = "";
            }
            int num2 = num1 - 1;
            Response.Redirect("LicenseRenewal.aspx?ApplicationNo=" + str + "&step=" + num2);
        }

        protected void nextClick_Click(object sender, EventArgs e)
        {
           string ApplicationNo = Convert.ToString(Request.QueryString["ApplicationNo"]);
            Response.Redirect("LicenseRenewal.aspx?step=2&&ApplicationNo=" + ApplicationNo);
        }


        protected void submitApplication_Click(object sender, EventArgs e)
        {

                try
                {
                    String tapplicationNo = Request.QueryString["ApplicationNo"];

                    Boolean error = false;
                    String message = "";

                    if (string.IsNullOrEmpty(tapplicationNo))
                    {
                        error = true;
                        message = "An application with the given applcationNo does not exist";
                    }

                    String status = Config.ObjNav.FnSubmitApplication(tapplicationNo);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                    feedback.InnerHtml = "<div class='alert alert-" + info[0] + "'>" + info[1] + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS", "setTimeout(function() { window.location.replace('OpenRenewalApplications.aspx') }, 5000);", true);
                }
                    else
                    {

                    feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
                catch (Exception t)
                {
                feedback.InnerHtml = "<div class='alert alert-danger'>" + t.Message + "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }


            }
          

        
        protected void payment_Click(object sender, EventArgs e)
        {

            try
            {

                string paymentreference = PayRef.Text.Trim();
                String ApplicationNo = Request.QueryString["ApplicationNo"];
                var status = Config.ObjNav.FnConfirmPayment(ApplicationNo, paymentreference,"");
                String[] info = status.Split('*');
                if (info[0] == "success")
                {

                    submit.Visible = true;

                    bool error = false;
                    string msg = "";
                    string accreditationNo = Request.QueryString["ApplicationNo"];
                    accreditationNo = accreditationNo.Replace('/', '_');
                    accreditationNo = accreditationNo.Replace(':', '_');
                    string path1 = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";
                    String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";
                    string str1 = Convert.ToString(accreditationNo);
                    string folderName = path1 + str1 + "/";
                    bool paymentsDocUploaded = false;
                    try
                    {
                        if (FileUpload1.HasFile)
                        {
                            try
                            {
                                if (Directory.Exists(filesFolder))
                                {
                                    String extension = System.IO.Path.GetExtension(FileUpload1.FileName);
                                    if (new Config().IsAllowedExtension(extension))
                                    {

                                        
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
                                            feedback.InnerHtml =
                                                                            "<div class='alert alert-danger'>We could not create a directory for your documents. Please try again" +
                                                                            "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                        }
                                        if (createDirectory)
                                        {
                                            string filename = documentDirectory + FileUpload1.FileName;
                                            if (File.Exists(filename))
                                            {
                                                feedback.InnerHtml =
                                                                                   "<div class='alert alert-danger'>A document with the given name already exists. Please delete it before uploading the new document or rename the new document<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                            }
                                            else
                                            {
                                                FileUpload1.SaveAs(filename);
                                                if (File.Exists(filename))
                                                {
                                                    Config.navExtender.AddLinkToRecord("License_Application Card", ApplicationNo, filename, "");

                                                }
                                                else
                                                {
                                                    feedback.InnerHtml =
                                                        "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                                }
                                            }
                                        }
                                    }
                                    else
                                    {
                                        feedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }

                                }
                                else
                                {
                                    feedback.InnerHtml = "<div class='alert alert-danger'>The document's root folder defined does not exist in the server. Please contact support. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                }

                            }
                            catch (Exception ex)
                            {
                                feedback.InnerHtml = "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                            }
                        }
                        else
                        {
                            feedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";


                        }
                    }
                    catch (Exception)
                    {
                        feedback.InnerHtml = ("The Payments Details Could Not Be Captured Kindly Contact the System Administrator");
                    }
                    feedback.InnerHtml =
                    "<div class='alert alert-success'>The document was successfully uploaded. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    feedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }


                
                
            }
            catch (Exception y)
            {
                feedback.InnerHtml = "<div class='alert alert-danger'>" + y.Message + "</div>";
            }

        }

        protected void citizenshipType_SelectedIndexChanged(object sender, EventArgs e)
        {
            string citizent = citizenshipType.SelectedValue.Trim();
            if (citizent == "2")
            {
                foreignCitiz.Visible = true;

            }
            else if (citizent == "1")
            {
                foreignCitiz.Visible = false;
            }
        }

        protected void HOAC_SelectedIndexChanged(object sender, EventArgs e)
        {
            string country = HOAC.SelectedValue.Trim();
            if (country != "KE")
            {
                local.Visible = false;
                foreign.Visible = true;
            }

        }

        protected void uploadDoc_Click(object sender, EventArgs e)
        {

            String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";

            if (uploadfile.HasFile)
            {
                try
                {
                    if (Directory.Exists(filesFolder))
                    {
                        String extension = System.IO.Path.GetExtension(uploadfile.FileName);
                        if (new Config().IsAllowedExtension(extension))
                        {
                            string tDocCode = DocCode.Text.Trim();

                            String ApplicationNo = Request.QueryString["ApplicationNo"];
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
                                documentsfeedback.InnerHtml =
                                                                "<div class='alert alert-danger'>We could not create a directory for your documents. Please try again" +
                                                                "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                            }
                            if (createDirectory)
                            {
                                string filename = documentDirectory + uploadfile.FileName + "_" + tDocCode;
                                if (File.Exists(filename))
                                {
                                    documentsfeedback.InnerHtml =
                                                                       "<div class='alert alert-danger'>A document with the given name already exists. Please delete it before uploading the new document or rename the new document<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                }
                                else
                                {
                                    uploadfile.SaveAs(filename);
                                    if (File.Exists(filename))
                                    {

                                        Config.navExtender.AddLinkToRecord("License renewal Card", ApplicationNo, filename, "");
                                        var status = Config.ObjNav.FnAddDocumentsLinks(ApplicationNo, tDocCode, filename);
                                        String[] info = status.Split('*');
                                        if (info[0] == "success")
                                        {
                                            documentsfeedback.InnerHtml =
                                            "<div class='alert alert-success'>The document was successfully uploaded. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                        }
                                        else
                                        {
                                            documentsfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                        }

                                    }
                                    else
                                    {
                                        documentsfeedback.InnerHtml =
                                            "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }
                                }
                            }
                        }
                        else
                        {
                            documentsfeedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        }

                    }
                    else
                    {
                        documentsfeedback.InnerHtml = "<div class='alert alert-danger'>The document's root folder defined does not exist in the server. Please contact support. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
                catch (Exception ex)
                {
                    documentsfeedback.InnerHtml = "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                }
            }
            else
            {
                documentsfeedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";


            }
        }

        //protected void uploadDocument_Click(object sender, EventArgs e)
        //{
        //    String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";

        //    if (document.HasFile)
        //    {
        //        try
        //        {
        //            if (Directory.Exists(filesFolder))
        //            {
        //                String extension = System.IO.Path.GetExtension(document.FileName);
        //                if (new Config().IsAllowedExtension(extension))
        //                {


        //                    String ApplicationNo = Request.QueryString["ApplicationNo"];
        //                    ApplicationNo = ApplicationNo.Replace('/', '_');
        //                    ApplicationNo = ApplicationNo.Replace(':', '_');
        //                    String documentDirectory = filesFolder + ApplicationNo + "/";
        //                    Boolean createDirectory = true;
        //                    try
        //                    {
        //                        if (!Directory.Exists(documentDirectory))
        //                        {
        //                            Directory.CreateDirectory(documentDirectory);
        //                        }
        //                    }
        //                    catch (Exception)
        //                    {
        //                        createDirectory = false;
        //                        documentsfeedback.InnerHtml =
        //                                                        "<div class='alert alert-danger'>We could not create a directory for your documents. Please try again" +
        //                                                        "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

        //                    }
        //                    if (createDirectory)
        //                    {
        //                        string filename = documentDirectory + document.FileName;
        //                        if (File.Exists(filename))
        //                        {
        //                            documentsfeedback.InnerHtml =
        //                                                               "<div class='alert alert-danger'>A document with the given name already exists. Please delete it before uploading the new document or rename the new document<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

        //                        }
        //                        else
        //                        {
        //                            document.SaveAs(filename);
        //                            if (File.Exists(filename))
        //                            {

        //                                Config.navExtender.AddLinkToRecord("License_Application Card", ApplicationNo, filename, "");
        //                                var status = ""; /*Config.ObjNav.FnAddDocumentsLinks(ApplicationNo);*/
        //                                String[] info = status.Split('*');
        //                                if (info[0] == "success")
        //                                {
        //                                    documentsfeedback.InnerHtml =
        //                                    "<div class='alert alert-success'>The document was successfully uploaded. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //                                }
        //                                else
        //                                {
        //                                    documentsfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //                                }

        //                            }
        //                            else
        //                            {
        //                                documentsfeedback.InnerHtml =
        //                                    "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //                            }
        //                        }
        //                    }
        //                }
        //                else
        //                {
        //                    documentsfeedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //                }

        //            }
        //            else
        //            {
        //                documentsfeedback.InnerHtml = "<div class='alert alert-danger'>The document's root folder defined does not exist in the server. Please contact support. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //            }

        //        }
        //        catch (Exception ex)
        //        {
        //            documentsfeedback.InnerHtml = "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

        //        }
        //    }
        //    else
        //    {
        //        documentsfeedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";


        //    }
        //}

        protected void saveDetails_Click(object sender, EventArgs e)
        {
            try
            {
                bool error = false;
                string msg = "";               

                
                int tcourseType = Convert.ToInt32(courseType.SelectedValue);
                string tcourseName = courseName.Text.Trim();
                int tmaleNumber = Convert.ToInt32(maleNumber.Text.Trim());
                int tNumberFemales = Convert.ToInt32(NumberFemales.Text.Trim());
                string tcounty = county.Text.Trim();
                int ttotals = Convert.ToInt32(totalSum.Value);
                string tcountry = countryStudy.Text.Trim();
                string docNo = Request.QueryString["ApplicationNo"];

                if (error)
                {
                    physicalLocations.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                  
                    String status = Config.ObjNav.FnInsertStudentStatistics(docNo, tcourseType, tcourseName, tmaleNumber, tNumberFemales, tcounty, ttotals, tcountry);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        physicalLocations.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                    else
                    {
                        physicalLocations.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                physicalLocations.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void Nexttostep2_Click(object sender, EventArgs e)
        {
            string ApplicationNo = Convert.ToString(Request.QueryString["ApplicationNo"]);
            Response.Redirect("LicenseRenewal.aspx?step=2&&ApplicationNo=" + ApplicationNo);
        }
        protected void previewReport_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("ApplicationFinalReport.aspx?ApplicationNo=" + docNo);
        }

        protected void governement_Click(object sender, EventArgs e)
        {
            try
            {
                bool error = false;
                string msg = "";


               
                string tuniversityName = universityName.Text.Trim();               
                string tCountryNationality = CountryNationality.SelectedValue.Trim();
                bool tcharter =  charter.Checked;
                bool tmou = mou.Checked;
                bool tmoa = moa.Checked;
                bool tmof = mof.Checked;

                string applicationNo = Request.QueryString["ApplicationNo"];

                if (error)
                {
                    linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {

                    String status =  Config.ObjNav.FnInsertUniversity(applicationNo, tCountryNationality, tcharter, tmou, tmoa, tmof, tuniversityName);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        Session["ApplicationNo"] = info[2];
                        Nexttostep2.Visible = true;
                        linesfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                    else
                    {
                        linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void otherfacility_Click(object sender, EventArgs e)
        {
            try
            {
                bool error = false;
                string msg = "";

                //string tfacilityCode = facilityDescription.SelectedValue.Trim();
                string tOtherService = ANYotherfacility.Text.Trim();
                string tApplicationNo = Request.QueryString["ApplicationNo"];

                decimal txtfees = 0;


                if (error)
                {
                    AgencyFacilities.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {

                    String status = Config.ObjNav.FnInsertAgentFacilities(tApplicationNo, "C-009", 0, "009", tOtherService);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        AgencyFacilities.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                    else
                    {
                        AgencyFacilities.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                AgencyFacilities.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void countryStudy_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (countryStudy.SelectedValue == "KE")
            {
                kenLoc.Visible = true;
            }
            else
            {
                kenLoc.Visible = false;
            }
        }
    }
}