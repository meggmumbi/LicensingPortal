using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HRPortal
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var nav = new Config().ReturnNav();
                //var countries = nav.Countries.ToList();
                //country.DataSource = countries;
                //country.DataTextField = "Name";
                //country.DataValueField = "Code";
                //country.DataBind();

                //var counties = nav.Counties.ToList();
                //county.DataSource = counties;
                //county.DataTextField = "Description";
                //county.DataValueField = "Code";
                //county.DataBind();

                var postcodes = nav.postcodes.ToList();
                List<DropDownData> allList = new List<DropDownData>();
                foreach (var item in postcodes)
                {
                    DropDownData data = new DropDownData();
                    data.Code = item.Code;
                    data.Name = item.Code + " - " + item.City;
                    allList.Add(data);
                }
                postcode.DataSource = allList;
                postcode.DataTextField = "Name";
                postcode.DataValueField = "Code";
                postcode.DataBind();
            }
        }

        protected void register_Click(object sender, EventArgs e)
        {
            //try
            //{
            //    bool error = false;
            //    string msg = "";
            //    int txttitle = 0;
            //    int txtcitizenship = 0;
            //    int txtgender = 0;
            //    int txtnationality = 0;
            //    bool txtisemployed = false;
            //    string ntitle = title.SelectedValue;
            //    if (ntitle == "Mr")
            //    {
            //        txttitle = 1;
            //    }
            //    if (ntitle == "Mrs")
            //    {
            //        txttitle = 2;
            //    }
            //    if (ntitle == "Miss")
            //    {
            //        txttitle = 3;
            //    }
            //    if (ntitle == "Ms")
            //    {
            //        txttitle = 4;
            //    }
            //    if (ntitle == "Prof")
            //    {
            //        txttitle = 5;
            //    }
            //    string txtEmail = email.Text.Trim();
            //    bool isValid = IsValidEmail(txtEmail);
            //    if (isValid == true)
            //    {
            //        erroremail.Visible = false;
            //    }
            //    else
            //    {
            //        erroremail.Visible = true;
            //        erroremail.InnerText = "Please enter a valid email address! It should be like test@gmail.com";
            //    }
            //    string txtfirstname = firstname.Text.Trim();
            //    string txtmiddlename = middlename.Text.Trim();
            //    string txtlastname = lastname.Text.Trim();
            //    string txtphoneno = telephonenumber.Text.Trim();
            //    string txtwhatsappno = whatsappnumber.Text.Trim();
            //    int txtidno = Convert.ToInt32(idno.Text.Trim());
            //    string txtpassportno = passport.Text.Trim();
            //    string txtpostcode = postcode.Text.Trim();
            //    string txtcounty = county.SelectedValue;
            //    string txtcity = city.Text.Trim();
            //    string ncitizenship = citizenship.SelectedValue;
            //    if (ncitizenship == "Birth")
            //    {
            //        txtcitizenship = 1;
            //    }
            //    if (ncitizenship == "Naturalization")
            //    {
            //        txtcitizenship = 2;
            //    }
            //    if (ncitizenship == "Marriage")
            //    {
            //        txtcitizenship = 3;
            //    }
            //    string txtcountry = country.SelectedValue;
            //    string txtaddress = address.Text.Trim();
            //    string nisemployed = txtemployed.SelectedValue;
            //    if (nisemployed == "YES")
            //    {
            //        txtisemployed = true;
            //    }
            //    else
            //    {
            //        txtisemployed = false;
            //    }
            //    string txtdepartment_field = department.Text.Trim();
            //    string txtcompany_name = companyname.Text.Trim();
            //    string ngender = gender.SelectedValue;
            //    if (ngender == "Male")
            //    {
            //        txtgender = 1;
            //    }
            //    if (ngender == "Female")
            //    {
            //        txtgender = 2;
            //    }
            //    if (ngender == "Other")
            //    {
            //        txtgender = 3;
            //    }
            //    string nnationality = nationality.SelectedValue;
            //    if (nnationality == "Local")
            //    {
            //        txtnationality = 1;
            //    }
            //    if (nnationality == "Foreign")
            //    {
            //        txtnationality = 2;
            //    }

            //    if (error)
            //    {
            //        registerfeedback.InnerHtml = "<div class='alert alert-danger'>" + msg + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            //    }
            //    else
            //    {
            //        String docNo = "";
            //        try
            //        {
            //            docNo = Request.QueryString["docNo"];
            //            if (String.IsNullOrEmpty(docNo))
            //            {
            //                docNo = "";
            //            }
            //        }
            //        catch (Exception)
            //        {
            //            docNo = "";
            //        }
            //        String status = Config.ObjNav.FnCreateApplicationHeader(docNo, txttitle, txtfirstname, txtlastname, txtmiddlename, txtEmail, txtphoneno, txtwhatsappno, txtidno, txtpassportno, txtpostcode, txtcounty, txtcitizenship, txtnationality, txtcountry, txtaddress, txtisemployed, txtdepartment_field, txtcity, txtgender);
            //        String[] info = status.Split('*');
            //        if (info[0] == "success")
            //        {
            //            Response.Redirect("Imprest.aspx?step=2&&imprestNo=" + info[2]);
            //        }
            //        else
            //        {
            //            registerfeedback.InnerHtml = "<div class='alert alert-danger'>" + info[1] + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            //        }
            //    }
            //}
            //catch (Exception m)
            //{
            //    registerfeedback.InnerHtml = "<div class='alert alert-danger'>" + m.Message + " <a href='#' class='close' data-dismiss='alert' aria-label='close'>&times;</a></div>";
            //}
        }
        public static bool IsValidEmail(string email)
        {
            string pattern = @"^(?!\.)(""([^""\r\\]|\\[""\r\\])*""|" + @"([-a-z0-9!#$%&'*+/=?^_`{|}~]|(?<!\.)\.)*)(?<!\.)" + @"@[a-z0-9][\w\.-]*[a-z0-9]\.[a-z][a-z\.]*[a-z]$";
            var regex = new Regex(pattern, RegexOptions.IgnoreCase);
            return regex.IsMatch(email);
        }

        protected void postcode_SelectedIndexChanged(object sender, EventArgs e)
        {
            string code = postcode.SelectedValue;
            var nav = new Config().ReturnNav();
            var cities = nav.postcodes.Where(x=> x.Code == code).ToList();
            foreach (var item in cities)
            {
                city.Text = item.City;
            }
        }

        protected void certificate_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ast = "*";
                //string.Format("<span style=\"color: red;\">*</span>");
            //"<span style='color:red'>*</span>";
            string cert = certificate.SelectedValue;
            if (cert == "Certificate of Incorporation")
            {
                divAttachment.Visible = true;
                divDate.Visible = true;
                divCertificate.Visible = true;

                lblAttachment.InnerText = "Upload Certificate of Incorporation" + ast; 
                lblCerificate.InnerText = "Certificate of Incorporation Number" + ast;
                lblDate.InnerText = "Date of Certificate of Incorporation" + ast;
            }

            if (cert == "Certificate of Registration")
            {
                divAttachment.Visible = true;
                divDate.Visible = true;
                divCertificate.Visible = true;

                lblAttachment.InnerText = "Upload Certificate of Registration" + ast;
                lblCerificate.InnerText = "Certificate of Registration Number" + ast;
                lblDate.InnerText = "Date of Certificate of Registration" + ast;
            }
        }

        protected void phyaddress_SelectedIndexChanged(object sender, EventArgs e)
        {
            string ast = "<span style='color:red'>*</span>";
            string cert = phyaddress.SelectedValue;
            if (cert == "Owned")
            {
                divphyaddressdoc.Visible = true;

                lblphyaddressdoc.InnerText = "Upload Copy of The Title Deed" + ast;
            }
            else if (cert == "Leased")
            {
                divphyaddressdoc.Visible = true;

                lblphyaddressdoc.InnerText = "Upload Copy of The Lease Agreement" + ast;
            }
            else
            {
                divphyaddressdoc.Visible = false;
            }
        }
    }
}