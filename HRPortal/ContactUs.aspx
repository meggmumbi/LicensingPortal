<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="HRPortal.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <li class="breadcrumb-item active">Contacts</li>
        </ol>
    </div>
</div>
<div class="panel panel-primary">
    <div class="panel-heading">
        Kindly Contact us 
    </div>
    <div class="panel-body">
        <div runat="server" id="feedback"></div>
        <div class="col-md-12 col-lg-12">
            <ol>
                <li><b>Address:</b> Red Hill Road, off Limuru Road, Gigiri P.O. Box 54999 – 00200, Nairobi, Kenya.</li>
                <li><b>Email:</b> info@cue.or.ke</li>
                <li><b>Phone:</b> 020–7205000, 0780-656575,0717445566,0791445566</li>
                <li><b>Complaints:</b> complaints@cue.or.ke</li>
            </ol>
        </div>
    </div>
</div>
</asp:Content>
