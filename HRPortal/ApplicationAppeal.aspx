<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApplicationAppeal.aspx.cs" Inherits="HRPortal.ApplicationAppeal" %>
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
                <li class="breadcrumb-item active">Application Appeal</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Application Appeal
        </div>
        <div class="panel-body">
            <div runat="server" id="Div1"></div>
            <table id="example1" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Level</th>
                        <th>Domain</th>
                        <th>Title</th>
                        <th>University</th>
                        <th>Country</th>
                        <th>Purpose</th>
                        <th>Start Date</th>
                        <th>End Date</th>
                        <th>Amount</th>
                        <th>Appeal</th>
                    </tr>
                </thead>
                <tbody>
<%--                    <%
                        var nav = new Config().ReturnNav();
                        string docNo = Convert.ToString(Session["ApplicationNo"]);
                        var data = nav.Student_Qualification.Where(x => x.Application_No == docNo).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Program_Level%></td>
                        <td><% =item.Domain %></td>
                        <td><% =item.Title %></td>
                        <td><% =item.Institution %></td>
                        <td><% =item.Country_Code %></td>
                        <td><% =item.Purpose %></td>
                        <td><% = Convert.ToDateTime(item.From_Date).ToString("d/MM/yyyy") %></td>
                        <td><% = Convert.ToDateTime(item.To_Date).ToString("d/MM/yyyy") %></td>
                        <td><% =item.Amount %></td>
                        <td>
                            <label class="btn btn-success" onclick="moredetails('<%=item.Entry_No%>');"><i class="fa fa-pencil"></i>Edit</label></td>
                        <td>
                            <label class="btn btn-danger" onclick="sendApprovalRequest('<%=item.Entry_No%>');"><i class="fa fa-trash"></i>Remove</label></td>
                        <%
                            }
                        %>
                    </tr>--%>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>