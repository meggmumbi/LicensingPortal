<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Certificate.aspx.cs" Inherits="HRPortal.Certificate" %>
<%@ Import Namespace="HRPortal" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="row">
    <div class="col-sm-12">
        <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
            <li class="breadcrumb-item active">Certificates</li>
        </ol>
    </div>
</div>
 <div class="panel panel-primary">
     <div class="panel-heading">
         My Certificates
     </div>
     <div class="panel-body">
         <div runat="server" id="feedback"></div>
         <table id="example1" class="table table-bordered table-striped">
             <thead>
                 <tr>
                     <th>#</th>
                     <th>Description</th>
                     <th>Institution</th>
                     <th>Programme</th>
                     <th>Print/Download</th>
                 </tr>
             </thead>
             <tbody>
<%--                 <%
                     var nav = new Config().ReturnNav();
                     string employeeNo = Convert.ToString(Session["employeeNo"]);
                     var data = nav.PerfomanceContractHeader.Where(r => r.Responsible_Employee_No == employeeNo && r.Score_Card_Type == "Staff" && r.Approval_Status == "Released" && r.Document_Type == "Individual Scorecard");
                     int counter = 0;
                     foreach (var item in data)
                     {
                         counter++;
                     %>
                     <tr>
                         <td><%=counter %></td>
                         <td><% =item.Description%></td>
                         <td><% =item.Strategy_Plan_ID %></td>
                         <td><% =item.Annual_Reporting_Code %></td>
                         <td><% =Convert.ToDateTime(item.Start_Date).ToString("d/MM/yyyy")%></td>
                         <td><% =Convert.ToDateTime(item.End_Date).ToString("d/MM/yyyy")%></td>
                     <%
                         }
                     %>
                    </tr>--%>
             </tbody>
         </table>
     </div>
 </div> 
</asp:Content>
