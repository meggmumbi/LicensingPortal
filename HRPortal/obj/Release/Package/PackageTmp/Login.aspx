<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="HRPortal.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <li class="breadcrumb-item active">Login</li>
        </ol>
    </div>
</div>
<div class="panel panel-primary">
        <div class="panel-heading">
            Login To Make your Application
        </div>
        <div class="panel-body">
            <div runat="server" id="feedback"></div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Email<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" id="email" cssclass="form-control" placeholder="Please Enter Your Email"/>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateemail" ControlToValidate="email" ErrorMessage="Please enter your email, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Agree to Terms and Guidelines<span style="color: red">*</span></label> <a href="Guidelines.aspx" style="color:blue"> Click To View Terms and Guidelines</a>
                    <asp:CheckBox runat="server" ID="terms" CssClass="form-control span3" />
                    <asp:CustomValidator ID="validateterms1" runat="server" ErrorMessage="Please confirm that you have read the terms and guidelines before you can login" ClientValidationFunction="testCheckBox" ForeColor="Red"></asp:CustomValidator>
                </div>
            </div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Password<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="password" type="password" CssClass="form-control span3" placeholder="Please Enter Your Password" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatepassword" ControlToValidate="password" ErrorMessage="Please enter your password, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:button runat="server" id="login" cssclass="btn btn-success pull-right" text="Login" OnClick="login_Click"/>
            <asp:button runat="server" id="register" cssclass="btn btn-warning pull-left" text="New User? Register Here" OnClick="register_Click"  CausesValidation="false"/>
            <div class="clearfix"></div>
             
        </div>
    </div>
          <br /> 
      <asp:button runat="server" id="resetpassword" cssclass="btn btn-info pull-left" text="Forgot Password? Reset Here" CausesValidation="false" OnClick="resetpassword_Click"/>

    <script type="text/javascript">
            function testCheckBox(sender, element) {
                var isValid = false;
                if ($("#<%= terms.ClientID %>").prop('checked') == true) {
                    isValid = true;
                }
                element.IsValid = isValid;
            }
    </script>
</asp:Content>
