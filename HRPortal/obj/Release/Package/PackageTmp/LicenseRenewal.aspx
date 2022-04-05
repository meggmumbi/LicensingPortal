<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LicenseRenewal.aspx.cs" Inherits="HRPortal.LicenseRenewal" %>
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
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 1 of 6 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span> 
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
                        <label class="span2">Office Space Ownership<span style="color: red">*</span></label>
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
                        <label class="span2">Type of Certificate<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="certType" AppendDataBoundItems="true" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Certificate of Incorporation</asp:ListItem>
                            <asp:ListItem Value="2">Certificate of Registration</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                   <div class="form-group">
                       <label>Certificate of No:<span class="text-danger">*</span></label>
                       <asp:TextBox CssClass="form-control" runat="server" ID="certNo" Placeholder="Enter Certificate Number" Style="height: 42px;" />
                         <asp:RequiredFieldValidator Display="dynamic"  ID="certNoValidator9"  runat="server" ControlToValidate="certNo" InitialValue="--Select--" ErrorMessage="Please select Physical Address Status, it cannot be empty!" ForeColor="Red" />
                   </div>
               </div>

                <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                       <label>Date of Incorporation/ Registration: <i>(MM/dd/YYYY)</i></label>
                       <asp:TextBox CssClass="form-control" runat="server" ID="txtDateInc" TextMode="Date" Style="height: 42px;" />

                   </div>

             
                    <div class="form-group">
                        <label class="span2">Country<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="country" AppendDataBoundItems="true" CssClass="form-control select2">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatecountry" ControlToValidate="country" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>

                <div class="col-md-6 col-lg-6">


                    <div class="form-group">
                        <label class="span2">Physical Location <i>(Building name,Street name,Floor number,Room number,Town)</i><span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="PhysicalLocation" CssClass="form-control span3" placeholder="Please Enter Your Physical Location" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator1" ControlToValidate="PhysicalLocation" ErrorMessage="Please enter Your physical Location!" ForeColor="Red" />
                    </div>
                    <div class="form-group">
                        <label class="span2">Email<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="email" TextMode="Email" CssClass="form-control span3" placeholder="Please Enter Your Email" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateenddate" ControlToValidate="email" ErrorMessage="Please enter Email!" ForeColor="Red" />
                    </div>
                </div>
               
                </div>
                   <i><p><strong>--Head of Agency Details--</strong></p></i>
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Name of the head of the Agency <span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="hoaName"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Citizenship Type<span class="text-danger">*</span></label>
                        <asp:DropDownList runat="server" ID="citizenshipType" AppendDataBoundItems="true" CssClass="form-control select2" OnSelectedIndexChanged="citizenshipType_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Local</asp:ListItem>
                            <asp:ListItem Value="2">Foreign</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="foreignCitiz" runat="server" visible="false">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="exampleInputEmail1">country if citizenship<span class="text-danger">*</span></label>
                            <asp:DropDownList runat="server" ID="HOAC" AppendDataBoundItems="true" CssClass="form-control select2" OnSelectedIndexChanged="HOAC_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>

                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Form of citizenship<span class="text-danger">*</span></label>
                        <asp:DropDownList runat="server" ID="hoacitizen" AppendDataBoundItems="true" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Birth</asp:ListItem>
                            <asp:ListItem Value="2">Naturalization</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div id="local" runat="server">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">IdNumber<span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="hoaId"  ></asp:TextBox>
                    </div>
                </div>
                    </div>
                <div id="foreign" runat="server" visible="false">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Passport Number<span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="hoaPass" ></asp:TextBox>
                    </div>
                </div>
                    </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">Designation<span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="HoaDesignation"></asp:TextBox>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="city">Telephone Number<span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="HeadPhone" TextMode="Number"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="HeadPhone" ErrorMessage="Please Enter a valid Phone Number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">WhatsApp Number</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="hoaWhatsapp" TextMode="Number"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="hoaWhatsapp" ErrorMessage="Please Enter a valid Phone Number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="city">Email Address</label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="headEmail" TextMode="Email"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="headEmail" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>

            </div>
          <%--  <div class="row" style="align-content:center">
                <asp:Button runat="server" ID="addapplication" CssClass="btn btn-warning center-block" Text="Add Application" OnClick="addapplication_Click" Visible="true"/>
                 <asp:Button runat="server" ID="editButton" CssClass="btn btn-warning center-block" Text="Edit Application" OnClick="addapplication_Click" Visible="false"/>
            </div>--%>
        <div class="panel-footer">
            
               <asp:Button runat="server" ID="Nexttostep2" CssClass="btn btn-success pull-right" Text="Next" CausesValidation="false" OnClick="addapplication_Click"/>
            <div class="clearfix"></div>
        </div>
    </div>
        </div>
    <%
            }



            else if (step == 2)
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
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 2 of 6 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="AgencyFacilities"></div>

                <div class="row" style="justify-content:center">
                <input type="hidden" value="<% =Request.QueryString["ApplicationNo"] %>" id="txtAppNo" />
                <div class="col-md-12">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped tblselectedFacilities" id="example1">
                        <thead>
                            <tr>

                                <th>select If Available</th>
                                <th>Code</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Quantity</th>
                                <th>Adequcy</th>
                            </tr>
                        </thead>
                        <tbody>

                            <% 
                                var nav = new Config().ReturnNav();
                                var Activities = nav.AgencyFacilitiesSetup.ToList();

                                foreach (var activity in Activities)

                                {
                            %>
                            <tr>
                                <td>
                                <input type="checkbox" id="FacilitySelected" name="FacilitySelected" class="checkboxes" value="<% =activity.Code %>" /></td>
                                <td><%=activity.Code %></td>
                                   <td><%=activity.Category %></td>
                                <td><%=activity.Description %></td>
                                <td><input type="number" class="form-control" autocomplete="off" id="Tquantity"  min="0" /></td> 
                                <td><input type="number" class="form-control" autocomplete="off" id="Tadequcy"  min="0" /></td> 

                                <%} %>
                            </tr>
                        </tbody>
                    </table>


                </div>
                    </div>
                <div class="col-md-12 col-lg-12">
                    <input type="button" id="btn_apply_SubmitRenewalFacilities" class="btn btn-success center-block btn_apply_SubmitRenewalFacilities" name="btn_apply_SubmitRenewalFacilities" value="Submit Selected Facilities" />
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
   <%}
   
      else if (step == 3)
        {
            %>
    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active"> Student Application Statistics</li>
            </ol>
        </div>
    </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                Student Application Statistics
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 3 of 6 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
            </div>
            <div class="panel-body">
                <div runat="server" id="physicalLocations"></div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Course Type<span class="text-danger">*</span></strong>
                            <asp:DropDownList runat="server" ID="courseType" AppendDataBoundItems="true" CssClass="form-control select2">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Undergraduate</asp:ListItem>
                                <asp:ListItem Value="2">Post Graduate</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Course Name: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="courseName" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Number of Females:</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="NumberFemales" TextMode="Number" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Number of Males:</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="maleNumber" TextMode="Number" CssClass="form-control" />
                        </div>
                    </div>             
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>County: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:DropDownList runat="server" ID="county" CssClass="form-control select2" />               
                           
                        
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Totals: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="totals" TextMode="Number" CssClass="form-control"  />
                        </div>
                    </div>
                </div>
            </div>
        </div>
       <div class="row" style="align-content:center">
                <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Save Details" ID="saveDetails" OnClick="saveDetails_Click"/>
            </div>


             <div class="panel-heading">
          Student Applications Statistics
        </div>
    <div class="panel-body">
        <div runat="server" id="Div2"></div>
        <div class="table-responsive">
            <table id="example1" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Course Type</th>
                        <th>Course Name</th>
                        <th>Number of females</th>
                        <th>Number of males</th>
                        <th>County</th>
                        <th>Total Number</th>
                      
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                        string docNo = Request.QueryString["ApplicationNo"];
                        var data = nav.StudentStatistics.Where(x => x.Application_No == docNo).ToList();
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
                        <td><% =item.Course_Type%></td>
                        <td><% =item.Course %></td>
                        <td><% =item.Female %></td>
                        <td><% =item.Male %></td>
                        <td><% =item.County %></td>
                        <td><% =item.Total %></td>                    
                        <td>
                              <label class="btn btn-danger" onclick="remove('<%=item.Entry_No %>','<%=item.Application_No %>');"><i class="fa fa-trash-o"></i> Remove</label></td>
                           
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
             <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" ID="nextBtn"/>
             <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtostep1" CausesValidation="false" OnClick="previousstep_Click"/>
            <div class="clearfix"></div>
        </div>

       

                <% 
                    }
                    else if (step == 4)
                    {
            %>


    <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Universities and institutions the Agency Represents</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            <i><strong>(Universisities and institutions the Agency Represents)</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 4 of 6 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="governemt"></div>
            <div class="row">
                       <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Course Type<span class="text-danger">*</span></strong>
                            <asp:DropDownList runat="server" ID="DropDownList2" AppendDataBoundItems="true" CssClass="form-control select2">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">University</asp:ListItem>
                                <asp:ListItem Value="2">Institution</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label>Name: </label>
                        <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="universityName" CssClass="form-control" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="universityName" ErrorMessage="University/Institution Name:, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Country of Origin<span style="color: red">*</span> <%--<i style="color: blue">(Where you obtained programme)</i>--%></label>
                        <asp:DropDownList runat="server" ID="CountryNationality" AppendDataBoundItems="true" CssClass="form-control select2">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator11" ControlToValidate="CountryNationality" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
              <i><p><strong>--Select legal document available--</strong></p></i>
            <div class="row">
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                       
                        <asp:CheckBox CssClass="checkbox checkbox-inline" Text="Charter/Registration available" runat="server" ID="charter" />
                    </div>
                </div>

                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <%--  <label style="display:inline-block">MoU available: </label>--%>
                        <asp:CheckBox CssClass="checkbox checkbox-inline" Text="MoU available" runat="server" ID="mou" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <%--  <label>MoA available: </label>--%>
                        <asp:CheckBox CssClass="checkbox checkbox-inline" Text="MoA available" runat="server" ID="moa" />
                    </div>
                </div>

                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <%--  <label>MoF available: </label>--%>
                        <asp:CheckBox CssClass="checkbox checkbox-inline" Text="MoF available" runat="server" ID="mof" />
                    </div>
                </div>
            </div>
    </div>
    <div class="row" style="align-content: center">
        <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Save Legal Document Details" ID="governement" OnClick="governement_Click" />

    </div>
    </div>
 


    <div class="panel-heading">
     Agent Number Recruiting 
    </div>
    <div class="panel-body">
        <div class="table-responsive">
            <table id="example1" class="table table-striped table-bordered">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Name of the University/nstitution</th>                        
                        <th>Charter/Reg Certificate Available</th>
                         <th>MoA Available</th>
                         <th>MoF Available</th>
                         <th>MoU Available</th>                      
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                        string docNo = Request.QueryString["ApplicationNo"];
                        var data = nav.AgencyRecruitingUniversities.Where(x => x.Application_No == docNo).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Name%></td>
                        <%if (item.Charter_Reg_Availlable == true)
                            {
                        %>
                          <td><p style="color:green"><strong>Document available</strong></p></td>

                        <%}

                            else
                            {

                        %>
                        <td><p style="color:red"><strong>Document not Available</strong></p></td>


                        <%} %>
                         <%if (item.MoA_Availlable == true)
                            {
                        %>
                        <td><p style="color:green"><strong>Document available</strong></p></td>

                        <%}

                            else
                            {

                        %>
                        <td><p style="color:red"><strong>Document not Available</strong></p></td>


                        <%} %>
                         <%if (item.MoF_Availlable == true)
                            {
                        %>
                          <td><p style="color:green"><strong>Document available</strong></p></td>

                        <%}

                            else
                            {

                        %>
                        <td><p style="color:red"><strong>Document not Available</strong></p></td>


                        <%} %>
                         <%if (item.MoU_Availlable == true)
                            {
                        %>
                        <td><p style="color:green"><strong>Document available</strong></p></td>

                        <%}

                            else
                            {

                        %>
                        <td><p style="color:red"><strong>Document not Available</strong></p></td>


                        <%} %>

                          
                        <td>
                              <label class="btn btn-danger" onclick="removeGovernance('<%=item.Entry_No %>','<%=item.Application_No %>');"><i class="fa fa-trash-o"></i> Remove</label></td>
                      
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
      <div class="panel panel-primary">
        <div class="panel-heading">
            Supporting Documents
              <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 5 of 6 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
         <div class="panel-body">
             <div runat="server" id="documentsfeedback"></div>
             <div class="row">
                 <div class="col-md-12 col-lg-12">
                     <div class="table-responsive">
                         <table class="table table-striped custom-table datatable" id="example9">
                             <thead>
                                 <tr>
                                     <th>#</th>
                                     <th>Code</th>
                                     <th>Description</th>
                                     <th>Attach Document</th>
                                 </tr>

                             </thead>
                             <tbody>
                                 <% 
                                     var nav = new Config().ReturnNav();
                                     var details = nav.AgencyDocuments.Where(r => r.Application_Type == "Agency" && r.Blocked == false).ToList();

                                     var attacheddoc = nav.AgencyAttachedDocuments.Where(x => x.Application_No == Convert.ToString(Request.QueryString["ApplicationNo"])).ToList();




                                     if (attacheddoc.Count > 0)
                                     {
                                         List<AttachedDoc> attachaedDocuments = new List<AttachedDoc>();

                                         foreach (var exemptionEntrys in attacheddoc)
                                         {

                                             AttachedDoc list1 = new AttachedDoc();
                                             list1.code = exemptionEntrys.Code;

                                             attachaedDocuments.Add(list1);

                                         }
                                         List<NotAttachedDoc> studetnExemptEntries = new List<NotAttachedDoc>();
                                         NotAttachedDoc[] exemptEntryArray = studetnExemptEntries.ToArray();



                                         foreach (var subtopic in details)
                                         {

                                             NotAttachedDoc list = new NotAttachedDoc();
                                             list.code = subtopic.Code;
                                             list.description = subtopic.Description;
                                             studetnExemptEntries.Add(list);
                                         }

                                         HashSet<string> diffidsz = new HashSet<string>(attachaedDocuments.Select(s => s.code));

                                         var result = studetnExemptEntries.Where(m => !diffidsz.Contains(m.code)).ToList();




                                         int programesCounter = 0;
                                         int counter1 = 0;
                                         foreach (var detail in result)
                                         {

                                             counter1++;
                                             programesCounter++;
                                 %>
                                 <tr>
                                     <td><%=programesCounter %></td>
                                     <td><%=detail.code %></td>
                                     <td><%=detail.description %></td>

                                     <% %>


                                     <td>
                                         <label class="btn btn-success" onclick="agentattachdocuments('<%=detail.code %>');">Attach Document</label>
                                     </td>
                                 </tr>
                                 <%  
                                     }
                                 } %>
                             </tbody>
                         </table>
                     </div>
                 </div>
             </div>
             <div class="table-responsive">
            <table id="mytable" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Code</th>
                        <th>Description</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>

                   
                    <%
                       
                        string docNo = Request.QueryString["ApplicationNo"];
                        var data = nav.AgencyAttachedDocuments.Where(x => x.Application_No == docNo && x.Attached==true).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Code%></td>
                        <td><% =item.Description %></td>                                   
                        
                      
                          
                        <td>
                              <label class="btn btn-danger" onclick="removeDoc('<%=item.Entry_No %>','<%=item.Code %>');"><i class="fa fa-trash-o"></i> Remove</label></td>
                        <%
                            }
                        %>
                    </tr>
                </tbody>

            </table>
                 </div>
        </div>
