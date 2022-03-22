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
    <section style="background: #efefe9;">
        <div class="row">
            <div class="panel panel-primary">
                <div class="panel-heading"><strong> LICENSING OF STUDENT RECRUITMENT AGENCIES PORTAL</strong> </div>
                <div class="board">
                    <div class="board-inner">
                        <ul class="nav nav-tabs" id="myTab">
                            <li class="active">
                                <a href="#home" data-toggle="tab" title="Step 1">
                                    <span class="round-tabs one">
                                        <i class="fa fa-home"></i>
                                        <strong>Stage1:</strong>
                                    </span>
                                </a></li>

                            <li><a href="#profile" data-toggle="tab" title="Step 2">
                                <span class="round-tabs two">
                                    <i class="fa fa-chevron-right"></i>
                                    <strong>Stage2:</strong>
                                </span>
                            </a>
                            </li>
                            <li><a href="#messages" data-toggle="tab" title="Step 3">
                                <span class="round-tabs three">
                                    <i class="fa fa-chevron-right"></i>
                                    <strong>Stage3:</strong>
                                </span></a>
                            </li>

                            <li><a href="#settings" data-toggle="tab" title="Step 4">
                                <span class="round-tabs four">
                                    <i class="fa fa-chevron-right"></i>
                                    <strong>Stage4:</strong>
                                </span>
                            </a></li>

                            <li><a href="#doner" data-toggle="tab" title="Step 5">
                                <span class="round-tabs five">
                                    <i class="fa fa-chevron-right"></i>
                                    <strong>Stage5:</strong>
                                </span></a>
                            </li>
                        </ul>

                    </div>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="home">
                            <div class="container">
                                <h2 style="color:blue">Awaiting Finance Processing</h2>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                        Application Process 20% Complete
                                    </div>
                                </div>
                                <p>Actionable items/Areas of responsibility are:</p>
                                <ul>
                                    <li>Undergoing preliminary check by the Commission</li>
                                    <li>Completeness check completed, awaiting payment by the University</li>
                                    <li>Completeness check completed, awaiting re-submission by the University (after preliminary check report has been submitted to university)</li>
                                </ul>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading"><strong>Awaiting Finance Processing</strong> </div>
                                        <div class="panel-body">
                                            <table class="table table-bordered table-striped table-hover" id="dataTables-example1">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Accreditation No:</th>
                                                        <th>Programme Name</th>
                                                        <th>Campus</th>
                                                        <th>Application Date</th>
                                                        <th>Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="profile">
                            <div>
                                <div class="container">
                                    <h2>Licencing of student recruitment agencies Progress</h2>
                                    <p>Completeness Check</p>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            Accreditation Process 40% Complete
                                        </div>
                                    </div>
                                    <p>Actionable items/Areas of responsibility are:</p>
                                    <ul>
                                        <li>Awaiting feedback from the Commission</li>
                                        <li>Awaiting feedback from the University (after Peer Reviewers’ report submitted to university)</li>
                                    </ul>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="panel panel-default">
                                            <div id="feedback" runat="server"></div>
                                            <div class="panel-heading"><strong>Completeness Check</strong> </div>
                                            <div class="panel-body">
                                                <div id="Div1" runat="server"></div>
                                                <table class="table table-bordered table-striped table-hover" id="dataTables-example2">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Accreditation No:</th>
                                                            <th>Programme Name</th>
                                                            <th>Campus</th>
                                                            <th>Application Date</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
    <%--                                                    <%
                                                            var nav2 = Config.ReturnNav();
                                                            var programs2 = nav2.ProgramAccreditation.Where(r => r.Institution_No == Convert.ToString(Session["UniversityCode"]) && r.Current_Version == true && r.Status == "Awaiting Peer Review");
                                                            int programme22 = 0;
                                                            foreach (var program2 in programs2)
                                                            {
                                                                programme22++;
                                                        %>
                                                        <tr>
                                                            <td><%=programme22%></td>
                                                            <td><%=program2.Accreditation_No %></td>
                                                            <td><%=program2.Program_Name %></td>
                                                            <td><%=program2.Campus_Name %></td>
                                                            <td><%=program2.Date_Created %></td>
                                                            <td><%=program2.Status %></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>--%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="messages">
                            <div class="container">
                                <h2>Licencing of student recruitment agencies Progress</h2>
                                <p>Awaiting Site Visit</p>
                                <div class="progress">
                                    <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                        Accreditation Process 60% Complete
                                    </div>

                                </div>
                                <p>Actionable items/Areas of responsibility are:</p>
                                <ul>
                                    <li>Awaiting feedback from the Commission</li>
                                    <li>Awaiting feedback from the University (after Peer Reviewers’ report submitted to university)</li>
                                </ul>
                            </div>
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="panel panel-default">
                                        <div class="panel-heading"><strong>Awaiting Site Visit</strong> </div>
                                        <div class="panel-body">
                                            <div id="Div2" runat="server"></div>
                                            <table class="table table-bordered table-striped table-hover" id="dataTables-example">
                                                <thead>
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Accreditation No:</th>
                                                        <th>Programme Name</th>
                                                        <th>Campus</th>
                                                        <th>Application Date</th>
                                                        <th>Status</th>
                                                </thead>
                                                <tbody>
 <%--                                                   <%
                                                        var nav3 = Config.ReturnNav();
                                                        var programs3 = nav3.ProgramAccreditation.Where(r => r.Institution_No == Convert.ToString(Session["UniversityCode"]) && r.Current_Version == true && r.Status == "Verification of Academic Resources");
                                                        int programme33 = 0;
                                                        foreach (var program3 in programs3)
                                                        {
                                                            programme33++;
                                                    %>
                                                    <tr>
                                                        <td><%=programme33 %></td>
                                                        <td><%=program3.Accreditation_No %></td>
                                                        <td><%=program3.Program_Name %></td>
                                                        <td><%=program3.Campus_Name %></td>
                                                        <td><%=program3.Date_Created %></td>
                                                        <td><%=program3.Status %></td>
                                                    </tr>
                                                    <%
                                                        }
                                                    %>--%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="settings">
                            <div>
                                <div class="container">
                                    <h2>Licensing of Student Recruitment Agencies</h2>
                                    <p>Being Processed for Approval</p>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            Accreditation Process 80% Complete
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading"><strong>Being Processed for Approval</strong> </div>
                                            <div class="panel-body">
                                                <div id="Div3" runat="server"></div>
                                                <table class="table table-bordered table-striped table-hover" id="dataTables-example4">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Accreditation No:</th>
                                                            <th>Programme Name</th>
                                                            <th>Campus</th>
                                                            <th>Application Date</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
<%--                                                        <%
                                                            var nav4 = Config.ReturnNav();
                                                            var programs4 = nav.ProgramAccreditation.Where(r => r.Institution_No == Convert.ToString(Session["UniversityCode"]) && r.Current_Version == true && r.Status == "Awaiting Board Approval");
                                                            int program44 = 0;
                                                            foreach (var program4 in programs4)
                                                            {
                                                                program44++;
                                                        %>
                                                        <tr>
                                                            <td><%=program44 %></td>
                                                            <td><%=program4.Accreditation_No %></td>
                                                            <td><%=program4.Program_Name %></td>
                                                            <td><%=program4.Campus_Name %></td>
                                                            <td><%=program4.Date_Created %></td>
                                                            <td><%=program4.Status %></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>--%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="doner">
                            <div>
                                <div class="container">
                                    <h2>Licensing of Student Recruitment Agencies</h2>
                                    <p>Application for licencing is completed</p>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%">
                                            Accreditation Process 100% Complete
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12 col-lg-12">
                                        <div class="panel panel-default">
                                            <div class="panel-heading"><strong>Application for Programme Accreditation completed</strong> </div>
                                            <div class="panel-body">
                                                <div id="Div4" runat="server"></div>
                                                <table class="table table-bordered table-striped table-hover" id="dataTables-example5">
                                                    <thead>
                                                        <tr>
                                                            <th>#</th>
                                                            <th>Accreditation No:</th>
                                                            <th>Programme Name</th>
                                                            <th>Campus</th>
                                                            <th>Application Date</th>
                                                            <th>Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
     <%--                                                   <%
                                                            var nav5 = Config.ReturnNav();
                                                            var programs5 = nav.ProgramAccreditation.Where(r => r.Institution_No == Convert.ToString(Session["UniversityCode"]) && r.Current_Version == true && r.Status == "Completed");
                                                            int programs55 = 0;
                                                            foreach (var program5 in programs5)
                                                            {
                                                                programs55++;
                                                        %>
                                                        <tr>
                                                            <td><%=programs55 %></td>
                                                            <td><%=program5.Accreditation_No %></td>
                                                            <td><%=program5.Program_Name %></td>
                                                            <td><%=program5.Campus_Name %></td>
                                                            <td><%=program5.Date_Created %></td>
                                                            <td><%=program5.Status %></td>
                                                        </tr>
                                                        <%
                                                            }
                                                        %>--%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>

            </div>
        </div>
    </section>
</asp:Content>
