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
<div class="panel panel-primary">
        <div class="panel-heading">
            Register A New Account with Commission For Universities Education (<i style="color:yellow">Kindly note that all fields marked with asterisk (<span style="color: red">*</span>) are mandatory</i>)
        </div>
        <div class="panel-body">
            <div runat="server" id="registerfeedback"></div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Title<span style="color: red">*</span></label>
                    <asp:dropdownlist runat="server" id="title" appenddatabounditems="true" cssclass="form-control select2" autopostback="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Mr</asp:ListItem>
                        <asp:ListItem>Mrs</asp:ListItem>
                        <asp:ListItem>Miss</asp:ListItem>
                        <asp:ListItem>Ms</asp:ListItem>
                        <asp:ListItem>Dr</asp:ListItem>
                        <asp:ListItem>Prof</asp:ListItem>
                    </asp:dropdownlist>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatetitle" ControlToValidate="title" InitialValue="--Select--" ErrorMessage="Please select Title, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group" runat="server">
                    <label class="span2">First Name<span style="color: red">*</span></label>
                    <asp:TextBox id="firstname" runat="server" cssclass="form-control" placeholder="Please Enter First Name"/>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatefirstname" ControlToValidate="firstname" ErrorMessage="Please enter your first name, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Middle Name</label>
                    <asp:textbox runat="server" id="middlename" cssclass="form-control span3"  placeholder="Please Enter Middle Name" />
                </div>
                <div class="form-group">
                    <label class="span2">Last Name<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="lastname" CssClass="form-control span3" placeholder="Please Enter Last Name" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatelastname" ControlToValidate="lastname" ErrorMessage="Please enter your last name, it cannot be empty!" ForeColor="Red" />
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
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatetelephonenumber" ControlToValidate="telephonenumber" ErrorMessage="Please enter valid number, it should be ten digits!" ForeColor="Red" ValidationExpression="[0-9]{10}"/>
                </div>
                <div class="form-group">
                    <label class="span2">Whatsapp Number</label>
                    <asp:TextBox runat="server" ID="whatsappnumber" CssClass="form-control span3" placeholder="Please Enter Whatsapp Number" />
                </div>
                <div class="form-group">
                    <label class="span2">National Identity Number (ID)<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="idno" CssClass="form-control span3" placeholder="Please Enter ID Number" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateidno" ControlToValidate="idno" ErrorMessage="Please enter valid ID number, it should be eight digits!" ForeColor="Red" ValidationExpression="[0-7]{8}"/>
                </div>
                <div class="form-group">
                    <label class="span2">Passport Number</label>
                    <asp:TextBox runat="server" ID="passport" CssClass="form-control span3" placeholder="Please Enter Passport Number" />
                </div>
                <div class="form-group">
                    <label class="span2">Gender<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="gender" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="Male">Male</asp:ListItem>
                        <asp:ListItem Value="Female">Female</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                    <span class="error" id="Span1" runat="server" style="background-color: red"></span>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validategender" ControlToValidate="gender" InitialValue="--Select--" ErrorMessage="Please select gender, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
            <div class="col-md-6 col-lg-6">
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
                    <asp:textbox runat="server" id="city" cssclass="form-control span3" ReadOnly="true"/>
                </div>
                <div class="form-group">
                    <label class="span2">County<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="county" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label class="span2">Form of Citizenship<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="citizenship" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="Birth">Birth</asp:ListItem>
                        <asp:ListItem Value="Naturalization">Naturalization</asp:ListItem>
                        <asp:ListItem Value="Marriage">Marriage</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatecitizenship" ControlToValidate="title" InitialValue="--Select--" ErrorMessage="Please select Form of Citizenship, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Nationality<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="nationality" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="Local">Local</asp:ListItem>
                        <asp:ListItem Value="Foreign">Foreign</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatenationality" ControlToValidate="nationality" InitialValue="--Select--" ErrorMessage="Please select Nationality, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Country<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="country" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                       <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatecountry" ControlToValidate="country" InitialValue="--Select--" ErrorMessage="Please select Country of Residence, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Address<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="address" CssClass="form-control span3" placeholder="Please Enter Address" />
                     <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateaddress" ControlToValidate="address" ErrorMessage="Please enter Address, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Are You Employed?<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="txtemployed" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true" OnSelectedIndexChanged="txtemployed_SelectedIndexChanged">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="YES">YES</asp:ListItem>
                        <asp:ListItem Value="NO">NO</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatetxtemployed" ControlToValidate="txtemployed" InitialValue="--Select--" ErrorMessage="Please select employment status, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group" runat="server" id="divemployed" visible="false">
                    <label class="span2">Company Name<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="companyname" CssClass="form-control span3" placeholder="Please Enter Company Name" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatecompanyname" ControlToValidate="companyname" ErrorMessage="Please enter company name, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Department/Field<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="department" CssClass="form-control span3" placeholder="Please Enter Department/Field"/>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatedepartment" ControlToValidate="department" ErrorMessage="Please enter Department/Field, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:button runat="server" id="register" cssclass="btn btn-success pull-right" text="Register" OnClick="register_Click"/>
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
