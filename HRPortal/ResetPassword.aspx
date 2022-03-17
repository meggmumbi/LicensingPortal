<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="HRPortal.ResetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active">Reset Password</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Kindly enter your email used in registration to Reset Password
        </div>
        <div class="panel-body">
            <div runat="server" id="feedback"></div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Email<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="email" CssClass="form-control" placeholder="Please Enter Your Email e.g test@gmail.com" />
                    <span class="error" id="erroremail" runat="server" style="background-color: red"></span>
                    <asp:RequiredFieldValidator Display="Dynamic" runat="server" id="validateemail" controltovalidate="email" errormessage="Please enter email address, it cannot be empty!" ForeColor="Red"/>
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" ID="resetpassword" CssClass="btn btn-success pull-right" Text="Reset Password" OnClick="resetpassword_Click"/>
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
