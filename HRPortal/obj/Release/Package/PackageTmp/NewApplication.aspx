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
            if (step>11||step<1)
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
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 1 of 11 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span> 
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
                        <label class="span2">Type of Certification<span style="color: red">*</span></label>
                        <asp:DropDownList runat="server" ID="certType" AppendDataBoundItems="true" CssClass="form-control select2">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Certificate of Incorporation</asp:ListItem>
                            <asp:ListItem Value="2">Certificate of Registration</asp:ListItem>
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
                <li class="breadcrumb-item active">Locations</li>
            </ol>
        </div>
    </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
                Physical Location Details <i><strong> (Note: indicate all the proposed agency office locations/towns in Kenya. )</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 2 of 11 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
            </div>
            <div class="panel-body">
                <div runat="server" id="physicalLocations"></div>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>Location Type<span class="text-danger">*</span></strong>
                            <asp:DropDownList runat="server" ID="locationType" AppendDataBoundItems="true" CssClass="form-control select2">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Head Office</asp:ListItem>
                                <asp:ListItem Value="2">Branch</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
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
                            <asp:DropDownList runat="server" ID="postCode" CssClass="form-control select2" OnSelectedIndexChanged="postCode_SelectedIndexChanged" AutoPostBack="true" />                             
                          
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="postCode" InitialValue="--Select--" ErrorMessage="Please select Payment Type, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <strong>County: </strong><span class="asterisk" style="color: red">*</span>
                            <asp:DropDownList runat="server" ID="county" CssClass="form-control select2" />                   
                           
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="county" ErrorMessage="Please select Payment Type, it cannot be empty!" ForeColor="Red" />
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
             <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" OnClick="nextstep_Click" CausesValidation="false" ID="nextBtn" Visible="false"/>
             <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtostep1" CausesValidation="false" OnClick="previousstep_Click"/>
            <div class="clearfix"></div>
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
                    <li class="breadcrumb-item active">Recruiting Institutions</li>
                </ol>
            </div>
        </div>
        <div class="panel panel-primary">
            <div class="panel-heading">
              Institutions/ Universities represented by the agency <strong> (Provide for a list of the universities for which they apply to recruit for.)</strong>
                <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 3 of 11 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
            </div>
            <div class="panel-body">
                <div runat="server" id="recruitingInst"></div>
                <p><i><strong>Details of the Institutions/universities which the proposed Agency will be recruiting students.</strong></i></p>
                <div class="row">
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="span2">Name of Institution/University<span style="color: red">*</span></label>
                            <asp:TextBox runat="server" ID="InstName" CssClass="form-control span3" placeholder="Name" />
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator" ControlToValidate="InstName" ErrorMessage="Please enter Issue Date!" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="span2">Country of origin<span style="color: red">*</span></label>
                            <asp:DropDownList runat="server" ID="countryRecruit" AppendDataBoundItems="true" CssClass="form-control select2" OnSelectedIndexChanged="countryRecruit_SelectedIndexChanged" AutoPostBack="true"/>                          
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator9" ControlToValidate="countryRecruit" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>

                    <div runat="server" visible="false" id="postals">
                        <div class="col-md-6 col-lg-6">
                            <div class="form-group">
                                <label>Postal code:</label>
                                <asp:DropDownList CssClass="form-control" runat="server" ID="postalAddress" OnSelectedIndexChanged="postalAddress_SelectedIndexChanged" AutoPostBack="true" />
                                <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator12" ControlToValidate="postalAddress" InitialValue="--Select--" ErrorMessage="Please select postal code, it cannot be empty!" ForeColor="Red" />
                            </div>
                        </div>
                        <div class="col-md-6 col-lg-6">
                            <div class="form-group">
                                <label>City: </label><span class="asterisk" style="color: red">*</span>
                                <asp:TextBox runat="server" ID="city2" CssClass="form-control" ReadOnly />
                                 <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator13" ControlToValidate="city2" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Physical Address.</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="residentialAddress" Placeholder="Physical Address" type="text"  />
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator14" ControlToValidate="residentialAddress" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Physical Location</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="locationPhysical" />
                        </div>
                    </div>
                    <div class="col-md-2 col-lg-2">
                        <div class="form-group">
                            <label>Country Codes. <span class="text-danger">*</span></label>
                            <asp:DropDownList CssClass="form-control" runat="server" ID="AgencyCountryCode" Placeholder="Please enter Country code +254" TextMode="Number" />
                            <%--  <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator19" ControlToValidate="CountryTeleCodes" ErrorMessage="Country Code must have a value, it cannot be empty!" ForeColor="Red" />--%>
                        </div>
                    </div>
                    <div class="col-md-4 col-lg-4">
                        <div class="form-group">
                            <label>Telephone Number</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="telephoneNo" Placeholder="Phone Number" TextMode="Number" />
                             <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator19" ControlToValidate="telephoneNo" InitialValue="--Select--" ErrorMessage="Institution Telephone Number, it cannot be empty!" ForeColor="Red" />

                        </div>
                    </div>
               
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Email Address.</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="emailAddress" Placeholder="Enter Email Address" TextMode="Email" />
                             <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator15" ControlToValidate="emailAddress" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>
                       <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label>Accrediting Body.</label>
                            <asp:TextBox CssClass="form-control" runat="server" ID="AccreditingBody" Placeholder="AccreditingBody"/>
                             <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator16" ControlToValidate="AccreditingBody" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="span2">Accreditation Status<span style="color: red">*</span></label>
                            <asp:DropDownList runat="server" ID="AccredStatus" AppendDataBoundItems="true" CssClass="form-control select2">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Accredited</asp:ListItem>
                            </asp:DropDownList>                           
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator10" ControlToValidate="AccredStatus" InitialValue="--Select--" ErrorMessage="Please select gender, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>
                </div>
                <div class="row" style="align-content: center">
                    <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Add University/Institution" ID="recruitButton" OnClick="recruitButton_Click" />

                </div>
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
                        <td><% =item.Post_Code + " " + item.Address + " " + item.Physical_Location %></td>   
                        <td><% =item.City %></td>  
                        <td><% =item.Phone_No %></td> 
                        <td><% =item.Country_Region_Code %></td>             
                        <td><% =item.Email %></td>
                        <td><% =item.Accreditation_Status %></td>
                        <td><% =item.Accrediting_Body %></td>                  
                   
                    <td>
                             <label class="btn btn-danger" onclick="removeRecruitingUniversitites('<%=item.Entry_No %>','<%=item.Name %>');"><i class="fa fa-trash-o"></i> Remove</label></td>
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
               else if (step == 4)
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
         <i><strong>The services rendered to students before and after they join the universities and institutions they are recruited for</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 4 of 11 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
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

                               
                                <th>Code</th>
                                <th>Description</th>
                                 <th>Select(tick) service offered</th>
                                <th>Comment</th>
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
                               
                               
                                <td><%=activity.Code %></td>
                                <td><%=activity.Description %></td>
                                <td><input type="checkbox" id="servicesSelected" name="servicesSelected" class="checkboxes" value="<% =activity.Code %>" /></td>
                                <td><input type="text" class="form-control" autocomplete="off" id="comment"  min="0" /></td>

                                <%} %>
                            </tr>
                        </tbody>
                    </table>
                </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-6">
                            <div class="form-group">
                                <strong>Others (Describe):</strong> <span class="asterisk" style="color: red">*</span>
                                <asp:TextBox runat="server" ID="Others" CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                <div class="col-md-12 col-lg-12">
                    <input type="button" id="btn_apply_SubmitServices" class="btn btn-success center-block btn_apply_SubmitServices" name="btn_apply_SubmitServices" value="Submit Selected services" />
                </div>
            </div>
                  <div class="col-xs-8 text-right m-b-30">
                    <a href="#" class="btn btn-primary pull-right rounded" data-toggle="modal" data-target="#add_banks"><i class="fa fa-plus"></i> Add Any other service</a>
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

                        <th>Service Offered</th>                      
                        <th>Comment</th>                   
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%

                        string docNo = Request.QueryString["ApplicationNo"];
                        var data = nav.AgencyActivities.Where(x => x.Application_No == docNo && x.Type == "Student Service").ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><% =item.Description%></td>
                        <td><% =item.Comments %></td>                      
                        <td>
                             <label class="btn btn-danger" onclick="removeAgencyActivity('<%=item.Entry_No %>','<%=item.Application_No %>');"><i class="fa fa-trash-o"></i> Remove</label></td>
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
            Agency Governement Compliance <i><strong>(Compliance with national and County Government’s regulations governing public and health safety including fire safety)</strong></i>
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 5 of 11 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
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
         <%--       <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>provide for upload of memorandum of Understanding; and  Finance Agreement between proposed Agency and each university.<i>(pdf only)  </i></strong>
                        <asp:FileUpload runat="server" CssClass="form-control" ID="FileUpload1"></asp:FileUpload>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Only PDF files are allowed!" ValidationExpression="^.*\.(pdf|PDF)$" ControlToValidate="FileUpload1" CssClass="text-red"></asp:RegularExpressionValidator>
                    </div>

                </div>--%>
            </div>
               <div class="row" style="align-content:center">
                    <asp:Button runat="server" CssClass="btn btn-success center-block" Text="Add Agency Government Compliance" ID="governement" OnClick="governement_Click" />
               
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
                        string docNo = Request.QueryString["ApplicationNo"];
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
                             <label class="btn btn-success" onclick="editGovernance('<%=item.Entry_No%>','<%=item.Application_No %>','<%=item.Certificate_No %>','<%=item.Date_of_issue %>','<%=item.Date_of_expiry %>','<%=item.Authority_issuing_certificate %>');"><i class="fa fa-edit">Edit</i></label></td>
                          
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


            else if (step == 6)
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
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 6 of 11 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
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
                                <th>Quantity</th>
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
            else if (step == 7)
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
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 7 of 11 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
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
                            <asp:ListItem value="0">--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Male</asp:ListItem>
                            <asp:ListItem Value="2">Female</asp:ListItem>
                            <asp:ListItem Value="3">Others</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator5" ControlToValidate="gender" InitialValue="--Select--" ErrorMessage="Please select gender, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
        
                      <div class="col-md-6 col-lg-6">
                        <div class="form-group">
                            <label class="span2">Country of Origin<span style="color: red">*</span> <%--<i style="color: blue">(Where you obtained programme)</i>--%></label>
                            <asp:DropDownList runat="server" ID="CountryNationality" AppendDataBoundItems="true" CssClass="form-control select2" OnSelectedIndexChanged="CountryNationality_SelectedIndexChanged" AutoPostBack="true">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator11" ControlToValidate="country" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                        </div>
                    </div>
                 <div runat="server" id="IdNo" visible="true">
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <label class="span2">Identity No (ID)<span style="color: red">*</span></label>
                        <asp:TextBox runat="server" ID="idnumber" CssClass="form-control span3" placeholder="Please Enter Id Number / Passport Number" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator6" ControlToValidate="idnumber" ErrorMessage="Please enter Identity Number!" ForeColor="Red" />
                    </div>
                </div>
                     </div>
                <div runat="server" id="workP" visible="false">
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
                        <strong>Passport Number: </strong><span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="passportNo" CssClass="form-control" placeholder="Passport Number" />
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="passportNo" ErrorMessage="Please Enter nationality of the staff, it cannot be empty!" ForeColor="Red" />
                    </div>
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
                       <%--   <asp:TextBox runat="server" ID="academics" CssClass="form-control" placeholder="Please Enter Highest Academic Qualification of the staff" />--%>
                        <asp:DropDownList runat="server" ID="academic" CssClass="form-control select2">
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ControlToValidate="academic" InitialValue="--Select--" ErrorMessage="Please enter highest academic Qualification of the staff, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Terms of Service<span style="color: red">*</span></strong>
                        <asp:DropDownList runat="server" ID="termsOfService" AppendDataBoundItems="true" CssClass="form-control select2">
                            <asp:ListItem Value="0">--Select--</asp:ListItem>
                            <asp:ListItem Value="1">Part-time</asp:ListItem>
                            <asp:ListItem Value="2">Full-time</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator8" ControlToValidate="termsOfService" InitialValue="--Select--" ErrorMessage="Please select terms of service, it cannot be empty!" ForeColor="Red" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>provide for upload of certificate of good conduct.<i>(pdf only)  </i><span style="color: red">*</span></strong>
                        <asp:FileUpload runat="server" CssClass="form-control" ID="FileUpload1"></asp:FileUpload>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator20" ControlToValidate="FileUpload1" ErrorMessage="Please Upload certificate of good conduct, it cannot be empty!" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="Only PDF files are allowed!" ValidationExpression="^.*\.(pdf|PDF)$" ControlToValidate="FileUpload1" CssClass="text-red"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>provide for upload of Staff Academic certificate.<i>(pdf only)  </i><span style="color: red">*</span></strong>
                        <asp:FileUpload runat="server" CssClass="form-control" ID="FileUpload2"></asp:FileUpload>
                        <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator21" ControlToValidate="FileUpload2" ErrorMessage="Please Upload staff's academic certificate, it cannot be empty!" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Only PDF files are allowed!" ValidationExpression="^.*\.(pdf|PDF)$" ControlToValidate="FileUpload2" CssClass="text-red"></asp:RegularExpressionValidator>
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
                        string docNo = Request.QueryString["ApplicationNo"];
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
                             <label class="btn btn-success" onclick="editStaffProfile('<%=item.Entry_No%>','<%=item.Name_of_staff %>','<%=item.Nationality %>','<%=item.ID_No_Passport_No %>','<%=item.Work_permit_No %>','<%=item.Good_Conduct_No %>');"><i class="fa fa-edit">Edit</i></label></td>
                          
                        <td>
                              <label class="btn btn-danger" onclick="removeStaff('<%=item.Entry_No %>','<%=item.Name_of_staff %>');"><i class="fa fa-trash-o"></i> Remove</label></td>
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

        <div class="panel panel-default" style="width: 80%; margin: 0 auto">
            <div class="panel-heading" id="institutional">
                <%
                    var nav = new Config().ReturnNav();
                    var Qcategory = nav.AgencyQuestionCategories.Where(r => r.Code == "HR");
                    var chapter1 = "";
                    foreach (var header in Qcategory)
                    {
                        chapter1 = header.Description;
                    }
                %>
                <p><i><strong>Provide for ‘Yes’ or ‘No’ answer</strong></i></p>
                <label class="pull-right">Step 8 of 11</label>
                <div class="clearfix"></div>
            </div>
            <div id="Div1" runat="server"></div>
            <div class="panel-body">
                <div class="row">


                    <div class="col-md-12 col-lg-12">
                        <p>
                            <i>
                                <label>Human Resources(A Student Recruitment Agency shall have adequate and competent human resources to execute its mandate in accordance with its human resource policy).</label>
                            </i>
                        </p>
                    </div>
                    <%
                        var Questions = nav.AgencyQuestionList.Where(r => r.Question_Category == "HR" && r.Question_Types != "Table").ToList();
                        int NumberofQuestions = 0;
                        var TopicDescription = "";
                        var TopicNumber = "";
                        var qnCategoryDescription = "";
                        foreach (var topic in Questions)
                        {
                            TopicDescription = topic.Description;
                            TopicNumber = topic.Code;
                            qnCategoryDescription = topic.Question_Category;
                    %>

                    <div class="col-md-6 col-lg-6">
                        <div class="form-group">

                            <p>
                                <%=TopicDescription %>
                            </p>

                            <% 

                                NumberofQuestions += 1;
                            %>
                            <div class="txtstep1">
                                <input type="hidden" value="<% =Request.QueryString["ApplicationNo"] %>" class="txtapplicationNo" />

                                <input type="hidden" value="<% =qnCategoryDescription %>" class="txtqnCategory" />
                                <input type="hidden" class="qncd" value="<%=TopicNumber%>" />

                                <%
                                    if (topic.Question_Types == "Closed-Ended")
                                    { %>


                                <asp:DropDownList runat="server" CssClass="form-control respn">
                                    <asp:ListItem Text="--select--"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                </asp:DropDownList>

                                <%}

                                %>
                            </div>
                        </div>
                    </div>



                    <%
                        }
                    %>

                    <%
                        var Questions1 = nav.AgencyQuestionList.Where(r => r.Question_Category == "QOS" && r.Question_Types != "Table");
                    %>
                    <div class="col-md-12 col-lg-12">
                        <p>
                            <label><i>Quality of Service. (A Student Recruitment Agency shall promote the highest standards of student recruitment, advertising, exhibiting and marketing for universities/institutions. The agency shall adhere to the following quality requirements:)</i></label>
                        </p>
                    </div>
                    <%
                        foreach (var topic in Questions1)
                        {
                            TopicDescription = topic.Description;
                            TopicNumber = topic.Code;
                            qnCategoryDescription = topic.Question_Category;
                    %>

                    <div class="col-md-6 col-lg-6">

                        <div class="form-group">

                            <p>
                                <%=TopicDescription %>
                            </p>

                            <% 

                                NumberofQuestions += 1;
                            %>
                            <div class="txtstep1">
                                <input type="hidden" value="<% =Request.QueryString["ApplicationNo"] %>" class="txtapplicationNo" />
                                <input type="hidden" value="<% =qnCategoryDescription %>" class="txtqnCategory" />
                                <input type="hidden" class="qncd" value="<%=topic.Code%>" />

                                <%
                                    if (topic.Question_Types == "Closed-Ended")
                                    { %>


                                <asp:DropDownList runat="server" CssClass="form-control respn">
                                    <asp:ListItem Text="--select--"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                </asp:DropDownList>


                                <%}

                                %>
                            </div>
                        </div>

                    </div>

                    <%
                        }
                    %>
                </div>
            <div class="col-md-12 col-lg-12">
                            <p>
                                <label><i>Obligations and Commitments of a Licensed Student Recruitment Agency. (A Student Recruitment Agency shall recruit qualified students for admission into universities/institutions that are accredited and recognized in their countries of origin in line with the following guidelines each of which the applying Agency to indicate whether or not it is committed to adhere to: )</i></label>
                            </p>
                        </div>
                        <%



                            var Question2 = nav.AgencyQuestionList.Where(r => r.Question_Category == "OBLIGATION" && r.Question_Types != "Table").ToList();

                            foreach (var topic in Question2)
                            {
                                TopicDescription = topic.Description;
                                TopicNumber = topic.Code;
                                qnCategoryDescription = topic.Question_Category;
                        %>
                     
                        <div class="col-md-6 col-lg-6">

                            <div class="form-group">

                                <p>
                                    <%=TopicDescription %>
                                </p>

                                <% 

                                    NumberofQuestions += 1;
                                %>
                                 <div class="txtstep1">
                                <input type="hidden" value="<% =Request.QueryString["ApplicationNo"] %>" class="txtapplicationNo" />
                                <input type="hidden" value="<% =qnCategoryDescription %>" class="txtqnCategory" />
                                <input type="hidden" class="qncd" value="<%=topic.Code%>" />

                                <%
                                    if (topic.Question_Types == "Closed-Ended")
                                    { %>


                                <asp:DropDownList runat="server" CssClass="form-control respn" >
                                    <asp:ListItem Text="--select--"></asp:ListItem>
                                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                                </asp:DropDownList>


                                <%}

                                %>
                            </div>
                                </div>
                        </div>

                        <%
                            }


                        %>
                          </div>
                    </div>
                </div>
            </div>
        </div>

        <center> <button type="submit" class="btn btn-success saveresponce" aria-required="true">Save Response</button> </center>


        <div class="panel-footer">

            <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" CausesValidation="false" OnClick="previousstep_Click" />

            <asp:Button runat="server" CssClass="btn btn-success pull-right btn2" Text="Next" OnClick="nextstep_Click" CausesValidation="false" />
            <div class="clearfix"></div>
        </div>


        <%
            }

            else if (step == 9)
            {
              %>

     <div class="panel panel-primary">
        <div class="panel-heading">
            Supporting Documents
              <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 9 of 11 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>
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
                                     int programesCounter = 0;
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
                                 }
                                 else
                                 {
                                     foreach (var detail in details)
                                     {
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

<%--                    <%
                        try
                        {
                            String fileFolderApplication = ConfigurationManager.AppSettings["FileFolderApplication"];
                            String filesFolder = ConfigurationManager.AppSettings["FilesLocation"] + "License Application/";
                            String imprestNo = Request.QueryString["ApplicationNo"];
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
                        <td><a href="<%=fileFolderApplication %>\Imprest Memo\<% =imprestNo + "\\" + file.Replace(documentDirectory, "") %>" class="btn btn-success" download>Download</a></td>
                        <td>
                            <label class="btn btn-danger" onclick="deleteFile('<%=file.Replace(documentDirectory, "")%>');"><i class="fa fa-trash-o"></i>Delete</label></td>
                        <%-- <td><a href="imprest.aspx?&&myfile=<%=Request.QueryString["url"] %>"></a></td> 
                    </tr>

                    <%
                                }
                            }
                        }
                        catch (Exception)
                        {

                        }%>--%>
                </tbody>
            </table>
                 </div>
        </div>
