<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="HRPortal.Dashboard" %>
<%@ Import Namespace="HRPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <%
            var nav = new Config().ReturnNav();
            string percentange = "";
            string pendingAction = "";
            int count = 0;
            string university = Convert.ToString(Session["InstitutionNo"]);
            var evaluationApplications = nav.LicenceApplicationHeader.Where(r =>r.Institution_No == university && r.Application_Status=="Draft").ToList();
            var programs2 = nav.LicenceApplicationHeader.Where(r => r.Institution_No == university && r.Application_Status == "Awaiting Finance").ToList();
            var programs = nav.LicenceApplicationHeader.Where(r => r.Institution_No == university && r.Application_Status == "Awaiting Completeness Check").ToList();
            var programs3 = nav.LicenceApplicationHeader.Where(r => r.Institution_No == university && r.Application_Status == "Awaiting Site Visit").ToList();
            var programs4 = nav.LicenceApplicationHeader.Where(r => r.Institution_No == university && r.Application_Status == "Awaiting Certification").ToList();
            var programs5 = nav.LicenceApplicationHeader.Where(r => r.Institution_No == university && r.Application_Status == "Closed").ToList();
            var inst = nav.LicenceApplicationHeader.Where(r =>r.Institution_No  == university && r.Application_Status == "Open").ToList();
            //var inst1 = nav.applicationAccreditation.Where(r => r.No == university && r.Status == "Peer Review Ongoing").ToList();
            //var inst3 = nav.applicationAccreditation.Where(r => r.No == university && r.Status == "Site Inspection Ongoing").ToList();
            var pendPayment = nav.LicenceApplicationHeader.Where(r => r.Institution_No == university && r.Application_Status == "Open" && r.Application_Invoice =="").ToList();

            if (programs2.Count > 0)
            {
                percentange = "20%";
            }
            else if (programs.Count > 0)
            {
                percentange = "40%";
            }
            else if (programs3.Count > 0)
            {
                percentange = "60%";
            }
            else if (programs4.Count > 0)
            {
                percentange = "80%";
            }
            else if (programs5.Count > 0)
            {
                percentange = "100%";
            }

            if (inst.Count > 0)
            {
                count = inst.Count;
                pendingAction = "Pending Payment";
            }
            //else if (inst1.Count > 0)
            //{
            //    count = inst1.Count;
            //    pendingAction = "Peer Review Ongoing";
            //}
            //else   if (inst3.Count > 0)
            //{
            //    count = inst3.Count;
            //    pendingAction = "Site Inspection Ongoing";
            //}



         %>
<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><h5 style="color:blue"><i>The Commission for University Education is mandated to License any Student Recruitment 
Agencies operating in Kenya and any activities by foreign universities and institutions.</i></h5></li>
        </ol>
    </div>
</div>
 <%--   <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h4>GUIDELINES</h4>

              <p>Licensing of Student Recruitment Agencies </p>
            </div>
