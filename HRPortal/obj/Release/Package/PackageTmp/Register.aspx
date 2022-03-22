<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="HRPortal.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active">Register A New Account</li>
            </ol>
        </div>
    </div>
    <%
        int step = 1;
        try
        {
            step = Convert.ToInt32(Request.QueryString["step"]);
            if (step>3||step<1)
            {
               step = 1;  
            }
        }
        catch (Exception)
        { step = 1;
        }
        if (step == 1)
        {
           %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Register A New Account with Commission For Universities Education (<i style="color: yellow">Kindly note that all fields marked with asterisk (<span style="color: red">*</span>) are mandatory</i>)
        </div>
        <div class="panel-body">
            <div runat="server" id="registerfeedback"></div>
            <div class="row">
            <div class="col-md-6 col-lg-6">
                <div class="form-group" runat="server">
                    <label class="span2">Agency Name<span style="color: red">*</span></label>
                    <asp:TextBox ID="agencyname" runat="server" CssClass="form-control" placeholder="Please Enter First Name" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="agencyname" ErrorMessage="Please enter agency name, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Residential<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="residential" CssClass="form-control span3" placeholder="Please Enter Your Residential" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="residential" ErrorMessage="Please enter your residential, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Post Code<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="postcode" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true" OnSelectedIndexChanged="postcode_SelectedIndexChanged">
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <span class="error" id="errorpostcode" runat="server" style="background-color: red"></span>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatepostcode" ControlToValidate="postcode" InitialValue="--Select--" ErrorMessage="Please select Post Code, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">City<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="city" CssClass="form-control span3" ReadOnly="true" />
                </div>
                <div class="form-group">
                    <label class="span2">Email Address<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="email" CssClass="form-control span3" placeholder="Please Enter Email Address" />
                    <span class="error" id="erroremail" runat="server" style="background-color: red"></span>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateemail" ControlToValidate="email" ErrorMessage="Please enter email address, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Telephone Number<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="telephonenumber" CssClass="form-control span3" placeholder="Please Enter Telephone Number" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatetelephonenumber" ControlToValidate="telephonenumber" ErrorMessage="Please enter valid number, it cannot be empty!" ForeColor="Red" ValidationExpression="[0-9]{10}" />
                </div>
            </div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Alternative Telephone Number</label>
                    <asp:TextBox runat="server" ID="TextBox1" CssClass="form-control span3" placeholder="Please Enter Alternative Telephone Number" />
                </div>
                <div class="form-group">
                    <label class="span2">Whatsapp Number</label>
                    <asp:TextBox runat="server" ID="whatsappnumber" CssClass="form-control span3" placeholder="Please Enter Whatsapp Number" />
                </div>
                <div class="form-group">
                    <label class="span2">Website<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="website" CssClass="form-control span3" placeholder="Please Enter Your Website" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="website" ErrorMessage="Please enter your website, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Physical Address<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="phyaddressname" CssClass="form-control span3" placeholder="Please Enter Physical Address" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="phyaddressname" ErrorMessage="Please enter name of physical address, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Is physical address owned or leased? <span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="phyaddress" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true" OnSelectedIndexChanged="phyaddress_SelectedIndexChanged">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Owned</asp:ListItem>
                        <asp:ListItem>Leased</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="phyaddress" InitialValue="--Select--" ErrorMessage="Please select Physical Address, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group" runat="server" visible="false" id="divphyaddressdoc">
                    <label runat="server" id="lblphyaddressdoc" class="span2"><span style="color: red">*</span> <i style="color: blue">{Max Size: 5MB, kindly use .pdf files only}</i> </label>
                    <asp:FileUpload CssClass="form-control span3" runat="server" ID="phyaddressdoc" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="phyaddressdoc" ErrorMessage="Please upload valid copy of document, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
            </div>
            <hr />
            <h4 style="color:blue"><strong>Details of Certificate</strong></h4>
            <hr />
            <div class="row">
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Type of Certificate<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="certificate" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true" OnSelectedIndexChanged="certificate_SelectedIndexChanged">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="Certificate of Incorporation">Certificate of Incorporation</asp:ListItem>
                        <asp:ListItem Value="Certificate of Registration">Certificate of Registration</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="certificate" InitialValue="--Select--" ErrorMessage="Please select type of certificate, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
            <div class="col-md-6 col-lg-6" runat="server" id="divCertificate" visible="false">
                <div class="form-group">
                    <label runat="server" id="lblCerificate" class="span2"><span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="certno" CssClass="form-control span3" placeholder="Please Enter Certificate Number" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="certno" ErrorMessage="Please enter certificate number, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
            <div class="col-md-6 col-lg-6" runat="server" id="divDate" visible="false">
                <div class="form-group">
                    <label runat="server" id="lblDate" class="span2"><span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="registrationDate" CssClass="form-control span3" placeholder="Please Enter Date (dd/MM/yyyy)" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="registrationDate" ErrorMessage="Please enter correct date, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
            <div class="col-md-6 col-lg-6" runat="server" id="divAttachment" visible="false">
                <div class="form-group">
                    <label runat="server" id="lblAttachment" class="span2"><span style="color: red">*</span> <i style="color: blue">{Max Size: 5MB, kindly use .pdf files only}</i> </label>                
                    <asp:FileUpload runat="server" CssClass="form-control span3" ID="docattachment" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="docattachment" ErrorMessage="Please upload Certificate, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" ID="register" CssClass="btn btn-success pull-right" Text="Next" OnClick="register_Click" />
            <div class="clearfix"></div>
        </div>
    </div>
    <% 
        }else if (step==2){
            %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Head of Agency Details(<i style="color: yellow">Kindly note that all fields marked with asterisk (<span style="color: red">*</span>) are mandatory</i>)
        </div>
        <div class="panel-body">
            <div runat="server" id="agencyFeedback"></div>
            <div class="row">
                <div class="col-md-6 col-lg-6">
                    <div class="form-group" runat="server">
                        <label class="span2">Head of The Agency Name<span style="color: red">*</span></label>
                        <asp:TextBox ID="headagencyname" runat="server" CssClass="form-control" placeholder="Please Enter Head of The Agency Name" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="headagencyname" ErrorMessage="Please enter head of agency name, it cannot be empty!" ForeColor="Red" />
                    </div>
                     <div class="form-group">
                         <label class="span2">Country of Citizenship<span style="color: red">*</span> </label>
                         <asp:DropDownList runat="server" ID="country" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                             <asp:ListItem>--Select--</asp:ListItem>
                         </asp:DropDownList>
                         <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="country" InitialValue="--Select--" ErrorMessage="Please select Country of citizenship, it cannot be empty!" ForeColor="Red" />
                     </div>
                    <div class="form-group">
                        <label class="span2">Form of Citizenship<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="citizenship" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="Birth">Birth</asp:ListItem>
                            <asp:ListItem Value="Naturalization">Naturalization</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="citizenship" InitialValue="--Select--" ErrorMessage="Please select Form of Citizenship, it cannot be empty!" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label class="span2">National ID/Passport Number<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="idno" CssClass="form-control span3" placeholder="Please Enter National Id/Passport Number" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="idno" ErrorMessage="Please enter National Id/Passport Number, it cannot be empty!" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label class="span2">Upload National Id/Passport Certificate<span style="color: red">*</span> <i style="color: blue">{Max Size: 5MB, kindly use .pdf files only}</i> </label>
                        <asp:FileUpload runat="server" ID="iddoc" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="iddoc" ErrorMessage="Please upload National Id/Passport Certificate, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Designation<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="designation" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="Mr">Mr</asp:ListItem>
                            <asp:ListItem Value="Mrs">Mrs</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="designation" InitialValue="--Select--" ErrorMessage="Please select designation, it cannot be empty!" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label class="span2">Email Address<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="agencyemail" CssClass="form-control span3" placeholder="Please Enter Email Address" />
                        <span class="error" id="Span1" runat="server" style="background-color: red"></span>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="agencyemail" ErrorMessage="Please enter email address, it cannot be empty!" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label class="span2">Telephone Number<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="agencyphone" CssClass="form-control span3" placeholder="Please Enter Telephone Number" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="agencyphone" ErrorMessage="Please enter valid number, it should be ten digits!" ForeColor="Red" ValidationExpression="[0-9]{10}" />
                    </div>
                    <div class="form-group">
                        <label class="span2">Whatsapp Number</label>
                        <asp:TextBox runat="server" ID="agencywhatsappno" CssClass="form-control span3" placeholder="Please Enter Whatsapp Number" />
                    </div>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" ID="submitregistration" CssClass="btn btn-success pull-right" Text="Submit Registration"/>
            <div class="clearfix"></div>
        </div>
    </div>
        <%
        }
       %>
</asp:Content>
