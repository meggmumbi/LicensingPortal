﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TerminatedApplications.aspx.cs" Inherits="HRPortal.TerminatedApplications" %>
<%@ Import Namespace="HRPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active">Terminated</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
         Terminated Application
        </div>
          <div id="feedback" runat="server"></div>
        <div class="panel-body">
             <div class="table-responsive">
                     <table id="example1" class="table table-striped table-bordered">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Application No</th>
                        <th>Application Status</th>
                        <th>Application Category</th>
                        <th>Applicant Type</th>
                        <th>Institution Name</th>
                        <th>Registration Certificate</th>
                        <th>-Physical Address Status</th>
                        <th>Licence Type</th>
                        <th>Registration Date</th>  
                        <th>Reason For Termination</th>                    
                     
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                       string institutionNo = Convert.ToString(Session["InstitutionNo"]);
                        var data = nav.LicenceApplicationHeader.Where(x=> x.Institution_No == institutionNo && x.Application_Status=="Terminated" ).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><%=item.Application_No %></td>
                        <td><% =item.Application_Status%></td>
                        <td><% =item.Application_Category %></td>
                        <td><% =item.Applicant_Type %></td>
                        <td><% =item.Institution_Name %></td>
                        <td><% =item.Registration_Certificate %></td>
                        <td><% =item.Physical_Address_Status %></td>
                        <td><% = item.Licence_Type_Description%></td>
                        <td><% = Convert.ToDateTime(item.Registration_Date).ToString("d/MM/yyyy") %></td>
                         <td> <label class="btn btn-danger" onclick="RejectionComment('<%=item.Application_No %>','<%=item.Reason_for_Rejection %>');"><i class="fa fa-plus"></i>Reson For Termination</label></td>  
                                   
                        
                        <%
                            }
                        %>
                    </tr>
                </tbody>
            </table>
                 </div>
        </div>
    </div>

     <script type="text/javascript">
             function RejectionComment(applicationNo, RejectionReason) {
                 document.getElementById("licensetorenew").innerText = applicationNo;
                   document.getElementById("ContentPlaceHolder1_licenseNo").value = LicenseNo;

                $("#renewLicenseModal").modal();
            }
        </script>
        <div id="renewLicenseModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Reason for Rejection</h4>
                </div>
                <div class="modal-body">
                    <p>Your license application was not approved due to the following reason <strong id="licensetorenew"></strong></p>
                    <asp:TextBox runat="server" ID="licenseNo" CssClass="form-control" TextMode="MultiLine" Rows="5" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
                    
                </div>
            </div>

        </div>
    </div>

</asp:Content>