<%--            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="Guidelines.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h4>PAYMENTS</h4>

              <p>Check The Different Payment Options</p>
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
          <div class="small-box bg-yellow">
            <div class="inner">
              <h4>CUE Website</h4>

              <p>Click on More Info to access CUE Website</p>
            </div>
         <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="https://www.cue.or.ke/" class="small-box-footer">Visit Website <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h4>Universities Standards and Guidelines Website</h4>

              <p>View services</p>
            </div>
           <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">Visit Website <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
   --%>



      <section class="content">
        <!-- Small boxes (Stat box) -->
        <div class="row">
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-aqua">
                    <div class="inner">

                        <h3><sup style="font-size: 20px"><%=percentange %></sup></h3>
                        <p>Status Of Application</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-bag"></i>
                    </div>
                    <a href="StatusOfApplication.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-green">
                    <div class="inner">
                        <h3><%=pendPayment.Count %></h3>

                        <p>Application Pending Payment</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-stats-bars"></i>
                    </div>
                    <a href="ApprovedApplications.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-yellow">
                    <div class="inner">
                        <h3><%=count %></h3>

                        <p>Pending Action - <%=pendingAction %></p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-person-add"></i>
                    </div>
                    <a href="ApprovedApplications.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
            <div class="col-lg-3 col-xs-6">
                <!-- small box -->
                <div class="small-box bg-red">
                    <div class="inner">
                        <h3><%=evaluationApplications.Count %></h3>

                        <p>Draft Applications</p>
                    </div>
                    <div class="icon">
                        <i class="ion ion-pie-graph"></i>
                    </div>
                    <a href="OpenApplications.aspx" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
                </div>
            </div>
            <!-- ./col -->
        </div>
        <!-- /.row -->
        <!-- Main row -->

    

   

    <div class="panel panel-primary">
        <div class="panel-heading">
            The Commission for University Education (CUE) Licensing of Student Recruitment Agencies Quick Overview
        </div>
        <div class="panel-body">


              <div class="panel-body">

        <ul class="nav nav-tabs">
            <li class="active" style="background-color:#D3D3D3">
                <a href="#tab_general_details" data-toggle="tab"><p style="color:black"><strong>General Details</strong> </p></a>
            </li>
            <li style="background-color:#D3D3D3">
                <a href="#tab_procurement_categories" data-toggle="tab"><p style="color:black"><strong>Required Mandatory Documents</strong></p> </a>
            </li>
                </ul>
        <div class="tab-content">
            <div class="tab-pane fade active in" id="tab_general_details">               
                <div class="row">
                    <div class="panel panel-heading" style="background-color:#D3D3D3">
                        <h6 class="panel-title"> <strong><u>General Information</u></strong></h6>
                    </div>
                    <div class="col-md-12">
                        <div class="table-responsive">
                           
            <p>
                The Commission for University Education is mandated to License any Student Recruitment
                Agencies operating in Kenya and any activities by foreign universities and institutions. This
                process is applicable to:
            </p>
            <ol type="a">
                <li>Agencies registered in Kenya (direct recruitment)
                        <ol type="i">
                            <li>Agencies for student recruitment into universities/institutions</li>
                            <li>Agencies for advertising, exhibiting and marketing universities/institutions;</li>
                            <li>Foreign universities or institutions directly advertising, exhibiting or recruiting students;</li>
                            <li>Confederations of agencies for student recruitment into universities/institutions;</li>
                            <li>Confederations of agencies for advertising, exhibiting and marketing universities/ institutions</li>
                        </ol>
                </li>
                <li>Local universities as agencies of foreign universities or institutions. i.e. Foreign 
universities or institutions offering academic programmes in collaboration with Local 
universities or institutions (Indirect recruitment/Collaboration);</li>
                </ol>
                        </div>
                    </div>
                </div>
            </div>
                  <div class="tab-pane fade" id="tab_procurement_categories">
                      <div class="row">
                          <div class="row">
                              <div class="panel panel-heading" style="background-color: #D3D3D3">
                                  <h6 class="panel-title"><strong><u>Mandatory Documents</u></strong></h6>
                              </div>

                              <div class="row">
                                  <div class="col-md-12 col-lg-12">
                                      <div class="table-responsive">
                                          <table class="table table-striped custom-table datatable" id="example9">
                                              <thead>
                                                  <tr>
                                                      <th>#</th>
                                                      <th>Code</th>
                                                      <th>Description</th>
                                                     
                                                  </tr>

                                              </thead>
                                              <tbody>
                                                  <% 
                                                      
                                                      var details = nav.AgencyDocuments.Where(r => r.Application_Type == "Agency" && r.Blocked == false).ToList();
                                                      int programesCounter = 0;
                                                      int counter = 0;
                                                      foreach (var detail in details)
                                                      {

                                                          counter++;
                                                          programesCounter++;
                                                  %>
                                                  <tr>
                                                      <td><%=programesCounter %></td>
                                                      <td><%=detail.Code %></td>
                                                      <td><%=detail.Description %></td>

                                                     
                                                  </tr>
                                                  <%  
                                                      } %>
                                              </tbody>
                                          </table>
                                      </div>
                                  </div>
                              </div>
                          </div>
                </div>
            </div> 
        </div>
    </div>




        </div>
    </div>
  </section>
</asp:Content>
