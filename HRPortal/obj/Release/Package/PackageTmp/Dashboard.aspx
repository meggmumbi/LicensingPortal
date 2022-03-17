<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HRPortal.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><h5 style="color:blue"><i>CUE undertakes recognition and equation of Diplomas,
                Degrees, Post-graduate Diplomas and Post-graduate Certificates conferred or awarded by Foreign Universities and Institutions</i></h5></li>
        </ol>
    </div>
</div>
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>0</h3>

              <p>Open Applications</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="Guidelines.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>0</h3>

              <p>Pending Applications</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="Payments.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>0</h3>

              <p>Approved Applications</p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="https://www.cue.or.ke/" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>0</h3>

              <p>Certificates</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="https://www.helb.co.ke/" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
   
    <div class="panel panel-primary">
        <div class="panel-heading">
            The Commission for University Education (CUE) Recognition and Equation of Qualification Quick Overview
        </div>
        <div class="panel-body">
            <p><b>The Commission for University Education (CUE) undertakes recognition and equation of Diplomas,<br />
                Degrees, Post-graduate Diplomas and Post-graduate Certificates conferred or awarded by Foreign Universities and Institutions<br />
                in accordance with Section 5 (1) (g) of The Universities Act No. 42 of 2012; Section 5A (2) of The Universities Act No. 42 of 2012, Revised Edition 2016 [2015];
                <br />
                Part XI of The Universities Regulations, 2014 and The Universities Standards and Guidelines, 2014.</b></p>
        </div>
    </div>
  </section>

</asp:Content>