<%--        <center>
            <asp:Button runat="server" CssClass="btn btn-warning" Text="Preview/Print Application" ID="print" CausesValidation="false" OnClick="printreport_Click"/>
        </center>--%>
        <div class="panel-footer">
                <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" CausesValidation="false" OnClick="previousstep_Click" />
             <asp:Button runat="server" CssClass="btn btn-success pull-right btn2" Text="Next" id="previewReport" OnClick="previewReport_Click"  />
            <div class="clearfix"></div>
        </div>
    </div>
    <%
        }

        else if (step == 10)
        {
              %>





   
        <%
            }


            else if (step == 11)
            {
              %>


    <div class="panel panel-default">
        <div class="panel-heading">
            Declaration<div class="pull-right"><i class="fa fa-angle-left"></i>Step 11 of 11<i class="fa fa-angle-right"></i></div>
            <div class="clearfix"></div>
        </div>
        <div id="submit" runat="server"></div>
        <div class="panel-body">
            <div class="row">
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item"><a href="Dashboard.aspx">Dashboard </a></li>
                        <li class="breadcrumb-item active">Declarations</li>
                    </ol>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="form-group">
                        <h5>I <b><% =Session["name"] %></b>  confirm and declare that I have read and understood the requirements and agree that; .</h5>

                    </div>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <ol>
                                <li>I will adhere to the Standards and Guidelines for this service issued by the Commission;</li>
                                <li>Payments done for services that are not offered by the Commission will not be refunded.</li>
                            </ol>
                            <asp:CheckBox runat="server" ID="declaration" />
                            <label class="font-noraml" for="acceptTerms">I agree with the Terms and Conditions.</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="text-center padding-15">
                    <center>
                     
                        <asp:Button runat="server" Text="Submit Application" ID="submitApplication" OnClick="submitApplication_Click" CssClass="btn btn-primary" Visible="true" />
                    </center>
                </div>
            </div>
        </div>
        <div class="panel-footer">
          <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="previousSteps" CausesValidation="false" OnClick="previousSteps_Click" />
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Visible="false" Text="Proceed to Payment" ID="Payment" OnClick="Payment_Click" />
            <div class="clearfix"></div>
        </div>
    </div>
<%}
    



         %>

        <script>


        $("body").delegate(" .saveresponce", "click", function (event) {
            //To prevent form submit after ajax call

            event.preventDefault();

           
            //Loop through the Table rows and build a JSON array.
            var allrfqitems = new Array();
            //declare an array
            var i = 0;


            $(".txtstep1").each(function () {
                var row = $(this);
                var onerfqitem = {};
                i++;
                onerfqitem.applicationNo = row.attr("id", "txtapplicationNo" + i).find(".txtapplicationNo").val();
                onerfqitem.qnCategory = row.attr("id", "txtqnCategory" + i).find(".txtqnCategory").val();

                onerfqitem.QuestionCode = row.attr("id", "qncd" + i).find(".qncd").val();

                onerfqitem.response = row.attr("id", "respn" + i).find(".respn").val();

                allrfqitems.push(onerfqitem);

            });

            $.ajax({
                type: "POST",
                url: "NewApplication.aspx/InsertComponentItems",
                data: '{cmpitems: ' + JSON.stringify(allrfqitems) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (status) {
                    switch (status.d) {
                        case "success":
                            Swal.fire
                            ({
                                title: "Response Added!",
                                text: "Response saved successfully!",
                                type: "success"

                            }).then(() => {
                                $("#feedback").css("display", "block");
                                $("#feedback").css("color", "green");
                                $('#feedback').attr("class", "alert alert-success");
                                $("#feedback").html("Response saved successfully!");
                            });
                            break;

                        case "componentnull":
                            Swal.fire
                            ({
                                title: "Component not filled!",
                                text: "Component field empty!",
                                type: "danger"
                            }).then(() => {
                                $("#feedback").css("display", "block");
                                $("#feedback").css("color", "red");
                                $('#feedback').attr("class", "alert alert-danger");
                                $("#feedback").html("Component field empty!");
                            });
                            break;
                        default:
                            Swal.fire
                            ({
                                title: "Error!!!",
                                text: "Error Occured",
                                type: "error"
                            }).then(() => {
                                $("#feedback").css("display", "block");
                                $("#feedback").css("color", "red");
                                $('#feedback').addClass('alert alert-danger');
                                $("#feedback").html(status.d);
                            });

                            break;
                    }
                    document.querySelector('.btn2').style.display = 'block';
                    e.preventDefault();
                },
                error: function (err) {
                    console.log(err.statusText);
                    console.log(status.d);
                }

            });

                console.log(allrfqitems);

        });

        
        


    </script>
      
        <script type="text/javascript">
            function agentattachdocuments(entryNo) {
                document.getElementById("ContentPlaceHolder1_DocCode").value = entryNo;
                $("#DocumentsAttach").modal();
            }
        </script>
        <script>
            function deleteFile(fileName) {
                document.getElementById("filetoDeleteName").innerText = fileName;
                document.getElementById("ContentPlaceHolder1_fileName").value = fileName;
                $("#deleteFileModal").modal();
            }
        </script>

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
          function editGovernance(entryNO, No, certNo, issueDate, Expirydate, Authority) {
              document.getElementById("ContentPlaceHolder1_govEntryNo").value = entryNO;
              document.getElementById("ContentPlaceHolder1_ApplicationNoG").value = No;
              document.getElementById("ContentPlaceHolder1_cerNo").value = certNo;
              document.getElementById("ContentPlaceHolder1_issueDateG").value = issueDate;
              document.getElementById("ContentPlaceHolder1_ExpDate").value = Expirydate;
              document.getElementById("ContentPlaceHolder1_Auth").value = Authority;
            $("#editGovernanceModel").modal();
        }
    </script>
           
      <script>
          function editStaffProfile(entryNO, Name, nationality, IdNo, workPermitNo, goodConduct) {
              document.getElementById("ContentPlaceHolder1_staffProfEntryNo").value = entryNO;
              document.getElementById("ContentPlaceHolder1_modalstaffName").value = Name;
              document.getElementById("ContentPlaceHolder1_modalStaffNationality").value = nationality;
              document.getElementById("ContentPlaceHolder1_modalIDPassp").value = IdNo;
              document.getElementById("ContentPlaceHolder1_modalWorkP").value = workPermitNo;
              document.getElementById("ContentPlaceHolder1_modalGoodCond").value = goodConduct;
              $("#editStaffProfileModel").modal();
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
            function removeAgencyActivity(entryNo, No) {
                document.getElementById("activityToRemove").innerText = No;
                document.getElementById("ContentPlaceHolder1_activityEntry").value = entryNo;
                $("#removeActivityModal").modal();
            }
        </script>

       <script>
           function removeDoc(entryNo, No) {
               document.getElementById("documentDel").innerText = No;
               document.getElementById("ContentPlaceHolder1_docEntry").value = entryNo;
                $("#removeDocumentModal").modal();
            }
        </script>

         <script>
             function removeGovernance(entryNo, No) {
                 document.getElementById("GovernanceToRemove").innerText = No;
                 document.getElementById("ContentPlaceHolder1_governEntry").value = entryNo;
                $("#removeGovernanceModal").modal();
            }
        </script>
                 <script>
                     function removeStaff(entryNo, Name) {
                         document.getElementById("staffToRemove").innerText = Name;
                 document.getElementById("ContentPlaceHolder1_StaffEntry").value = entryNo;
                $("#removeStaffModal").modal();
            }
        </script>
       <script>
           function removeFacilities(entryNo, No) {
              document.getElementById("applicationToRemove").innerText = No;
              document.getElementById("ContentPlaceHolder1_entryNoRemove").value = entryNo;
              $("#removeFacilitiesModal").modal();
          }
      </script>
               <script>
                   function removeRecruitingUniversitites(entryNo, No) {
                       document.getElementById("UnitDeleteName").innerText = No;
                       document.getElementById("ContentPlaceHolder1_uniEntryDelete").value = entryNo;
              $("#removerecruitingUniModal").modal();
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
            <div id="removeDocumentModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Deleting File</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete the file <strong id="documentDel"></strong>?</p>
                    <asp:TextBox runat="server" ID="docEntry" type="hidden" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete File" id="docDelete" OnClick="docDelete_Click"  />
                </div>
            </div>

        </div>
    </div>
            <div id="deleteFileModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Deleting File</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete the file <strong id="filetoDeleteName"></strong>?</p>
                    <asp:TextBox runat="server" ID="fileName" type="hidden" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete File" OnClick="deleteFile_Click" />
                </div>
            </div>

        </div>
    </div>

        <div id="removerecruitingUniModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Deleting File</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to delete the file <strong id="UnitDeleteName"></strong>?</p>
                    <asp:TextBox runat="server" ID="uniEntryDelete" type="hidden" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete File" id="unidelete" OnClick="unidelete_Click" />
                </div>
            </div>

        </div>
    </div>

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
                    <asp:Button runat="server" CssClass="btn btn-success" ID="EditDetails" OnClick="EditDetails_Click" Text="Edit Details" />

                </div>
                </div>
            </div>
            </div>
         <div id="editGovernanceModel" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div runat="server" id="Div5"></div>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Location Details</h4>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="govEntryNo" type="hidden" />




                    <div class="form-group">
                        <strong>ApplicationNo:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="ApplicationNoG" CssClass="form-control" />
                    </div>


                    <div class="form-group">
                        <strong>Certificate Number:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="cerNo" CssClass="form-control" />
                    </div>


                    <div class="form-group">
                        <strong>Issue Date:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="issueDateG" CssClass="form-control" TextMode="Date"/>
                    </div>
                     <div class="form-group">
                        <strong>Expiry Date:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="ExpDate" CssClass="form-control" TextMode="Date" />
                    </div>
                    <div class="form-group">
                        <strong>Authority Issuing Certificate:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="Auth" CssClass="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-success" ID="Button1" OnClick="EditG_Click" Text="Edit Details" />

                </div>
                </div>
            </div>
            </div>
         
           <div id="editStaffProfileModel" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div runat="server" id="Div3"></div>
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Edit Agency Staff Profile</h4>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="staffProfEntryNo" type="hidden" />


                    <div class="form-group">
                        <strong>Name of the staff:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="modalstaffName" CssClass="form-control" />
                    </div>


                    <div class="form-group">
                        <strong>Staff Nationality:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="modalStaffNationality" CssClass="form-control" />
                    </div>
                    
                    <div class="form-group">
                        <strong>Id/Passport Number:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="modalIDPassp" CssClass="form-control" />
                    </div>
                         <div class="form-group">
                        <strong>Work Permit Number:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="modalWorkP" CssClass="form-control" />
                    </div>

                         <div class="form-group">
                        <strong>Certificate of Good Conduct Number:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="modalGoodCond" CssClass="form-control" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-success" ID="EditstaffProf" OnClick="EditstaffProf_Click" Text="Edit Details" />

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
         <div id="removeGovernanceModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Deletion</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to remove the details of  <strong id="GovernanceToRemove"></strong>?</p>
                    <asp:TextBox runat="server" ID="governEntry" type="hidden" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete" id="removeG" OnClick="removeG_Click"/>
                </div>
            </div>

        </div>
    </div>
    <div id="removeStaffModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Deletion</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to remove the details of  <strong id="staffToRemove"></strong>?</p>
                    <asp:TextBox runat="server" ID="StaffEntry" type="hidden" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete" ID="removestaff" OnClick="removestaff_Click" />
                </div>
            </div>

        </div>
    </div>
          <div id="removeActivityModal" class="modal fade" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Deletion</h4>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to remove the details of  <strong id="activityToRemove"></strong>?</p>
                    <asp:TextBox runat="server" ID="activityEntry" type="hidden" />
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Delete" ID="removeActivity" OnClick="removeActivity_Click"/>
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

    <div id="add_banks" class="modal custom-modal fade" role="dialog">        
            <div class="modal-dialog">
                  <div runat="server" id="equipmentsError"></div>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add Any Other Service</h5>
                    </div>
                    <div class="modal-body">
                          <div class="form-group">
                        <strong>Any other Service:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="otherservice" CssClass="form-control" />
                    </div>
                  
                        <div class="m-t-20 text-center">
                              
                             <asp:Button runat="server" CssClass="btn btn-success" Text="Save Other service" ID="submitOtherServ" OnClick="submitOtherServ_Click"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>


