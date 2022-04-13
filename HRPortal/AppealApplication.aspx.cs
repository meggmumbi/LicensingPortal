using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class AppealApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                var nav = new Config().ReturnNav();
                var appealReasons = nav.AppealReason.ToList();
                AppealReason.DataSource = appealReasons;
                AppealReason.DataTextField = "Description";
                AppealReason.DataValueField = "Code";
                AppealReason.DataBind();
                AppealReason.Items.Insert(0, new ListItem("--select--", ""));

                txtDate.Text =Convert.ToString(DateTime.Now);


            }



        }

        protected void Nexttostep2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyAppealApplications.aspx");
        }

        protected void addapplication_Click(object sender, EventArgs e)
        {
            //create kicense renewal voucher


            string tAppealReason = Describe.Text;
            string InstitutionNo = Convert.ToString(Session["InstitutionNo"]);
            string msg = "";
            bool error = false;

            if (string.IsNullOrEmpty(tAppealReason))
            {
                error = true;
                msg = "Appeal Reason Field must have a value. cannot be null or empty";
            }
           
            if (error)
            {
                linesfeedback.InnerHtml = "<div class='alert alert-success'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            }
            else
            {

                try
                {

                    var status = Config.ObjNav.FnSubmitAppealReason(InstitutionNo, tAppealReason);
                    String[] info = status.Split('*');
                    if (info[0] == "success")
                    {

                        
                       
                       
                        string path1 = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";
                        String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";
                        //string str1 = Convert.ToString(accreditationNo);
                       // string folderName = path1 + str1 + "/";
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


                                            string ApplicationNo = info[2];
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
                                                linesfeedback.InnerHtml =
                                                                                "<div class='alert alert-danger'>We could not create a directory for your documents. Please try again" +
                                                                                "<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                            }
                                            if (createDirectory)
                                            {
                                                string filename = documentDirectory + FileUpload1.FileName;
                                                if (File.Exists(filename))
                                                {
                                                    linesfeedback.InnerHtml =
                                                                                       "<div class='alert alert-danger'>A document with the given name already exists. Please delete it before uploading the new document or rename the new document<a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                                }
                                                else
                                                {
                                                    FileUpload1.SaveAs(filename);
                                                    if (File.Exists(filename))
                                                    {
                                                        Config.navExtender.AddLinkToRecord("Appeal Application Card", ApplicationNo, filename, "");

                                                    }
                                                    else
                                                    {
                                                        linesfeedback.InnerHtml =
                                                            "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                                    }
                                                }
                                            }
                                        }
                                        else
                                        {
                                            linesfeedback.InnerHtml = "<div class='alert alert-danger'>The document's file extension is not allowed. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                        }

                                    }
                                    else
                                    {
                                        linesfeedback.InnerHtml = "<div class='alert alert-danger'>The document's root folder defined does not exist in the server. Please contact support. <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                                    }

                                }
                                catch (Exception ex)
                                {
                                    linesfeedback.InnerHtml = "<div class='alert alert-danger'>The document could not be uploaded. Please try again <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";

                                }
                            }
                            else
                            {
                                linesfeedback.InnerHtml = "<div class='alert alert-danger'>Please select the document to upload. (or the document is empty) <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";


                            }
                        }
                        catch (Exception)
                        {
                            linesfeedback.InnerHtml = ("The Payments Details Could Not Be Captured Kindly Contact the System Administrator");
                        }

                        linesfeedback.InnerHtml = "<div class='alert alert-success'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                        ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "redirectJS", "setTimeout(function() { window.location.replace('MyAppealApplications.aspx') }, 5000);", true);
                    }
                    else
                    {
                        linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                    }

                }
                catch (Exception ex)
                {

                    linesfeedback.InnerHtml = "<div class='alert alert-danger'>" + ex.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
                }
            }
       
        }
    }
}