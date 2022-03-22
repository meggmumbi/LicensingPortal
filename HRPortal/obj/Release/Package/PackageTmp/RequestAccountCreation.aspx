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
    <style>
        .loader {
            position: fixed;
            z-index: 999;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            background-color: Black;
            filter: alpha(opacity=60);
            opacity: 0.6;
            -moz-opacity: 0.8;
        }

        .center {
            z-index: 1000;
            margin: 300px auto;
            padding: 10px;
            width: 130px;
            background-color: White;
            border-radius: 10px;
            filter: alpha(opacity=100);
            opacity: 1;
            -moz-opacity: 1;
        }

            .center img {
                height: 128px;
                width: 128px;
            }
    </style>
</head>
<body>


    <div class="py-2 bg-primary">
        <div class="container">
            <div class="row no-gutters d-flex align-items-start align-items-center px-3 px-md-0">
                <div class="col-lg-12 d-block">
                    <div class="row d-flex">
                        <div class="col-md-5 pr-4 d-flex topper align-items-center">
                            <div class="icon bg-fifth mr-2 d-flex justify-content-center align-items-center"><span class="icon-map"></span></div>
                            <span class="text">Red Hill Road, off Limuru Road, Gigiri P.O. Box 54999 – 00200, Nairobi, Kenya.</span>
                        </div>
                        <div class="col-md pr-4 d-flex topper align-items-center">
                            <div class="icon bg-secondary mr-2 d-flex justify-content-center align-items-center"><span class="icon-paper-plane"></span></div>
                            <span class="text">info@cue.or.ke</span>
                        </div>
                        <div class="col-md pr-4 d-flex topper align-items-center">
                            <div class="icon bg-tertiary mr-2 d-flex justify-content-center align-items-center"><span class="icon-phone2"></span></div>
                            <span class="text">020–7205000</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark ftco_navbar ftco-navbar-light" id="ftco-navbar">
        <div class="container d-flex align-items-center">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span>Menu
	     
            </button>
            <div class="collapse navbar-collapse" id="ftco-nav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item active"><a href="Index.aspx" class="nav-link pl-0">Home</a></li>
                    <li class="nav-item"><a href="Login.aspx" class="nav-link">Login</a></li>
                    <li class="nav-item"><a href="RequestAccountCreation" class="nav-link">Register</a></li>
                   	<li class="nav-item"><a href="https://www.cue.or.ke/index.php?option=com_phocadownload&view=category&id=16:standards-and-guidelines&Itemid=187" class="nav-link">Universities Standards and Guidelines</a></li>
                    <li class="nav-item"><a href="pricing.html" class="nav-link">FAQs</a></li>
                    <li class="nav-item"><a href="contact.html" class="nav-link">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
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
                                    <div id="acccountfeedback" style="display: none" data-dismiss="alert"></div>
                                    <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Agency Name</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="agencyName" Placeholder="Agency Name" type="text" Style="height: 42px;" />
                                            </div>
                                        </div>


                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label for="county">Country<span class="text-danger">*</span></label>
                                                <asp:DropDownList runat="server" CssClass="form-control select2" ID="DropDownList1" OnSelectedIndexChanged="agencyType_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                                            </div>
                                        </div>


                                    </div>
                                    <div id="LocalAddress" runat="server" visible="false">
                                        <div class="row">
                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label>Residential Address. (Physical Location)</label>
                                                    <asp:TextBox CssClass="form-control" runat="server" ID="residentialAddress" Placeholder="Residential Address" type="text" Style="height: 42px;" />
                                                </div>
                                            </div>

                                            <div class="col-md-6 col-lg-6">
                                                <div class="form-group">
                                                    <label>Postal Address:</label>
                                                    <asp:DropDownList CssClass="form-control" runat="server" ID="postalAddress" Placeholder="Select Post Code" type="password" Style="height: 42px;" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label>Telephone Number</label>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="telephoneNo" Placeholder="Phone Number" TextMode="Number" Style="height: 42px;" />
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="telephoneNo" ErrorMessage="Please Enter a valid Phone Number" ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

                                    </div>
                                </div>


                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label>WhatsApp Number</label>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="whatsAppNo" TextMode="Number" required Style="height: 42px;" />

                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label>Alternative telephone Number</label>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="alternativePhoneNumber" TextMode="Number" Style="height: 42px;" />
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label>Email Address.</label>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="emailAddress" Placeholder="Enter Email Address" TextMode="Email" required Style="height: 42px;" />
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div id="selectUniversityName" class="col-md-6 col-lg-6 col-sm-6 col-xs-12 form-group">
                                    <div class="form-group">
                                        <label>Website.</label>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="website" Placeholder="website url" Style="height: 42px;" />
                                    </div>
                                </div>

                                <div class="col-md-6 col-lg-6">
                                    <div class="form-group">
                                        <label>Contact person Name:</label>
                                        <asp:TextBox CssClass="form-control" runat="server" ID="certificateNumber" Placeholder="Enter Certificate Number" required Style="height: 42px;" />

                                    </div>
                                </div>
                            </div>
                            <%-- <div class="row">
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <label>Date of Incorporation/ Registration:</label>
                                                <asp:TextBox CssClass="form-control" runat="server" ID="txtDate" TextMode="Date" required Style="height: 42px;" />

                                            </div>
                                        </div>
                                        <div class="col-md-6 col-lg-6">
                                            <div class="form-group">
                                                <strong>Upload a copy of the certificate<i>(pdf only)</i></strong>
                                                <asp:FileUpload runat="server" CssClass="form-control" ID="FileUpload"></asp:FileUpload>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Only PDF files are allowed!" ValidationExpression="^.*\.(pdf|PDF)$" ControlToValidate="FileUpload" CssClass="text-red"></asp:RegularExpressionValidator>
                                            </div>

                                        </div>
                                    </div>--%>
                        </div>
                    </div>
                </div>
                <a href="Login.aspx" class="pull-right">Back to Login</a>
                <div style="background-color: #ececec; padding: 10px;">
                    <asp:Button runat="server" CssClass="btn btn-success btn-block btn_accountcreation" ID="btn_accountcreation" name="btn_accountcreation" Text="Submit Registration" Style="border-radius: 2px; font-size: 17px; line-height: 1.471; padding: 10px 19px;" />
                </div>
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
