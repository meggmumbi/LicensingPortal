<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home_Guidelines.aspx.cs" Inherits="HRPortal.Home_Guidelines" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <li class="breadcrumb-item active">Guidelines</li>
        </ol>
    </div>
</div>
<div class="panel panel-primary">
    <div class="panel-heading">
        GUIDELINES FOR RECOGNITION AND EQUATION (<i style="color: yellow">Kindly read the guidelines clearly before making an application</i>)
    </div>
    <div class="panel-body">
        <div runat="server" id="feedback"></div>
        <div class="col-md-12 col-lg-12">
            <ol>
                <li>The qualification must be Accredited and Recognized.</li>
                <li>The qualification must have been obtained from an accredited and recognized University or Institution.</li>
                <li>The holder of the Award must have met the Minimum Entry Requirements for an Academic Programme leading to an equivalent qualification in Kenya.</li>
                <li>All copies of Certificates and Academic Transcripts presented as proof of attainment of entry requirements for a particular qualification must be certified by an Advocate and Commissioner for Oaths (for Kenyan citizens), an Advocate and Notary Public (for foreigners) OR the issuing University/Institution.</li>
            </ol>
        </div>
    </div>
</div>
</asp:Content>