<%--        <center>
            <asp:Button runat="server" CssClass="btn btn-warning" Text="Preview/Print Application" ID="print" CausesValidation="false" OnClick="printreport_Click"/>
        </center>--%>
        <div class="panel-footer">
               
               <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
        <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="Button2" CausesValidation="false" OnClick="previousstep_Click" />
            <div class="clearfix"></div>
        </div>
    </div>
         <%}
        else if (step == 6)
            {
              %>
       <div class="row">
        <div class="col-sm-12">
            <ol class="breadcrumb float-sm-right">
                <li class="breadcrumb-item"><a href="Home.aspx">Dashboard</a></li>
                <li class="breadcrumb-item active">Payment</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Payments <i><strong>(Pay the requisite license renewal charges.):</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 6 of 6 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">

            <div runat="server" id="feedback"></div>
            <h4 style="color: red"><u>Note:</u></h4>
            <div class="row">
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Select mode of payment</strong>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="DropDownList1">
                            <asp:ListItem>--select--</asp:ListItem>
                            <asp:ListItem Value="1">Bank Deposit.</asp:ListItem>
                            <asp:ListItem Value="2">Mpesa </asp:ListItem>
                         
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Amount to Pay</strong>
                        <asp:TextBox runat="server" ID="PayingAmount" CssClass="form-control" TextMode="Number" ReadOnly></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Amount Paid</strong>
                        <asp:TextBox runat="server" ID="amountPaide" CssClass="form-control" TextMode="Number" ></asp:TextBox>
                    </div>
                </div>
                   <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Payment Reference Number</strong>
                        <asp:TextBox runat="server" ID="PayRef" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                 
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Attach Evidence of Payment:</strong>
                        <asp:FileUpload runat="server" CssClass="form-control" ID="FileUpload1"></asp:FileUpload>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6" style="display:none">
                    <div class="form-group">
                        <br />
                        <asp:Button runat="server" CssClass="btn btn-success" Text="Upload Document" ID="Button1" />
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <asp:Button runat="server" CssClass="btn btn-success btn-block" Text="Submit evidence of payment" OnClick="payment_Click" />
                    </div>
                </div>
                </div>
            </div>
           </div>
             <div class="panel-footer">
                <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" OnClick="previousstep_Click" />
                 <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Submit Renewal Application" ID="submit" OnClick="submitApplication_Click" Visible="false"/>          
                <div class="clearfix"></div>
            </div>
     
    
    <%
        }

        %>




      
</asp:Content>
