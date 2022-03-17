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
            if (step>3||step<1)
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
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 1 of 3 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span> 
        </div>
        <div class="panel-body">
            <div runat="server" id="linesfeedback"></div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Residence<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="residence" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="Withn Kenya">Withn Kenya</asp:ListItem>
                        <asp:ListItem Value="Outside Kenya">Outside Kenya</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateresidence" ControlToValidate="residence" InitialValue="--Select--" ErrorMessage="Please select residence, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Applicant Type<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="applicanttype" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem Value="Kenyan">Kenyan</asp:ListItem>
                        <asp:ListItem Value="Foreign">Foreign</asp:ListItem>
                        <asp:ListItem Value="Independent Body">Independent Body</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateapplicanttype" ControlToValidate="applicanttype" InitialValue="--Select--" ErrorMessage="Please select applicant type, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Service Type<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="servicetype" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                         <asp:ListItem Value="Normal">Normal</asp:ListItem>
                         <asp:ListItem Value="Express">Express</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateservicetype" ControlToValidate="servicetype" InitialValue="--Select--" ErrorMessage="Please select service type, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Programme Level<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="level" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                        <asp:ListItem>Doctorate</asp:ListItem>
                        <asp:ListItem>Masters</asp:ListItem>
                        <asp:ListItem>Post Graduate Diploma</asp:ListItem>
                        <asp:ListItem>Undergraduate Degree</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatelevel" ControlToValidate="level" InitialValue="--Select--" ErrorMessage="Please select Programme Level, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Qualification Domain<span style="color: red">*</span></label>
                    <asp:DropDownList runat="server" ID="domain" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatedomain" ControlToValidate="domain" InitialValue="--Select--" ErrorMessage="Please select Qualification Domain, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group" runat="server">
                    <label class="span2">Title of Qualification<span style="color: red">*</span></label>
                    <asp:TextBox ID="title" runat="server" CssClass="form-control" placeholder="Please Enter Title of Qualification" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatetitle" ControlToValidate="title" ErrorMessage="Please enter Title of Qualification, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
            <div class="col-md-6 col-lg-6">
                <div class="form-group">
                    <label class="span2">Issuing University/Institution<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="university" CssClass="form-control span3" placeholder="Please Enter Issuing University/Institution" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateuniversity" ControlToValidate="university" ErrorMessage="Please enter Issuing University/Institution, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Country<span style="color: red">*</span> <i style="color: blue">(Where you obtained programme)</i></label>
                    <asp:DropDownList runat="server" ID="country" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatecountry" ControlToValidate="country" InitialValue="--Select--" ErrorMessage="Please select Country, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Purpose For Recognition or Equation<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="purpose" CssClass="form-control span3" placeholder="Please Enter Purpose For Recognition or Equation" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatepurpose" ControlToValidate="purpose" ErrorMessage="Please enter Purpose For Recognition or Equation!" ForeColor="Red" />
                </div>
                <div class="form-group" runat="server">
                    <label class="span2">Start Date<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="prof_startDate" CssClass="form-control span3" placeholder="Please Enter Start Date" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatestartdate" ControlToValidate="prof_startDate" ErrorMessage="Please enter Start Date, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">End Date<span style="color: red">*</span></label>
                    <asp:TextBox runat="server" ID="prof_endDate" CssClass="form-control span3" placeholder="Please Enter End Date" />
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validateenddate" ControlToValidate="prof_endDate" ErrorMessage="Please enter End Date, it cannot be empty!" ForeColor="Red" />
                </div>
                <div class="form-group">
                    <label class="span2">Applicable Fees<span style="color: red">*</span> <i style="color: blue">(Select the fees based on the programme)</i></label>
                    <asp:DropDownList runat="server" ID="fees" AppendDataBoundItems="true" CssClass="form-control select2" AutoPostBack="true">
                        <asp:ListItem>--Select--</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="validatefees" ControlToValidate="fees" InitialValue="--Select--" ErrorMessage="Please select applicable fees, it cannot be empty!" ForeColor="Red" />
                </div>
            </div>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" ID="addapplication" CssClass="btn btn-warning pull-right" Text="Add Application" OnClick="addapplication_Click"/>
            <div class="clearfix"></div>
        </div>
        <div class="panel-heading">
            My Added Applications
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
                        <th>Edit</th>
                        <th>Remove</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        var nav = new Config().ReturnNav();
                        string docNo = Convert.ToString(Session["ApplicationNo"]);
                        var data = nav.Student_Qualification.Where(x=> x.Application_No == docNo).ToList();
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
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="panel-footer">
            <asp:Button runat="server" ID="submitapplication" CssClass="btn btn-warning pull-left" Text="Print/Download Application" CausesValidation="false"/>
            <asp:Button runat="server" ID="Nexttostep2" CssClass="btn btn-success pull-right" Text="Next" CausesValidation="false" OnClick="Nexttostep2_Click"/>
            <div class="clearfix"></div>
        </div>
    </div>
    <% 
        }else if (step==2){
            %>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Payment Details  
            <span class="pull-right"><i class="fa fa-chevron-left"></i>Step 2 of 3 <i class="fa fa-chevron-right"></i></span><span class="clearfix"></span>      
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Total Amount To Pay:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="totalamount" value="200,000" CssClass="form-control" ReadOnly="true"/>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Payment Type:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:DropDownList runat="server" ID="paymenttype" CssClass="form-control select2" AutoPostBack="True">
                            <asp:ListItem>--Select--</asp:ListItem>
                            <asp:ListItem>M-pesa</asp:ListItem>
                            <asp:ListItem>Bank</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Transaction Date:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="duedate" type="date" CssClass="form-control" placeholder="dd/mm/yy" />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Payment Reference Number:</strong> <span class="asterisk" style="color: red">*</span>
                        <asp:TextBox runat="server" ID="TextBox2" CssClass="form-control" placeholder="Payment Reference No." />
                    </div>
                </div>
                <div class="col-md-6 col-lg-6">
                    <div class="form-group">
                        <strong>Payment Document: </strong><span class="asterisk" style="color: red">*</span>
                        <p style="font-style: italic; color: blue">{Max Size: 20MB, use .pdf only}</p>
                        <asp:FileUpload runat="server" ID="paymentdocument" />
                    </div>
                </div>
            </div>
        </div>

        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Next" ID="nexttostep3" CausesValidation="false" OnClick="nexttostep3_Click"/>
             <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtostep1" CausesValidation="false" OnClick="backtostep1_Click"/>
            <div class="clearfix"></div>
        </div>
    </div>
        <%
        }else if (step==3){
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
        <div class="panel-footer">
            <asp:Button runat="server" CssClass="btn btn-warning pull-left" Text="Previous" ID="backtostep2" CausesValidation="false" OnClick="backtostep2_Click"/>
            <asp:Button runat="server" CssClass="btn btn-success pull-right" Text="Submit Application To CUE" ID="submitapplicationtocue" CausesValidation="false" OnClick="submitapplicationtocue_Click" />
            <div class="clearfix"></div>
        </div>
    </div>
        <%
        }
         %>

</asp:Content>


