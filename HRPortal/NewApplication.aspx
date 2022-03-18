<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewApplication.aspx.cs" Inherits="HRPortal.NewApplication" %>
<%@ Import Namespace="HRPortal" %>
<%@ Import Namespace="System.IO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%
        int step = 1;
        try
        {
            step = Convert.ToInt32(Request.QueryString["step"]);
            if (step>10||step<1)
            { 
               step = 1;  
            }
        }
        catch (Exception)
        { step = 1;
        }
        if (step == 1)
        {
           %>
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Home</a></li>
                <li class="breadcrumb-item active">Create A New Application</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Create A New Application (<i style="color: yellow">Kindly note that all fields marked with asterisk (<span style="color: red">*</span>) are mandatory</i>)
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 1 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span> 
        </div>
        <div class="panel-body">
            <div runat="server" id="linesfeedback"></div>
            <div class="row">
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">License Type<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="licenseType" AppendDataBoundItems="true" CssClass="form-control select2">                                      
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateresidence" ControlToValidate="licenseType" InitialValue="--Select--" ErrorMessage="Please select License Type, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Physical Address Status<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="addrresstype" AppendDataBoundItems="true" CssClass="form-control select2">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Owned</asp:ListItem>
                        <asp:ListItem Value="2">Leased</asp:ListItem>
                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateapplicanttype" ControlToValidate="addrresstype" InitialValue="--Select--" ErrorMessage="Please select Physical Address Status, it cannot be empty!" ForeColor="Red" />
                </div>
                </div>
                 <div class="col-md-6 col-lg-6">            
                <div class="form-group">
                    <label class="span2">Application Category<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="category" AppendDataBoundItems="true" CssClass="form-control select2">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="0">New</asp:ListItem>
                        <asp:ListItem Value="1">Appeal</asp:ListItem>
                      
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatelevel" ControlToValidate="category" InitialValue="--Select--" ErrorMessage="Please select Programme Level, it cannot be empty!" ForeColor="Red" />
                </div>
                      <div class="form-group">
                    <label class="span2">Country<span style="color: red">*</span> <%--<i style="color: blue">(Where you obtained programme)</i>--%></label>
                    <asp:DropDownList runat="server" ID="country" AppendDataBoundItems="true" CssClass="form-control select2">                    
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatecountry" ControlToValidate="country" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                </div>
                     </div>
                 <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Applicant Type<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="ApplicantType" AppendDataBoundItems="true" CssClass="form-control select2">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="1">Agency</asp:ListItem>
                        <asp:ListItem Value="2">Collaboration</asp:ListItem>                      
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatedomain" ControlToValidate="ApplicantType" InitialValue="--Select--" ErrorMessage="Please select Qualification Domain, it cannot be empty!" ForeColor="Red" />
                </div>
               
            
                <div class="form-group">
                    <label class="span2">Issuing University/Institution<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="Institutionuniversity" CssClass="form-control span3" placeholder="Please Enter Institution" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateuniversity" ControlToValidate="Institutionuniversity" ErrorMessage="Please enter Issuing University/Institution, it cannot be empty!" ForeColor="Red" />
                </div>
                     </div>
                 <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Physical Location<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="PhysicalLocation"  CssClass="form-control span3" placeholder="Please Enter Your Physical Location" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator1" ControlToValidate="PhysicalLocation" ErrorMessage="Please enter Your physical Location!" ForeColor="Red" />
                </div>
                           
                <div class="form-group">
                    <label class="span2">Email<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="email" TextMode="Email" CssClass="form-control span3" placeholder="Please Enter Your Email" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateenddate" ControlToValidate="email" ErrorMessage="Please enter Email!" ForeColor="Red" />
                </div>
             
            </div>
        </div>
            <div class="row" style="align-content:center">
                <asp:Button runat="server" ID="addapplication" CssClass="btn btn-warning center-block" Text="Add Application" OnClick="addapplication_Click" Visible="true"/>
                 <asp:Button runat="server" ID="editButton" CssClass="btn btn-warning center-block" Text="Edit Application" OnClick="addapplication_Click" Visible="false"/>
            </div>
        <div class="panel-footer">
            
               <asp:Button runat="server" ID="Nexttostep2" CssClass="btn btn-success pull-right" Text="Next" CausesValidation="false" OnClick="Nexttostep2_Click" Visible="false"/>
            <div class="clearfix"></div>
        </div>
   <%--     <div class="panel-heading">
            My Applications
        </div>--%>
    <%--    <div class="panel-body">
            <div runat="server" id="Div1"></div>
              <div class="table-responsive">
            <table id="example1" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Application Status</th>
                        <th>Application Category</th>
                        <th>Applicant Type</th>
                        <th>Institution Name</th>
                        <th>Registration Certificate</th>
                        <th>-Physical Address Status</th>
                        <th>Licence Type</th>
                        <th>Registration Date</th>
                        <th>Amount</th>
                        <th>Edit</th>                     
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                        string docNo = Request.QueryString["ApplicationNo"];

                        if (docNo == "")
                        {
                            docNo = Convert.ToString(Session["ApplicationNo"]);
                        }
                        if (docNo != "")
                        {
                            var data = nav.LicenceApplicationHeader.Where(x => x.Application_No == docNo).ToList();
                            int counter = 0;
                            foreach (var item in data)
                            {
                                counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Application_Status%></td>
                        <td><% =item.Application_Category %></td>
                        <td><% =item.Applicant_Type %></td>
                        <td><% =item.Institution_Name %></td>
                        <td><% =item.Registration_Certificate %></td>
                        <td><% =item.Physical_Address_Status %></td>
                        <td><% = item.Licence_Type_Description%></td>
                        <td><% = Convert.ToDateTime(item.Registration_Date).ToString("d/MM/yyyy") %></td>
                        <td><% =item.Application_Amount %></td>
                        <td>
                            <label class="btn btn-success" onclick="moredetails('<%=item.Application_No%>');"><i class="fa fa-pencil"></i>Edit</label></td>
                     
                        <%
                            }
                        }
                        %>
                    </tr>
                </tbody>
            </table>
                  </div>
        </div>--%>
     

    </div>
        </div>
    <% 
        }else if (step==2){
            %>
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Locations</li>
            </ol>
        </div>
    </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                Physical Location Details <i><strong> (Note: indicate all the proposed agency office locations/towns in Kenya. )</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 2 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
            </div>
            <div class="panel-body">
                <div runat="server" id="physicalLocations"></div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Address:</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="locationAddress" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Physical Location:</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="physicalLocationdetails" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Post Code:</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:DropDownList runat="server" ID="postCode" CssClass="form-control select2" OnSelectedIndexChanged="postCode_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem>--Select--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="postCode" InitialValue="--Select--" ErrorMessage="Please select Payment Type, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>County: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:DropDownList runat="server" ID="county" CssClass="form-control select2">
                                <asp:ListItem>--Select--</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="county" InitialValue="--Select--" ErrorMessage="Please select Payment Type, it cannot be empty!" ForeColor="Red" />


                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>City: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="city" CssClass="form-control" ReadOnly />
                          
                        </div>
                    </div>                
                

                </div>
            </div>
        </div>
       <div class="row" style="align-content:center">
                <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Add Physical Location" ID="physicalAddressLocation" OnClick="physicalAddressLocation_Click" />
            </div>


             <div class="panel-heading">
            Agency Physical Location 
        </div>
    <div class="panel-body">
        <div runat="server" id="Div2"></div>
        <div class="table-responsive">
            <table id="example1" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Address</th>
                        <th>Physical Location</th>
                        <th>Post Code</th>
                        <th>County</th>
                        <th>City</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                        string docNo = Request.QueryString["ApplicationNo"];
                        var data = nav.ApplicationLocation.Where(x => x.Application_No == docNo).ToList();
                        int counter = 0;
                        if (data.Count > 0)
                        {
                            nextBtn.Visible = true;
                            foreach (var item in data)
                            {
                                counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Address%></td>
                        <td><% =item.Physical_Location %></td>
                        <td><% =item.Post_Code %></td>
                        <td><% =item.County %></td>
                        <td><% =item.City %></td>
                        <td>
                             <label class="btn btn-success" onclick="editItem('<%=item.Entry_No%>','<%=item.Application_No %>','<%=item.Address %>','<%=item.Physical_Location %>','<%=item.Post_Code %>','<%=item.County %>','<%=item.City%>');"><i class="fa fa-edit">Edit</i></label></td>
                          
                        <td>
                              <label class="btn btn-danger" onclick="remove('<%=item.Entry_No %>','<%=item.Application_No %>');"><i class="fa fa-trash-o"></i> Remove</label>
                           
                        <%
                                }
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
            <div class="panel-footer">
             <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" ID="nextBtn" Visible="false"/>
             <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtostep1" CausesValidation="false" OnClick="previousstep_Click"/>
            <div class="clearfix"></div>
        </div>

    </div>
       

                <% 
    }
    else if (step == 3)
    {
            %>
       <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Agency Activities</li>
            </ol>
        </div>
    </div>

        <div class="panel panel-primary">
        <div class="panel-heading">
            Agency Activities <i><strong>(Type of activities to be undertaken by the agent.) Select Activity/Service to be offered</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 3 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="AgencyActivitys"></div>
           <%-- <div class="row">

                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Agency Activity:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:DropDownList runat="server" ID="AgencyActivity" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="facilityDescription" InitialValue="--Select--" ErrorMessage="Please select Facility, it cannot be empty!" ForeColor="Red" />
                    </div>

                    <div class="form-group">
                        <strong>Description: </strong><span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="description" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="description" ErrorMessage="Please Enter Description of Agency activities, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>


            </div>--%>


            <div class="row" style="justify-content:center">
                <input type="hidden" value="<% =Request.QueryString["ApplicationNo"] %>" id="txtAppNo" />
                <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped selectedprequalificationsWorks" id="example3">
                        <thead>
                            <tr>

                                <th>#</th>
                                <th>Code</th>
                                <th>Description</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% 
                                var nav = new Config().ReturnNav();
                                var Activities = nav.AgencyActivitiesSetup.ToList();

                                foreach (var activity in Activities)

                                {
                            %>
                            <tr>
                                <td>
                                    <input type="checkbox" id="worksselected" name="worksselected" class="checkboxes" value="<% =activity.Code %>" /></td>
                                <td><%=activity.Code %></td>
                                <td><%=activity.Description %></td>

                                <%} %>
                            </tr>
                        </tbody>
                    </table>


                </div>
                    </div>
                <div class="col-md-12 col-lg-12">
                    <input type="button" id="btn_apply_SubmitTargets" class="btn btn-success center-block btn_apply_SubmitTargets" name="btn_apply_SubmitTargets" value="Submit Selected Activities" />
                </div>
            </div>
            </div>

  <%--          <div class="panel-footer">
        <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Agency Activity" ID="activity" OnClick="activity_Click" Visible="false" />
       
        <div class="clearfix"></div>
    </div>--%>
        </div>
    <div class="panel-heading">
        Agency Activities
    </div>
    <div class="panel-body">
        <div runat="server" id="Div4"></div>
        <div class="table-responsive">
            <table id="example1" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>

                        <th>Activity</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%

                        string docNo = Request.QueryString["ApplicationNo"];
                        if (docNo != null)
                        {
                            try
                            {
                                var data = nav.AgencyActivities.Where(x => x.Application_No == docNo).ToList();
                                int counter = 0;
                                if (data.Count > 0)
                                {
                                    foreach (var item in data)
                                    {
                                        counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Description%></td>


                        <td>
                            <label class="btn btn-success" onclick="moredetails('<%=item.Application_No%>');"><i class="fa fa-pencil"></i>Edit</label></td>
                        <td>
                            <label class="btn btn-danger" onclick="sendApprovalRequest('<%=item.Application_No%>');"><i class="fa fa-trash"></i>Remove</label></td>
                        <%
                                        }
                                    }
                                }
                                catch (Exception ex)
                                {
                                    throw ex;
                                }
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer">
        <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
         <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backFacility" CausesValidation="false" OnClick="previousstep_Click" />
        <div class="clearfix"></div>
    </div>
    
           <% 
        }else if (step==4){
            %>
     <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Agency Governement Compliance</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Agency Governement Compliance <i><strong>(Compliance with national and County Government’s regulations governing public and health safety including fire safety)</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 4 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="governemt"></div>
            <div class="row">

                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Type of certificate:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:DropDownList runat="server" ID="certificateType" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="certificateType" InitialValue="--Select--" ErrorMessage="Please Type of Certificate, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Certificate Number: </strong><span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="certificatenumber" CssClass="form-control" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="certificatenumber" ErrorMessage="Please Enter Description of Agency activities, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Issue Date<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="issueDate" CssClass="form-control span3" TextMode="Date" placeholder="Please Enter Issue date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator2" ControlToValidate="issueDate" ErrorMessage="Please enter Issue Date!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Expiry Date<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="expiryDate" CssClass="form-control span3" TextMode="Date" placeholder="Please Enter Expiry date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator3" ControlToValidate="expiryDate" ErrorMessage="Please enter Expiry Date!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Authority Issuing Certificate: </strong><span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="Authority" CssClass="form-control" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="Authority" ErrorMessage="Please enter Authority Issuing Certificate, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
               <div class="row" style="align-content:center">
                    <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Add Agency Governement Compliance" ID="governement" OnClick="governement_Click" />
               
            </div>
        </div>
    </div>


    <div class="panel-heading">
        Agency Government Compliance
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table id="example1" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Type Of certificate</th>
                        <th>certificate Number</th>                      
                        <th>Date of Issue</th>
                        <th>Date of expiry</th>
                        <th>Authority Issuing Certificate</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
        var nav = new Config().ReturnNav();
        string docNo =Request.QueryString["ApplicationNo"];
        var data = nav.AgencyGovernmentCompliance.Where(x => x.Application_No == docNo).ToList();
        int counter = 0;
        foreach (var item in data)
        {
            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Type_of_certificate%></td>
                        <td><% =item.Certificate_No %></td>                      
                        <td><% = Convert.ToDateTime(item.Date_of_issue).ToString("d/MM/yyyy") %></td>
                        <td><% = Convert.ToDateTime(item.Date_of_expiry).ToString("d/MM/yyyy") %></td>
                        <td><% =item.Authority_issuing_certificate %></td>
                        <td>
                            <label class="btn btn-success" onclick="moredetails('<%=item.Entry_No%>');"><i class="fa fa-pencil"></i>Edit</label></td>
                        <td>
                            <label class="btn btn-danger" onclick="sendApprovalRequest('<%=item.Entry_No%>');"><i class="fa fa-trash"></i>Remove</label></td>
                        <%
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
        <div class="panel-footer">
       
               <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="BackActivity" CausesValidation="false" OnClick="previousstep_Click" />
        <div class="clearfix"></div>
    </div>
        <%
            }

            else if (step == 5)
            {
        %>
   
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Agency Facilities</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Agency Facilities <i><strong>(Office Space and Facilities) Note: A Student Recruitment Agency shall have appropriate and adequate office space</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 5 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="AgencyFacilities"></div>
<%--            <div class="row">

                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Facility description:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:DropDownList runat="server" ID="facilityDescription" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="facilityDescription" InitialValue="--Select--" ErrorMessage="Please select Facility, it cannot be empty!" ForeColor="Red" />
                    </div>

                    <div class="form-group">
                        <strong>Quantity: </strong><span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="quantity" CssClass="form-control" TextMode="Number" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="quantity" ErrorMessage="Please Enter Quantity of Facility, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>--%>


                <div class="row" style="justify-content:center">
                <input type="hidden" value="<% =Request.QueryString["ApplicationNo"] %>" id="txtAppNo" />
                <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped tblselectedFacilities" id="example1">
                        <thead>
                            <tr>

                                <th>#</th>
                                <th>Code</th>
                                <th>Description</th>
                                <th>Quantity</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% 
                                var nav = new Config().ReturnNav();
                                var Activities = nav.AgencyFacilitiesCategories.ToList();

                                foreach (var activity in Activities)

                                {
                            %>
                            <tr>
                                <td>
                                <input type="checkbox" id="FacilitySelected" name="FacilitySelected" class="checkboxes" value="<% =activity.Code %>" /></td>
                                <td><%=activity.Code %></td>
                                <td><%=activity.Description %></td>
                                <td><input type="number" class="form-control" autocomplete="off" id="Tquantity"  min="0" /></td> 

                                <%} %>
                            </tr>
                        </tbody>
                    </table>


                </div>
                    </div>
                <div class="col-md-12 col-lg-12">
                    <input type="button" id="btn_apply_SubmitFacilities" class="btn btn-success center-block btn_apply_SubmitFacilities" name="btn_apply_SubmitFacilities" value="Submit Selected Facilities" />
                </div>
            </div>


            <%-- <div class="row" style="align-content:center">
                 <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Add Agency Facilities" ID="Facility" OnClick="c" />
            </div>--%>
        </div>
    </div>

   
    <div class="panel-heading">
        Agency Facilities
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table id="example4" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>

                        <th>Facility Description</th>
                        <th>Quantity</th>                       
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                       
                        string docNo = Request.QueryString["ApplicationNo"];
                        var data = nav.AgencyApplicationFacilities.Where(x => x.Application_No == docNo).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Facility_Description%></td>
                        <td><% =item.Quantity %></td>                      
                        <td>
                             <label class="btn btn-danger" onclick="removeFacilities('<%=item.Entry_No %>','<%=item.Application_No %>');"><i class="fa fa-trash-o"></i> Remove</label></td>
                        <%
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer">        
      
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backToPhysical" CausesValidation="false" OnClick="previousstep_Click" />
       
        <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
        <div class="clearfix"></div>
    </div>
   
        <%
        }


              else if (step == 6)
            {
        %>
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">staff members Qualifications</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Agency Staff Profile <i><strong>(At least two staff members shall have a minimum of a Bachelor’s degree). Agency to fill following information for key members of staff:</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 6 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="keyStaff"></div>
            <div class="row">

                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Name of the staff<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="staffName" CssClass="form-control span3" placeholder="Please Enter the name of the Staff" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator4" ControlToValidate="staffName" ErrorMessage="Please enter Issue Date!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Gender<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="gender" AppendDataBoundItems="true" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                            <asp:ListItem Value="3">Others</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator5" ControlToValidate="gender" InitialValue="--Select--" ErrorMessage="Please select gender, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Nationality: </strong><span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="nationality" CssClass="form-control" placeholder="Please Enter Nationality of the Staff" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="nationality" ErrorMessage="Please Enter nationality of the staff, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Identity/ Passport No<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="idnumber" CssClass="form-control span3" placeholder="Please Enter Id Number / Passport Number" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator6" ControlToValidate="idnumber" ErrorMessage="Please enter Identity Number!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Work Permit Number: </strong><span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="workPermit" CssClass="form-control" placeholder="Please Enter work permit number" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="workPermit" ErrorMessage="Please enter work permit Number, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Work permit Expiry Date<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="workExpiryDate" CssClass="form-control span3" TextMode="Date" placeholder="Please Enter Expiry date" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator7" ControlToValidate="workExpiryDate" ErrorMessage="Please enter work permit Expiry Date!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>certificate of good conduct: </strong><span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="goodConduct" CssClass="form-control" placeholder="Please Enter certificate of good conduct number" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="goodConduct" ErrorMessage="Please enter certificate of good conduct Number, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Highest Academic Qualification and Specialization:</strong> <span class="asterisk" style="color: red">*</span>
                          <asp:TextBox runat="server" ID="academics" CssClass="form-control" placeholder="Please Enter Highest Academic Qualification of the staff" />
                        <%--<asp:DropDownList runat="server" ID="academic" CssClass="form-control select2">
                        </asp:DropDownList>--%>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="academics" InitialValue="--Select--" ErrorMessage="Please enter highest academic Qualification of the staff, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Terms of Service<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="termsOfService" AppendDataBoundItems="true" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Part-time</asp:ListItem>
                            <asp:ListItem Value="2">Full-time</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator8" ControlToValidate="termsOfService" InitialValue="--Select--" ErrorMessage="Please select terms of service, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            
        </div>
           <div class="row" style="align-content: center">
                <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Add Staff Member" ID="staffButton" OnClick="staffButton_Click" />

            </div>
    </div>


    <div class="panel-heading">
        Agency Staff Profile
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table id="example5" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name of Staff</th>
                        <th>Gender</th>                      
                        <th>Nationality</th>
                         <th>ID / Passport Number</th>
                         <th>Work Permit No</th>
                        <th>Work Permit expiry</th>  
                         <th>Good Conduct Cert No</th> 
                         <th>Academic Qualification Permit expiry</th>  
                         <th>Terms of Service</th>                                    
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                        string docNo =Request.QueryString["ApplicationNo"];
                        var data = nav.AgencyStaffProfile.Where(x => x.Application_No == docNo).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Name_of_staff%></td>
                        <td><% =item.Gender %></td>   
                        <td><% =item.Nationality %></td>  
                        <td><% =item.ID_No_Passport_No %></td> 
                        <td><% =item.Work_permit_No %></td>                
                        <td><% = Convert.ToDateTime(item.Work_permit_expiry_date).ToString("d/MM/yyyy") %></td>
                        <td><% =item.Good_Conduct_No %></td>
                        <td><% =item.Highest_academic_qualification %></td>
                        <td><% =item.Terms_of_Service %></td>                     
                        
                        <td>
                            <label class="btn btn-success" onclick="moredetails('<%=item.Entry_No%>');"><i class="fa fa-pencil"></i>Edit</label></td>
                        <td>
                            <label class="btn btn-danger" onclick="sendApprovalRequest('<%=item.Entry_No%>');"><i class="fa fa-trash"></i>Remove</label></td>
                        <%
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
        <div class="panel-footer">
       
               <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" CausesValidation="false" OnClick="previousstep_Click" />
        <div class="clearfix"></div>
    </div>

   
        <%
        }


            
              else if (step == 7)
            {
        %>
        <div class="row">
            <div class="col-sm-12">
                <ol class="breadcrumb float-sm-right">
                    <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                    <li class="breadcrumb-item active">Recruiting Institutions</li>
                </ol>
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                Agency Recruiting Institutions/ Universities <strong> (Only recruit students for admission into the universities and institutions approved by the Commission)</strong>
                <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 7 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
            </div>
            <div class="panel-body">
                <div runat="server" id="recruitingInst"></div>
                <p><i><strong>Provide for a list of the universities for which they apply to recruit for.</strong></i></p>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="span2">University/ Institution Name<span style="color: red">*</span></label>
                            <asp:TextBox runat="server" ID="InstName" CssClass="form-control span3" placeholder="Name" />
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator" ControlToValidate="InstName" ErrorMessage="Please enter Issue Date!" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Postal code:</label>
                            <asp:DropDownList CssClass="form-control" runat="server" ID="postalAddress" OnSelectedIndexChanged="postalAddress_SelectedIndexChanged" AutoPostBack="true" Style="height: 42px;" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Physical Address.</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="residentialAddress" Placeholder="Physical Address" type="text" Style="height: 42px;" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Physical Location</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="locationPhysical"  Style="height: 42px;" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>City: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="city2" CssClass="form-control" ReadOnly />
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Telephone Number</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="telephoneNo" Placeholder="Phone Number" TextMode="Number" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="telephoneNo" ErrorMessage="Please Enter a valid Phone Number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                        </div>
                    </div>
                      <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Country<span style="color: red">*</span> <%--<i style="color: blue">(Where you obtained programme)</i>--%></label>
                        <asp:DropDownList runat="server" ID="countryRecruit" AppendDataBoundItems="true" CssClass="form-control select2">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator9" ControlToValidate="country" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                    </div>
                          </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Email Address.</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="emailAddress" Placeholder="Enter Email Address" TextMode="Email" required />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="span2">Accreditation Status<span style="color: red">*</span></label>
                            <asp:DropDownList runat="server" ID="AccredStatus" AppendDataBoundItems="true" CssClass="form-control select2">
                                <asp:ListItem>--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Accredited</asp:ListItem>                              
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator10" ControlToValidate="AccredStatus" InitialValue="--Select--" ErrorMessage="Please select gender, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Accrediting Body.</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="AccreditingBody" Placeholder="AccreditingBody"  required  />
                        </div>
                    </div>
                </div>
                <div class="row" style="align-content: center">
                    <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Add Recruiting University/Institution" ID="recruitButton" OnClick="recruitButton_Click" />

                </div>
            </div>


    <div class="panel-heading">
        Recruiting Universities/Instituion
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table id="example7" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name</th>
                        <th>Address </th>                      
                        <th>City</th>
                         <th>Phone Number</th>
                         <th>Country</th>
                        <th>Email</th>  
                         <th>Accreditation Status</th> 
                         <th>Accrediting Body</th>                                                     
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                        string docNo =Request.QueryString["ApplicationNo"];
                        var data = nav.AgencyRecruitingUniversities.Where(x => x.Application_No == docNo).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Name%></td>
                        <td><% =item.Post_Code +" "+ item.Address+ " "+ item.Physical_Location %></td>   
                        <td><% =item.City %></td>  
                        <td><% =item.Phone_No %></td> 
                        <td><% =item.Country_Region_Code %></td>             
                        <td><% =item.Email %></td>
                        <td><% =item.Accreditation_Status %></td>
                        <td><% =item.Accrediting_Body %></td>                     
                        
                        <td>
                            <label class="btn btn-success" onclick="moredetails('<%=item.Entry_No%>');"><i class="fa fa-pencil"></i>Edit</label></td>
                        <td>
                            <label class="btn btn-danger" onclick="sendApprovalRequest('<%=item.Entry_No%>');"><i class="fa fa-trash"></i>Remove</label></td>
                        <%
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
        <div class="panel-footer">
       
               <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" CausesValidation="false" OnClick="previousstep_Click" />
        <div class="clearfix"></div>
    </div>
  <%
        }

        else if (step == 8)
            {
        %>
   
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active"> Services Offered to Students</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
           Services Offered to Students <i><strong>(The services rendered to students before and after they join the universities and institutions they are recruited for)</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 8 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="studentsServices"></div>
                <div class="row" style="justify-content:center">
                <input type="hidden" value="<% =Request.QueryString["ApplicationNo"] %>" id="txtAppNo" />
                <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped tblselectedServices" id="example8">
                        <thead>
                            <tr>

                                <th>#</th>
                                <th>Code</th>
                                <th>Description</th>
                                <th>Comment</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% 
                                var nav = new Config().ReturnNav();
                                var Activities = nav.AgencyFacilitiesCategories.ToList();

                                foreach (var activity in Activities)

                                {
                            %>
                            <tr>
                                <td>
                                <input type="checkbox" id="servicesSelected" name="servicesSelected" class="checkboxes" value="<% =activity.Code %>" /></td>
                                <td><%=activity.Code %></td>
                                <td><%=activity.Description %></td>
                                <td><input type="text" class="form-control" autocomplete="off" id="comment"  min="0" /></td> 

                                <%} %>
                            </tr>
                        </tbody>
                    </table>


                </div>
                    </div>
                <div class="col-md-12 col-lg-12">
                    <input type="button" id="btn_apply_SubmitServices" class="btn btn-success center-block btn_apply_SubmitServices" name="btn_apply_SubmitServices" value="Submit Selected services" />
                </div>
            </div>


            <%-- <div class="row" style="align-content:center">
                 <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Add Agency Facilities" ID="Facility" OnClick="c" />
            </div>--%>
        </div>
    </div>

   
    <div class="panel-heading">
       Services Offered 
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table id="example2" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>

                        <th>Facility Description</th>
                        <th>Quantity</th>                       
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                       
                        string docNo = Request.QueryString["ApplicationNo"];
                        var data = nav.AgencyApplicationFacilities.Where(x => x.Application_No == docNo).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Facility_Description%></td>
                        <td><% =item.Quantity %></td>                      
                        <td>
                             <label class="btn btn-danger" onclick="removeFacilities('<%=item.Entry_No %>','<%=item.Application_No %>');"><i class="fa fa-trash-o"></i> Remove</label></td>
                        <%
                            }
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer">        
      
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" CausesValidation="false" OnClick="previousstep_Click" />
       
        <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
        <div class="clearfix"></div>
    </div>
   
        <%
        }

            else if (step==9){
              %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Supporting Documents
              <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 9 of 10 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="documentsfeedback"></div>
            <div class="row">
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <div class="form-group">
                        <strong>Select file to upload:</strong>
                        <asp:FileUpload runat="server" ID="document" CssClass="form-control" Style="padding-top: 0px;" />
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                    <div class="form-group">
                        <br />
                        <asp:Button runat="server" CssClass="btn btn-success" Text="Upload Document" ID="uploadDocument" />
                    </div>
                </div>
            </div>
             <div class="table-responsive">
            <table id="mytable" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>Document Title</th>
                        <th>Download</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try
                        {
                            String fileFolderApplication = ConfigurationManager.AppSettings["FileFolderApplication"];
                            String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "Imprest Memo/";
                            String imprestNo = Request.QueryString["imprestNo"];
                            imprestNo = imprestNo.Replace('/', '_');
                            imprestNo = imprestNo.Replace(':', '_');
                            String documentDirectory = filesFolder + imprestNo + "/";
                            if (Directory.Exists(documentDirectory))
                            {
                                foreach (String file in Directory.GetFiles(documentDirectory, "*.*", SearchOption.AllDirectories))
                                {
                                    //String myfile = Convert.ToString(file);
                                    String url = documentDirectory;
                    %>
                    <tr>
                        <td><% =file.Replace(documentDirectory, "") %></td>
                        <td><a href="<%=fileFolderApplication %>\Imprest Memo\<% =imprestNo+"\\"+file.Replace(documentDirectory, "") %>" class="btn btn-success" download>Download</a></td>
                        <td>
                            <label class="btn btn-danger" onclick="deleteFile('<%=file.Replace(documentDirectory, "")%>');"><i class="fa fa-trash-o"></i>Delete</label></td>
                        <%-- <td><a href="imprest.aspx?&&myfile=<%=Request.QueryString["url"] %>"></a></td>  --%>
                    </tr>

                    <%
                                }
                            }
                        }
                        catch (Exception)
                        {

                        }%>
                </tbody>
            </table>
                 </div>
        </div>
        <center>
            <asp:Button runat="server" CssClass="btn btn-warning" Text="Preview/Print Application" ID="print" CausesValidation="false" OnClick="printreport_Click"/>
        </center>
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtostep2" CausesValidation="false" OnClick="previousstep_Click"/>
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Submit Application To CUE" ID="submitapplicationtocue" CausesValidation="false" OnClick="submitapplicationtocue_Click" />
            <div class="clearfix"></div>
        </div>
    </div>
        <%
        }
         %>

      <script>
          function editItem(entryNO, No, address, physicalLoc) {
              document.getElementById("ContentPlaceHolder1_originalItemNo").value = entryNO;
              document.getElementById("ContentPlaceHolder1_modalAppNo").value = No;
            document.getElementById("ContentPlaceHolder1_modalAddress").value = address;
            document.getElementById("ContentPlaceHolder1_modalPhysicalLoc").value = physicalLoc;      
         

            $("#editItemModel").modal();
        }
    </script>
    <script>
     function remove(entryNo, No) {
              document.getElementById("applicationToRemove").innerText = No;
              document.getElementById("ContentPlaceHolder1_entryNoRemove").value = entryNo;
              $("#removeDetailsModal").modal();
          }
      </script> 
       <script>
           function removeFacilities(entryNo, No) {
              document.getElementById("applicationToRemove").innerText = No;
              document.getElementById("ContentPlaceHolder1_entryNoRemove").value = entryNo;
              $("#removeFacilitiesModal").modal();
          }
      </script> 
     

    <div id="editItemModel" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div runat="server" id="teamFeedback"></div>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Location Details</h4>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="originalItemNo" type="hidden" />




                    <div class="form-group">
                        <strong>ApplicationNo:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="modalAppNo" CssClass="form-control" />
                    </div>


                    <div class="form-group">
                        <strong>Address:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="modalAddress" CssClass="form-control" />
                    </div>


                    <div class="form-group">
                        <strong>Physical Location:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="modalPhysicalLoc" CssClass="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-success" ID="EditDetails" Text="Edit Details" />

                </div>
                </div>
            </div>
            </div>
    <div id="removeDetailsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Deletion</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to remove the details of  <strong id="applicationToRemove"></strong>?</p>
                    <asp:TextBox runat="server" ID="entryNoRemove" type="hidden" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="Unnamed_Click"/>
                </div>
            </div>

        </div>
    </div>
        <div id="removeFacilitiesModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Deletion</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to remove the details of  <strong id="applicationToRemove"></strong>?</p>
                    <asp:TextBox runat="server" ID="TextBox1" type="hidden" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete" ID="facilities" OnClick="facilities_Click"/>
                </div>
            </div>

        </div>
    </div>
</asp:Content>


