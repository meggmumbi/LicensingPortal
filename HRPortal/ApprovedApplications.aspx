<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApprovedApplications.aspx.cs" Inherits="HRPortal.ApprovedApplications" %>
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
                <li class="breadcrumb-item active">Application pending Payment</li>
            </ol>
        </div>
    </div>
    <div class="panel panel-primary">
        <div class="panel-heading">
            Applications Pending Payments
        </div>
          <div id="feedback" runat="server"></div>
        <div class="panel-body">
             <div class="table-responsive">
                     <table id="example1" class="table table-striped table-bordered">
                  <thead>
                    <tr>
                        <th>#</th>
                        <th>Application No</th>
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
                       string institutionNo = Convert.ToString(Session["InstitutionNo"]);
                        var data = nav.LicenceApplicationHeader.Where(x=> x.Institution_No == institutionNo && x.Application_Status=="Open" && x.Submitted==true).ToList();
                        int counter = 0;
                        foreach (var item in data)
                        {
                            counter++;
                    %>
                    <tr>
                        <td><%=counter %></td>
                        <td><%=item.Application_No %></td>
                        <td><% =item.Application_Status%></td>
                        <td><% =item.Application_Category %></td>
                        <td><% =item.Applicant_Type %></td>
                        <td><% =item.Institution_Name %></td>
                        <td><% =item.Registration_Certificate %></td>
                        <td><% =item.Physical_Address_Status %></td>
                        <td><% = item.Licence_Type_Description%></td>
                        <td><% = Convert.ToDateTime(item.Registration_Date).ToString("d/MM/yyyy") %></td>
                        <td><% =item.Application_Amount %></td>                       
                         <td> <label class="btn btn-success" onclick="makePayments('<%=item.Application_No %>', '<%=item.Institution_Name %>')"><i class="fa fa-edit"></i>Make Payments</label></td>                      
                        
                        <%
                            }
                        %>
                    </tr>
                </tbody>
            </table>
                 </div>
        </div>
    </div>

        <script>
        function makePayments(no, name) {
            document.getElementById("ContentPlaceHolder1_accreditationnumber").value = no;
            document.getElementById("ContentPlaceHolder1_programmeName").value = name;
            $("#MakepaymentsModal").modal();
        }
    </script>

    <div id="MakepaymentsModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Confirm Institution Licensing Application Payment</h4>
                </div>
                <div class="modal-body">
                    <asp:TextBox runat="server" ID="editRationaleCode" type="hidden" />
                    <div class="form-group">
                        <strong>Licensing Number:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="accreditationnumber" placeholder="Institution Application Number" />

                    </div>
                    <div class="form-group">
                        <strong>Institution Name:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="programmeName" placeholder="Institution Name" ReadOnly="true" />
                    </div>
                    <div class="form-group">
                        <strong>Select mode of payment</strong>
                        <asp:DropDownList runat="server" CssClass="form-control" ID="PaymentModes" OnSelectedIndexChanged="PaymentModes_SelectedIndexChanged" AutoPostBack="true">  
                        </asp:DropDownList>
                    </div>
                    <div class="form-group">
                        <strong>Payment Reference Number:</strong>
                        <asp:TextBox runat="server" CssClass="form-control" ID="paymentsref" placeholder="Payment Reference Number" />

                        <div class="form-group">
                            <strong>Payment Document:</strong>
                            <asp:FileUpload runat="server" ID="paymentdocument" CssClass="form-control" Style="padding-top: 0px;" />
                            <asp:RequiredFieldValidator runat="server" ID="payments" ControlToValidate="paymentdocument" ErrorMessage="Please attach the Payment Document!" ForeColor="Red" />
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <asp:Button runat="server" CssClass="btn btn-success" Text="Confirm Payments" ID="makePayments" OnClick="ConfirmPayments_Click" />
                </div>
            </div>

        </div>
    </div>


   
</asp:Content>