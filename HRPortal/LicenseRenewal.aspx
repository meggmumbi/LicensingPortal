<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="LicenseRenewal.aspx.cs" Inherits="HRPortal.LicenseRenewal" %>
<%@ Import Namespace="HRPortal" %>
<%@ Import Namespace="System.IO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function Sum() {
            var text1 = document.getElementById('<%= NumberFemales.ClientID %>');
            var text2 = document.getElementById('<%= maleNumber.ClientID %>');
           

            var x = parseInt(text1.value);
            var y = parseInt(text2.value);
            document.getElementById('<%= totalSum.ClientID %>').value = x + y;
}
    </script>

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
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 1 of 9 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span> 
        </div>
        <div class="panel-body">
            <p style="color:blue">Incase of any changes during the expired license period edit the details below.</p>
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
                        <label class="span2">Type of Certification<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="certType" AppendDataBoundItems="true" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Certificate of Incorporation</asp:ListItem>
                            <asp:ListItem Value="2">Certificate of Business Name Registration</asp:ListItem>
                        </asp:DropDownList>
                         <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator17" ControlToValidate="certType" InitialValue="--Select--" ErrorMessage="Type of Certificate, it cannot be empty!" ForeColor="Red" />
                    </div>
                   <div class="form-group">
                       <label>Certificate No<span class="text-danger">*</span></label>
                       <asp:TextBox CssClass="form-control" runat="server" ID="certNo" Placeholder="Enter Certificate Number" />
                         <asp:RequiredFieldValidator Display="dynamic"  ID="certNoValidator9"  runat="server" ControlToValidate="certNo"  ErrorMessage="Certificate No, it cannot be empty!" ForeColor="Red" />
                   </div>
               </div>
                <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                       <label>Date of Incorporation/ Registration <i>(MM/dd/YYYY)</i></label>
                       <asp:TextBox CssClass="form-control" runat="server" ID="txtDateInc" TextMode="Date" />
                             <asp:RequiredFieldValidator Display="dynamic"  ID="RequiredFieldValidator18"  runat="server" ControlToValidate="txtDateInc"  ErrorMessage="Date of Incorporation/ Registration:, it cannot be empty!" ForeColor="Red" />

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
                        <label class="span2">Email<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="email" TextMode="Email" CssClass="form-control span3" placeholder="Please Enter Your Email" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateenddate" ControlToValidate="email" ErrorMessage="Please enter Email!" ForeColor="Red" />
                    </div>
                </div>

            </div>
            <p>------Office Physical Location Details-------</p>
            <div class="row">

                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label>Building Name.<span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" ID="PhysicalLocation" CssClass="form-control span3" placeholder="Please Enter Your Physical Location" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator1" ControlToValidate="PhysicalLocation" ErrorMessage="Please enter Your physical Location!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label>Street Name <span class="text-danger">*</span></label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="StreetName" Placeholder="Street Name" type="text" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator23" ControlToValidate="StreetName" ErrorMessage="Street Name must have a value, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label>Floor Name<span class="text-danger">*</span></label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="FloorNumber" Placeholder="Floor Name" type="text" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator24" ControlToValidate="FloorNumber" ErrorMessage="Floor Name must have a value, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label>Room Number. <span class="text-danger">*</span></label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="RoomNumber" Placeholder="Room Number" type="text" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator25" ControlToValidate="RoomNumber" ErrorMessage="Room Number must have a value, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
            </div>
            

          
                   <p style="align-content:center"><i></i><strong>--Head of Agency Details--</strong></p></i>
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
                            <label for="exampleInputEmail1">country of citizenship<span class="text-danger">*</span></label>
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
                <div class="col-md-2">
                    <div class="form-group">
                        <label>Country Codes<span class="text-danger">*</span></label>
                        <asp:DropDownList CssClass="form-control" runat="server" ID="CountryTeleCodes" Placeholder="Please enter Country code +254" TextMode="Number" />
                      <%--  <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator19" ControlToValidate="CountryTeleCodes" ErrorMessage="Country Code must have a value, it cannot be empty!" ForeColor="Red" />--%>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="city">Telephone Number<span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="HeadPhone" TextMode="Number"></asp:TextBox>
                       
                    </div>

                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="exampleInputEmail1">WhatsApp Number<span class="text-danger">*</span></label>
                        <asp:TextBox runat="server" CssClass="form-control" ID="hoaWhatsapp" TextMode="Number"></asp:TextBox>
                     
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



          <%--  
            <div class="row" style="align-content:center">
                <asp:Button runat="server" ID="addapplication" CssClass="btn btn-warning center-block" Text="Add Application" OnClick="addapplication_Click" Visible="false"/>
                 <asp:Button runat="server" ID="editButton" CssClass="btn btn-warning center-block" Text="Edit Application" OnClick="Nexttostep2_Click" Visible="false"/>
            </div>--%>
        <div class="panel-footer">
            
               <asp:Button runat="server" ID="Nexttostep2" CssClass="btn btn-success pull-right" Text="Next" CausesValidation="false" OnClick="addapplication_Click" />
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

                               
                                <th>Code</th>
                                <th>Category</th>
                                <th>Description</th>
                                 <th>Select(tick) Available facility</th>
                                <th>Quantity(where applicable)</th>
                                <th>Description (Where Applicable)</th>
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
                               
                               
                                <td><%=activity.Code %></td>
                                   <td><%=activity.Category %></td>
                                <td><%=activity.Description %></td>
                                <td><input type="checkbox" id="FacilitySelected" name="FacilitySelected" class="checkboxes" value="<% =activity.Code %>" /></td>
                                <td><input type="number" class="form-control" autocomplete="off" id="Tquantity"  min="0" /></td> 
                                 <td><input class="form-control" autocomplete="off" /></td> 

                                <%} %>
                            </tr>
                        </tbody>
                    </table>


                </div>
                    </div>
                <div class="col-md-12 col-lg-12">
                     <a href="#" class="btn btn-primary pull-left rounded" data-toggle="modal" data-target="#add_facility"><i class="fa fa-plus"></i> Add Any other Facility Available</a>
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
                        //var data = nav.LicenceApplicationHeader.Where(x=> x.Institution_No == institutionNo && x.License_Type=="Renewal").ToList();
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
                            <strong>Course Level<span class="text-danger">*</span></strong>
                            <asp:DropDownList runat="server" ID="courseType" AppendDataBoundItems="true" CssClass="form-control select2">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Undergraduate</asp:ListItem>
                                <asp:ListItem Value="2">Post Graduate</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Course Type: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="courseName" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Number of Females:</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="NumberFemales" TextMode="Number" CssClass="form-control" onblur="Sum()" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Number of Males:</strong> <span class="asterisk" style="color: red">*</span>
                            <asp:TextBox runat="server" ID="maleNumber" TextMode="Number" CssClass="form-control" onblur="Sum()" />
                        </div>
                    </div>
                     <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Country of Study: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:DropDownList runat="server" ID="countryStudy" CssClass="form-control select2" OnSelectedIndexChanged="countryStudy_SelectedIndexChanged" AutoPostBack="true"/> 
                        </div>
                    </div>
                    <div runat="server" id="kenLoc" visible="false">
                        <div class="col-md-6 col-lg-6">
                            <div class="form-group">
                                <strong>County: </strong><span class="asterisk" style="color: red">*</span>
                                <asp:DropDownList runat="server" ID="county" CssClass="form-control select2" />
                            </div>
                        </div>
                    </div>
                   
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Totals: </strong><span class="asterisk" style="color: red">*</span>
                            <input runat="server" ID="totalSum" class="form-control" ReadOnly="true"/>
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
            <i><strong>Universities and institutions the Agency Represents</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 4 of 6 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
        </div>
        <div class="panel-body">
            <div runat="server" id="governemt"></div>
            <div class="row">
                       <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Type of Organization the agency represents<span class="text-danger">*</span></strong>
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
                                     var details = nav.AgencyDocuments.Where(r => r.Application_Type == "Agency" && r.Blocked == false && r.Appliaction_Area=="License Renewal").ToList();
                                     int programesCounter = 0;
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
                                         <%  
                                                 }
                                             }
                                             else
                                             {
                                                 foreach (var detail in details)
                                                 {
                                                      programesCounter++;
                                         %>
                                     <tr>
                                         <td><%=programesCounter %></td>
                                         <td><%=detail.Code %></td>
                                         <td><%=detail.Description %></td>
                                         <td>
                                             <label class="btn btn-success" onclick="agentattachdocuments('<%=detail.Code %>');">Attach Document</label>
                                         </td>
                                     </tr>

                                 <%}
                                     }
                                 %>
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

     <script type="text/javascript">
            function agentattachdocuments(entryNo) {
                document.getElementById("ContentPlaceHolder1_DocCode").value = entryNo;
                $("#DocumentsAttach").modal();
            }
        </script>


      <div id="DocumentsAttach" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Attach the Document</h4>

                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <strong>Document Type</strong><span class="text-danger" style="font-size: 25px">*</span>
                        <asp:TextBox runat="server" ID="DocCode" CssClass="form-control" />
                    </div>
                  <%--  <div class="form-group">
                        <label>Issue Date:</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtDate" TextMode="Date" />

                    </div>
                    <div class="form-group">
                        <label>Expiry Date:</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtexpiry" TextMode="Date" />

                    </div>--%>
                    <div class="form-group">
                        <strong>Upload Document</strong><span class="text-danger" style="font-size: 25px">*</span>
                        <asp:FileUpload runat="server" CssClass="form-control" ID="uploadfile" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-success" Text="Upload Document" ID="uploadDoc" OnClick="uploadDoc_Click" />
                </div>
            </div>

        </div>
    </div>

    <div id="add_facility" class="modal custom-modal fade" role="dialog">        
            <div class="modal-dialog">
                  <div runat="server" id="Div4"></div>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Any Other available Facility</h5>
                    </div>
                    <div class="modal-body">
                          <div class="form-group">
                        <strong>Any other Facility:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="ANYotherfacility" CssClass="form-control" />
                    </div>
                  
                        <div class="m-t-20 text-center">
                              
                             <asp:Button runat="server" CssClass="btn btn-success" Text="Save Other Facility" ID="otherfacility" OnClick="otherfacility_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

      
</asp:Content>
