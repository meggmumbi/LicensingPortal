<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StatusOfApplication.aspx.cs" Inherits="HRPortal.StatusOfApplication" %>
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
                <li class="breadcrumb-item active">Status of Applications</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Application Status
        </div>
        <div class="panel-body">
            <div runat="server" id="Div1"></div>
            <div class="table-responsive">
                <table id="example1" class="table table-striped table-bordered">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Application Status</th>
                            <th>Applicant Type</th>
                            <th>Institution Name</th>
                            <th>License Type</th>
                            <th>Office Space Ownership</th>
                            <th>Email Address</th>
                            <th>City</th>
                            <th></th>
                            <th></th>
                           

                        </tr>
                    </thead>
                    <tbody>
                        <%
                            var nav = new Config().ReturnNav();
                            string institutionNo = Convert.ToString(Session["InstitutionNo"]);
                            var data1 = nav.LicenceApplicationHeader.Where(x => x.Institution_No == institutionNo && x.Applicant_Type == "Agency").ToList();
                            int counter = 0;
                            foreach (var item in data1)
                            {
                                counter++;
                        %>
                        <tr>
                            <td><%=counter %></td>
                            <td><% =item.Application_Status%></td>
                            <td><% =item.Applicant_Type %></td>
                            <td><% =item.Institution_Name %></td>                          
                            <td><% =item.Licence_Type_Description %></td>
                            <td><% =item.Physical_Address_Status%></td>
                            <td><% = item.Email%></td>
                            <td><% =item.City %></td>
                            <%if (item.Application_Status == "Closed" && item.Preliminary_Verdict == "Approved for Licensing")
                                {


                            %><td></td>
                            <%}
                            else
                            { %>
                            <td></td>
                            <%} %>
                            <td> <a href="ApplicationFinalReport.aspx?ApplicationNo=<%=item.Application_No%>" class="btn btn-success"><i class="fa fa-file-pdf-o"></i>Application Report</a></td>


                            <%
                                }
                            %>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
</asp:Content>
