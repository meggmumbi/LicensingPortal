using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class NewApplication : System.Web.UI.Page
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


                var postC = nav.postcodes.ToList();
                postCode.DataSource = postC;
                postCode.DataTextField = "City";
                postCode.DataValueField = "Code";
                postCode.DataBind();
                postCode.Items.Insert(0, new ListItem("--select--", ""));

                var Countyz = nav.county.ToList();
                county.DataSource = Countyz;
                county.DataTextField = "Description";
                county.DataValueField = "Code";
                county.DataBind();
                county.Items.Insert(0, new ListItem("--select--", ""));


                var Facilities = nav.AgencyFacilitiesCategories.ToList();
                facilityDescription.DataSource = Facilities;
                facilityDescription.DataTextField = "Description";
                facilityDescription.DataValueField = "Code";
                facilityDescription.DataBind();
                facilityDescription.Items.Insert(0, new ListItem("--select--", ""));


                var Activities = nav.AgencyActivitiesSetup.ToList();
                AgencyActivity.DataSource = Activities;
                AgencyActivity.DataTextField = "Description";
                AgencyActivity.DataValueField = "Code";
                AgencyActivity.DataBind();
                AgencyActivity.Items.Insert(0, new ListItem("--select--", ""));

                var Compliance = nav.AgencyComplianceSetup.ToList();
                certificateType.DataSource = Compliance;
                certificateType.DataTextField = "Description";
                certificateType.DataValueField = "Code";
                certificateType.DataBind();
                certificateType.Items.Insert(0, new ListItem("--select--", ""));


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
                int tApplicationCategory = Convert.ToInt32(category.SelectedValue.Trim());
                int tapplicantType = Convert.ToInt32(ApplicantType.SelectedValue.Trim());
                string tInstitutionuniversity = Institutionuniversity.Text.Trim();
                string temail = email.Text.Trim();
                string txtcountry = country.SelectedValue;
                string ttPhysicalLocation = PhysicalLocation.Text.Trim();
                string tCustomerNumber = Convert.ToString(Session[""]);



                DateTime txtstartdate = new DateTime();
                //try
                //{
                //    txtstartdate = DateTime.ParseExact(nstartdate, "d/M/yyyy", CultureInfo.InvariantCulture);
                //}
               // catch (Exception)
                //{
                //    error = true;
                //    msg += msg.Length > 0 ? "<br/>" : "";
                //    msg += "Please provide a valid start date";
                //}
               
                //DateTime txtenddate = new DateTime();
                //try
                //{
                //    txtenddate = DateTime.ParseExact(nenddate, "d/M/yyyy", CultureInfo.InvariantCulture);
                //}
                //catch (Exception)
                //{
                //    error = true;
                //    msg += msg.Length > 0 ? "<br/>" : "";
                //    msg += "Please provide a valid end date";
                //}
              
                decimal txtfees = 0;


                if (error)
                {
                    linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    string docNo = Convert.ToString(Session["ApplicationNo"]);
                    String status = Config.ObjNav.FnLicenceApplicationHeader(temail, docNo, tApplicationCategory, tapplicantType, ttPhysicalLocation, tPhysicalAddressStatus, tLicenceType, tCustomerNumber);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
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

        protected void Nexttostep2_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("NewApplication.aspx?step=2&&ApplicationNo="+docNo);
        }

        //protected void nexttostep3_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        bool error = false;
        //        string msg = "";
        //        string tpaymenttype = paymenttype.SelectedValue;
        //        string treferenceno = referenceno.Text.Trim();
        //        string nreturndate = returndate.Text.Trim();
        //        DateTime treturndate = new DateTime();
        //        try
        //        {
        //            treturndate = DateTime.ParseExact(nreturndate, "d/M/yyyy", CultureInfo.InvariantCulture);
        //        }
        //        catch (Exception)
        //        {
        //            error = true;
        //            msg += msg.Length > 0 ? "<br/>" : "";
        //            msg += "Please provide a transaction date";
        //        }
        //        if (!paymentdocument.HasFile)
        //        {
        //            error = true;
        //            msg += msg.Length > 0 ? "<br/>" : "";
        //            msg += "Please attach payment document to proceed";
        //        }
        //        if (error)
        //        {
        //            linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //        }
        //        else
        //        {
        //            string docNo = Convert.ToString(Session["ApplicationNo"]);
        //            String status = ""; /*Config.ObjNav.FnAddPaymentDetails(docNo, tpaymenttype, treturndate, treferenceno);*/
        //            String[] info = status.Split('*');
        //            if (info[0] == "success")
        //            {
        //                string accreditationNo = info[2];
        //                accreditationNo = accreditationNo.Replace('/', '_');
        //                accreditationNo = accreditationNo.Replace(':', '_');
        //                string path1 = Config.FilesLocation() + "Unprocessed Insitution/";
        //                string str1 = Convert.ToString(accreditationNo);
        //                string folderName = path1 + str1 + "/";
        //                try
        //                {
        //                    if (paymentdocument.HasFile)
        //                    {
        //                        string extension = System.IO.Path.GetExtension(paymentdocument.FileName);
        //                        if (extension == ".pdf" || extension == ".PDF" || extension == ".Pdf")
        //                        {
        //                            string filename = "PAYMENT_DOCUMENT" + extension;
        //                            if (!Directory.Exists(folderName))
        //                            {
        //                                Directory.CreateDirectory(folderName);
        //                            }
        //                            if (File.Exists(folderName + filename))
        //                            {
        //                                File.Delete(folderName + filename);
        //                            }
        //                            paymentdocument.SaveAs(folderName + filename);
        //                            if (File.Exists(folderName + filename))
        //                            {
        //                                String res = "";/*Config.ObjNav.FnAddPaymentDetails(docNo, tpaymenttype, treturndate, treferenceno);*/
        //                                String[] inf = res.Split('*');
        //                                if (inf[0] == "success")
        //                                {
        //                                    paymentfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //                                }
        //                            }
        //                        }
        //                        else
        //                        {
        //                            error = true;
        //                            msg += msg.Length > 0 ? "<br>" : "";
        //                            msg += "The file extension of the payment document is not allowed,Kindly upload pdf files only";
        //                        }

        //                    }
        //                    else
        //                    {
        //                        error = true;
        //                        msg += msg.Length > 0 ? "<br>" : "";
        //                        msg += "The file extension of the payment document is not allowed,Kindly upload pdf files only";

        //                    }
        //                }
        //                catch (Exception ex)
        //                {
        //                    error = true;
        //                    msg += msg.Length > 0 ? "<br>" : "";
        //                    msg += "The file extension of the Application Letter is not allowed,Kindly upload pdf files only" + ex;
        //                }
        //            }
        //            else
        //            {
        //                paymentfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //            }
        //        }
        //    }
        //    catch (Exception m)
        //    {
        //        paymentfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
        //    }
        //    Response.Redirect("NewApplication.aspx?step=3");
        //}

        protected void backtostep1_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["ApplicationNo"];          
            Response.Redirect("NewApplication.aspx?step=1&&applicationNo="+docNo);
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
            Response.Redirect("NewApplication.aspx?ApplicationNo=" + str + "&step=" + num2);
        }
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
            Response.Redirect("NewApplication.aspx?ApplicationNo=" + str + "&step=" + num2);
        }

        protected void backtostep2_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewApplication.aspx?step=2");
        }

        protected void submitapplicationtocue_Click(object sender, EventArgs e)
        {

        }

        protected void printreport_Click(object sender, EventArgs e)
        {
            string docNo = Convert.ToString(Session["ApplicationNo"]);
            Response.Redirect("ApplicationFinalReport.aspx?ApplicationNo=" +docNo);
        }

        protected void physicalAddressLocation_Click(object sender, EventArgs e)
        {
            try
            {
                bool error = false;
                string msg = "";
                
                string tphysicalLocation = physicalLocationdetails.Text.Trim();               
                string tlocationAddress = locationAddress.Text.Trim();
                string tpostCode = postCode.SelectedValue.Trim();
                string tcounty = county.SelectedValue.Trim();
                string tcity = city.Text.Trim();
                string tApplicationNo = Request.QueryString["ApplicationNo"];



                DateTime txtstartdate = new DateTime();
                //try
                //{
                //    txtstartdate = DateTime.ParseExact(nstartdate, "d/M/yyyy", CultureInfo.InvariantCulture);
                //}
                // catch (Exception)
                //{
                //    error = true;
                //    msg += msg.Length > 0 ? "<br/>" : "";
                //    msg += "Please provide a valid start date";
                //}

                //DateTime txtenddate = new DateTime();
                //try
                //{
                //    txtenddate = DateTime.ParseExact(nenddate, "d/M/yyyy", CultureInfo.InvariantCulture);
                //}
                //catch (Exception)
                //{
                //    error = true;
                //    msg += msg.Length > 0 ? "<br/>" : "";
                //    msg += "Please provide a valid end date";
                //}

                decimal txtfees = 0;


                if (error)
                {
                    physicalLocations.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {
                    
                    String status = Config.ObjNav.FnInsertLocation(tApplicationNo, tlocationAddress, tphysicalLocation, tpostCode, tcounty, tcity);
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

        protected void Facility_Click(object sender, EventArgs e)
        {
            try
            {
                bool error = false;
                string msg = "";

                string tfacilityCode = facilityDescription.SelectedValue.Trim();
                int tQuantity = Convert.ToInt32(quantity.Text.Trim());               
                string tApplicationNo = Request.QueryString["ApplicationNo"];                
               
                decimal txtfees = 0;


                if (error)
                {
                    AgencyFacilities.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {

                    String status = Config.ObjNav.FnInsertAgentFacilities(tApplicationNo, tfacilityCode, tQuantity,"");
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

        protected void backToPhysical_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("NewApplication.aspx?step=2&&applicationNo=" + docNo);
        }

        protected void activity_Click(object sender, EventArgs e)
        {
            try
            {
                bool error = false;
                string msg = "";

                string tAgencyActivity = AgencyActivity.SelectedValue.Trim();
                string tdescription = description.Text.Trim();
                string tApplicationNo = Request.QueryString["ApplicationNo"];

                decimal txtfees = 0;


                if (error)
                {
                    AgencyActivitys.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {

                    String status = Config.ObjNav.FnInsertAgencyActivities(tApplicationNo, tAgencyActivity);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        AgencyActivitys.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                    else
                    {
                        AgencyActivitys.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                AgencyActivitys.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void backFacility_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("NewApplication.aspx?step=3&&applicationNo=" + docNo);
        }

        protected void BackActivity_Click(object sender, EventArgs e)
        {
            string docNo = Request.QueryString["ApplicationNo"];
            Response.Redirect("NewApplication.aspx?step=4&&applicationNo=" + docNo);
        }

        protected void governement_Click(object sender, EventArgs e)
        {
            try
            {
                bool error = false;
                string msg = "";

                string tcertificateType = certificateType.SelectedValue.Trim();
                string tcertificatenumber = certificatenumber.Text.Trim();
                DateTime tissueDate = Convert.ToDateTime(issueDate.Text.Trim());
                DateTime texpiryDate = Convert.ToDateTime(expiryDate.Text.Trim());
                string tAuthority = Authority.Text.Trim();
                string tApplicationNo = Request.QueryString["ApplicationNo"];

                decimal txtfees = 0;


                if (error)
                {
                    governemt.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
                else
                {

                    String status = Config.ObjNav.FnInsertGovernmentCompliance(tApplicationNo, tcertificateType, tcertificateType, tcertificatenumber, tissueDate, texpiryDate, tAuthority);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {
                        governemt.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                    else
                    {
                        governemt.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }
                }
            }
            catch (Exception m)
            {
                governemt.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
        }

        protected void postCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            var nav = new Config().ReturnNav();
            var cities = nav.postcodes.Where(r => r.Code == postCode.SelectedValue);
            foreach (var myCity in cities)
            {
                city.Text = myCity.City;
            }
        }
    }
}