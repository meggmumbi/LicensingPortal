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
            if (step>7||step<1)
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
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 1 of 7 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span> 
        </div>
        <div class="panel-body">
            <div runat="server" id="linesfeedback"></div>
            <div class="row">
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">License Type<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="licenseType" AppendDataBoundItems="true" CssClass="form-control select2">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value=001>Long Term License</asp:ListItem>
                        <asp:ListItem Value=002>Short Term License</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateresidence" ControlToValidate="licenseType" InitialValue="--Select--" ErrorMessage="Please select License Type, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Physical Address Status<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="addrresstype" AppendDataBoundItems="true" CssClass="form-control select2">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value=1>Owned</asp:ListItem>
                        <asp:ListItem Value=2>Leased</asp:ListItem>
                        
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateapplicanttype" ControlToValidate="addrresstype" InitialValue="--Select--" ErrorMessage="Please select Physical Address Status, it cannot be empty!" ForeColor="Red" />
                </div>
                </div>
                 <div class="col-md-6 col-lg-6">            
                <div class="form-group">
                    <label class="span2">Application Category<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="category" AppendDataBoundItems="true" CssClass="form-control select2">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="1">New</asp:ListItem>
                        <asp:ListItem Value="2">Appeal</asp:ListItem>
                      
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatelevel" ControlToValidate="category" InitialValue="--Select--" ErrorMessage="Please select Programme Level, it cannot be empty!" ForeColor="Red" />
                </div>
                      <div class="form-group">
                    <label class="span2">Country<span style="color: red">*</span> <%--<i style="color: blue">(Where you obtained programme)</i>--%></label>
                    <asp:DropDownList runat="server" ID="country" AppendDataBoundItems="true" CssClass="form-control select2">
                        <asp:ListItem>--Select--</asp:ListItem>
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
        <div class="panel-footer">
            <asp:Button runat="server" ID="addapplication" CssClass="btn btn-warning pull-right" Text="Add Application" OnClick="addapplication_Click"/>
            <div class="clearfix"></div>
        </div>
        <div class="panel-heading">
            My Applications
        </div>
        <div class="panel-body">
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
                        <th>Remove</th>
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
                        <td>
                            <label class="btn btn-danger" onclick="sendApprovalRequest('<%=item.Application_No%>');"><i class="fa fa-trash"></i>Remove</label></td>
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
            
            <asp:Button runat="server" ID="Nexttostep2" CssClass="btn btn-success pull-right" Text="Next" CausesValidation="false" OnClick="Nexttostep2_Click"/>
            <div class="clearfix"></div>
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
                Physical Location Details 
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 2 of 3 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
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
                            <asp:TextBox runat="server" ID="city" CssClass="form-control" />
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="city" ErrorMessage="Please select postCode, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>                
                

                </div>
            </div>
        </div>

        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Physical Location" ID="physicalAddressLocation" OnClick="physicalAddressLocation_Click" />
             <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtostep1" CausesValidation="false" OnClick="previousstep_Click"/>
            <div class="clearfix"></div>
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
                        var data = nav.ApplicationLocation.Where(x=> x.Application_No == docNo).ToList();
                        int counter = 0;
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
                         <td>   <label class="btn btn-success" onclick="moredetails('<%=item.Entry_No%>');"><i class="fa fa-pencil"></i>Edit</label></td>
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
            
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false"/>
            <div class="clearfix"></div>
        </div>
    </div>
       

                <% 
        }else if (step==3){
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
            Agency Facilities
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 3 of 5 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="AgencyFacilities"></div>
            <div class="row">

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
            </div>
        </div>
    </div>

    <div class="panel-footer">
        <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Agency Facilities" ID="Facility" OnClick="Facility_Click" />
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backToPhysical" CausesValidation="false" OnClick="previousstep_Click" />
        <div class="clearfix"></div>
    </div>
    <div class="panel-heading">
        Agency Facilities
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table id="example1" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>

                        <th>Facility Description</th>
                        <th>Quantity</th>
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
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
        <div class="clearfix"></div>
    </div>
    </div>
           <% 
        }else if (step==4){
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
            Agency Activities
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 4 of 5 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="AgencyActivitys"></div>
            <div class="row">

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


            </div>
        </div>
    </div>

    <div class="panel-footer">
        <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Agency Activity" ID="activity" OnClick="activity_Click" />
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backFacility" CausesValidation="false" OnClick="previousstep_Click" />
        <div class="clearfix"></div>
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
                        var nav = new Config().ReturnNav();
                        string docNo = Request.QueryString["ApplicationNo"];
                        if (docNo != "")
                        {
                            var data = nav.AgencyActivities.Where(x => x.Application_No == docNo).ToList();
                            int counter = 0;
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
                        %>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
    <div class="panel-footer">

        <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
        <div class="clearfix"></div>
    </div>
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
                <li class="breadcrumb-item active">Agency Governement Compliance</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Agency Governement Compliance
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 5 of 7 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
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
        </div>
    </div>

    <div class="panel-footer">
        <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Add Agency Governement Compliance" ID="governement" OnClick="governement_Click" />
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="BackActivity" CausesValidation="false" OnClick="previousstep_Click" />
        <div class="clearfix"></div>
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
        <div class="clearfix"></div>
    </div>
    </div>
        <%
        }

            else if (step==6){
              %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Supporting Documents
              <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 3 of 3 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
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

</asp:Content>


