<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="HRPortal.Settings" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active">Change Password</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Change Your Password
        </div>
        <div class="panel-body">
            <div runat="server" id="feedback"></div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Email<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="email" CssClass="form-control" placeholder="Please Enter Your Email" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateemail" ControlToValidate="email" ErrorMessage="Please enter your email, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">New Password<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="newpassword" type="password" CssClass="form-control span3" placeholder="Please Enter Your Password" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatenewpassword" ControlToValidate="newpassword" ErrorMessage="Please enter your new password, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Current Password<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="currentpassword" type="password" CssClass="form-control span3" placeholder="Please Enter Your Password" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatecurrentpassword" ControlToValidate="currentpassword" ErrorMessage="Please enter your current password, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Confirm Password<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="confirmpassword" type="password" CssClass="form-control span3" placeholder="Please Enter Your Password" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateconfirmpassword" ControlToValidate="confirmpassword" ErrorMessage="Please enter confirm password, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" ID="changepassword" CssClass="btn btn-success pull-right" Text="Change Password" />
            <div class="clearfix"></div>

        </div>
    </div>
</asp:Content>
