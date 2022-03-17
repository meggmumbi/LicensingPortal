<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="FAQs.aspx.cs" Inherits="HRPortal.FAQs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
    .faqHeader {
        font-size: 20px;
        margin: 10px;
        color:blue;
    }

    .panel-heading [data-toggle="collapse"]:after {
        font-family: 'Glyphicons Halflings';
        content: "e072"; /* "play" icon */
        float: right;
        color: #F58723;
        font-size: 18px;
        line-height: 22px;
        /* rotate "play" icon from > (right arrow) to down arrow */
        -webkit-transform: rotate(-90deg);
        -moz-transform: rotate(-90deg);
        -ms-transform: rotate(-90deg);
        -o-transform: rotate(-90deg);
        transform: rotate(-90deg);
    }

    .panel-heading [data-toggle="collapse"].collapsed:after {
        /* rotate "play" icon from > (right arrow) to ^ (up arrow) */
        -webkit-transform: rotate(90deg);
        -moz-transform: rotate(90deg);
        -ms-transform: rotate(90deg);
        -o-transform: rotate(90deg);
        transform: rotate(90deg);
        color: #454444;
    }
</style>
<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
            <li class="breadcrumb-item active">Frequently Asked Questions (FAQs)</li>
        </ol>
    </div>
</div>
<div class="panel panel-primary">
 <div class="alert alert-warning alert-dismissible" role="alert">
        <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        This section contains a wealth of information, related to <strong>Recognition And Equation of Qualifications</strong>. If you cannot find an answer to your question, 
        make sure to contact us. 
    </div>

    <div class="" id="accordion">
        <div class="faqHeader">General questions</div>
        <div class="card ">
            <div class="card-header" style="margin:15px">
                <h4 class="card-header">
                    <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapseOne">Is account registration required?</a>
                </h4>
            </div>
            <div id="collapseOne" class="panel-collapse collapse in" style="margin:20px">
                <div class="card-block">
                    Account registration at <strong>PrepBootstrap</strong> is only required if you will be selling or buying themes. 
                    This ensures a valid communication channel for all parties involved in any transactions. 
                </div>
            </div>
        </div>
        <div class="card ">
            <div class="card-header" style="margin:15px">
                <h4 class="card-header">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTen">Can I submit my application without payment?</a>
                </h4>
            </div>
            <div id="collapseTen" class="panel-collapse collapse" style="margin:20px">
                <div class="card-block">
                    A lot of the content of the site has been submitted by the community. Whether it is a commercial element/template/theme 
                    or a free one, you are encouraged to contribute. All credits are published along with the resources. 
                </div>
            </div>
        </div>
        <div class="card ">
            <div class="card-header">
                <h4 class="card-header" style="margin:15px">
                    <a class="accordion-toggle collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseEleven">What is the currency used for all transactions?</a>
                </h4>
            </div>
            <div id="collapseEleven" class="panel-collapse collapse" style="margin:20px">
                <div class="card-block">
                    All prices for themes, templates and other items, including each seller's or buyer's account balance are in <strong>USD</strong>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
