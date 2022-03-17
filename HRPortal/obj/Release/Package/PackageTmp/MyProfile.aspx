<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyProfile.aspx.cs" Inherits="HRPortal.MyProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <li class="breadcrumb-item active">My Profile</li>
        </ol>
    </div>
</div>
<div class="panel panel-primary">
        <div class="panel-heading">
            MY Profile Details
        </div>
        <div class="panel-body">
            <div runat="server" id="feedback"></div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Title<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" id="title" cssclass="form-control"  />
                </div>
                <div class="form-group" runat="server">
                    <label class="span2">First Name<span style="color: red">*</span></label>
                    <asp:TextBox id="firstname" runat="server" cssclass="form-control"/> 
                </div>
                <div class="form-group">
                    <label class="span2">Middle Name</label>
                    <asp:textbox runat="server" id="middlename" cssclass="form-control span3" />
                </div>
                <div class="form-group">
                    <label class="span2">Last Name<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="lastname" CssClass="form-control span3"/>
                </div>
                <div class="form-group">
                    <label class="span2">Email Address<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="email" CssClass="form-control span3"  />
                </div>
                <div class="form-group">
                    <label class="span2">Telephone Number<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="telephonenumber" CssClass="form-control span3"  />
                </div>
                <div class="form-group">
                    <label class="span2">Whatsapp Number</label>
                    <asp:TextBox runat="server" ID="whatsappnumber" CssClass="form-control span3"/>
                </div>
                <div class="form-group">
                    <label class="span2">National Identity Number (ID)<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="idno" CssClass="form-control span3"/>
                </div>
                <div class="form-group">
                    <label class="span2">Passport Number</label>
                    <asp:TextBox runat="server" ID="passport" CssClass="form-control span3"/>
                </div>
                <div class="form-group">
                    <label class="span2">Post Code<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="postcode" CssClass="form-control"/>
                </div>
            </div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">City<span style="color: red">*</span></label>
                    <asp:textbox runat="server" id="city" cssclass="form-control span3" />
                </div>
                <div class="form-group">
                    <label class="span2">County<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="county" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label class="span2">Form of Citizenship<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="citizenship" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label class="span2">Nationality<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="nationality" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label class="span2">Country<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="country" CssClass="form-control" />
                </div>
                <div class="form-group">
                    <label class="span2">Address<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="address" CssClass="form-control span3" />
                </div>
                <div class="form-group">
                    <label class="span2">Are You Employed?<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="txtemployed" CssClass="form-control"/>
                </div>
                <div class="form-group" runat="server" id="divemployed">
                    <label class="span2">Company Name<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="companyname" CssClass="form-control span3"/>
                </div>
                <div class="form-group">
                    <label class="span2">Department/Field<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="department" CssClass="form-control span3" />
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:button runat="server" id="close" cssclass="btn btn-success pull-right" text="Update Profile"/>
            <div class="clearfix"></div>
        </div>
    </div>
</asp:Content>
