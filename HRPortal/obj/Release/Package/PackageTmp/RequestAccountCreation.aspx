<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RequestAccountCreation.aspx.cs" Inherits="HRPortal.RequestAccountCreation" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Creation - CUE</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />
    <link rel="stylesheet" href="kuddos/css/icomoon.css"/>
    <link rel="stylesheet" href="kuddos/css/style.css"/>
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.min.css" />
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet" />
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet" />
    <link href="dist/css/sb-admin-2.css" rel="stylesheet" />
    <script src="js/http_ajax.googleapis.com_ajax_libs_jquery_3.2.1_jquery.min.js"></script>
    <link href="bower_components/morrisjs/morris.css" rel="stylesheet" />
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css" />

<style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }
</style>

    <script type="text/javascript">
    function ShowProgress() {
        setTimeout(function () {
            var modal = $('<div />');
            modal.addClass("modal");
            $('body').append(modal);
            var loading = $(".loading");
            loading.show();
            var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
            var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
            loading.css({ top: top, left: left });
        }, 200);
    }
    $('form').live("submit", function () {
        ShowProgress();
    });
</script>
</head>
<body>



    <form id="form1" runat="server">
        <div id="loader" class="loader" style="display: none">
            <div class="center">
                <img alt="" src="images/loader.gif" />
            </div>
        </div>
        <div class="row" style="width: 100%; display: block; margin: auto;">
            <div class="panel col-md-10 col-lg-10 col-sm-10 col-xs-12 col-md-offset-1 col-lg-offset-1 col-sm-offset-1" style="margin-top: 20px; border: 1px solid #d0dada; border-radius: 4px; padding-top: 5px; padding-bottom: 10px;">
                <div class="row" style="width: 100%; margin: 5px;">
                    <div style="width: 100%">
                        <img src="images/cue-header.jpg" width="100%" height="100px" />
                        <h3 style="width: 100%; text-align: center;">LICENSING OF STUDENT RECRUITMENT AGENCIES PORTAL</h3>
                        <hr />
                    </div>
                    <div class="panel panel-default" style="width: inherit">
                        <div class="panel-heading">Please Fill in all the Details to Request for Account Creation</div>
                        <div class="panel-body">
                            <div class="panel">
                                <div style="padding: 20px;">
                                    <div id="feedback" runat="server"></div>
                                    <div id="acccountfeedback" runat="server" data-dismiss="alert"></div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Agency Name.<span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="agencyName" Placeholder="Agency Name" type="text" Style="height: 42px;" />
                                                 <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator36" ControlToValidate="agencyName"  ErrorMessage="Agency Name must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Contact person Name: <span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="contactName" Placeholder="contact name" Style="height: 42px;" />
                                                 <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator1" ControlToValidate="contactName"  ErrorMessage="Contact Person Name must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                     <p>------Office Physical Location Details-------</p> 
                                    <div class="row">
                                     
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Building Name.<span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="residentialAddress" Placeholder="Building Name" type="text" Style="height: 42px;" />
                                                 <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator2" ControlToValidate="residentialAddress"  ErrorMessage="Building Name must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Street Name <span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="StreetName" Placeholder="Street Name" type="text" Style="height: 42px;" />
                                                 <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator9" ControlToValidate="residentialAddress"  ErrorMessage="Street Name must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Floor Name<span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="FloorNumber" Placeholder="Floor Name" type="text" Style="height: 42px;" />
                                                 <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator10" ControlToValidate="residentialAddress"  ErrorMessage="Floor Name must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Room Number. <span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="RoomNumber" Placeholder="Room Number" type="text" Style="height: 42px;" />
                                                 <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator11" ControlToValidate="residentialAddress"  ErrorMessage="Room Number must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                   
                                    <div class="row">
                                              <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Postal Address <span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="postaLAddressPoBox" Placeholder="PO Box XXX" type="text" Style="height: 42px;" />
                                                 <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator4" ControlToValidate="postaLAddressPoBox"  ErrorMessage="Postal Address must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Postal code: <span class="text-danger">*</span></label>
                                                <asp:DropDownList CssClass="form-control" runat="server" ID="postalAddress" Placeholder="Select Post Code" Style="height: 42px;" OnSelectedIndexChanged="postalAddress_SelectedIndexChanged" AutoPostBack="true" />
                                                <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator3" ControlToValidate="postalAddress" ErrorMessage="Select Postal Address must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                    </div>
                                    

                                    <div class="row">
                                              <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>City: <span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="city" ReadOnly="true" Style="height: 42px;" />
                                            </div>
                                        </div>


                                          <div class="col-md-2 col-lg-2">
                                            <div class="form-group">
                                                <label>Country Codes. <span class="text-danger">*</span></label>
                                                <asp:DropDownList CssClass="form-control" runat="server" ID="CountryTeleCodes" Placeholder="Please enter Country code +254" TextMode="Number" Style="height: 42px;" />                                    
                                                  <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator8" ControlToValidate="CountryTeleCodes"  ErrorMessage="Country Code must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-4 col-lg-4">
                                            <div class="form-group">
                                                <label>Telephone Number. <span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="telephoneNo" Placeholder="Please enter telephone Number e.g 713xxxxxx" TextMode="Number" Style="height: 42px;" />                                    
                                                  <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator5" ControlToValidate="telephoneNo"  ErrorMessage="Telephone Number must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>


                                    </div>
                                    <div class="row">
                                        
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>WhatsApp Number</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="whatsAppNo" Placeholder="Enter whatsapp Number e.g 713xxxxxx" TextMode="Number"  Style="height: 42px;" />
                                              

                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Alternative telephone Number</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="alternativePhoneNumber" Placeholder="Enter Alternative telephone Number e.g 713xxxxxx" TextMode="Number" Style="height: 42px;" />
                                             
                                            </div>
                                        </div>


                                    </div>

                                    <div class="row">
                                        
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Agency Email Address. <span class="text-danger">*</span></label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="emailAddress" Placeholder="cue@example.com" TextMode="Email" required Style="height: 42px;" />
                                                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="emailAddress" ErrorMessage="Invalid Email Format" ForeColor="Red"></asp:RegularExpressionValidator>
                                                  <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator6" ControlToValidate="emailAddress"  ErrorMessage="Agency Email Address must have a value, it cannot be empty!" ForeColor="Red" />
                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <strong>Upload a copy of the certificate of Business name<i>(pdf only)</i> <span class="text-danger">*</span></strong>
                                                <asp:FileUpload runat="server" CssClass="form-control" ID="FileUpload"></asp:FileUpload>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Only PDF files are allowed!" ValidationExpression="^.*\.(pdf|PDF)$" ControlToValidate="FileUpload" CssClass="text-red"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator Display="dynamic" runat="server" ID="RequiredFieldValidator7" ControlToValidate="FileUpload"  ErrorMessage="Please attach a copy of the certificate of Business name!" ForeColor="Red" />
                                            </div>

                                        </div>
                                        <div id="selectUniversityName" class="col-md-6 col-lg-6 col-sm-6 col-xs-12 form-group">
                                            <div class="form-group">
                                                <label>Website.</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="website" Placeholder="website url" Style="height: 42px;" />
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <a href="Login.aspx" class="pull-right">Back to Login</a>
                        <div style="background-color: #ececec; padding: 10px;">
                            <asp:Button runat="server" CssClass="btn btn-success btn-block" Text="Submit Registration" OnClick="btn_accountcreation_Click" Style="border-radius: 2px; font-size: 17px; line-height: 1.471; padding: 10px 19px;" />
                        </div>
                        <div class="loading" align="center">
                            Loading. Please wait.<br />
                            <br />
                            <img src="loader.gif" alt="" />
                        </div>
                        <div style="display: none;" class="ui-widget-overlay overlayforaddNote">
                        </div>
                    <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
                        <hr />
                        Copyright  &copy; <%: DateTime.Now.Year %>  Terms and Conditions Apply | <a href="http://www.cue.or.ke/">Commission for University Education</a>
                    </div>
                </div>
                <div>
                </div>
            </div>
        </div>
    </form>
    <script>
        $('select').on('change', function () {
            var type = this.selectedIndex;
            var tproposedname = document.getElementById("proposedname");
            var tevidences = document.getElementById("evidences");
            var tselectUniversityName = document.getElementById("selectUniversityName");
            if (type == 0) {
                tproposedname.style.display = "block";
                tevidences.style.display = "block";
                tselectUniversityName.style.display = "none";
            } else {
                tproposedname.style.display = "none";
                tevidences.style.display = "none";
                tselectUniversityName.style.display = "block";
            }
        });
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script type="text/javascript" src="js/CustomJs.js"></script>
    <!-- Sweet Alert Js -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
</body>
