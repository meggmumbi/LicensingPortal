<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ForgotPass.aspx.cs" Inherits="HRPortal.ForgotPass" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - CUE</title>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <link href="images/logo.png" rel="shortcut icon" type="image/x-icon" />
 
    <!-- Bootstrap Core CSS -->
    
    <link rel="stylesheet" href="kuddos/css/icomoon.css"/>
    <link rel="stylesheet" href="kuddos/css/style.css"/>
  

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css"/>
    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet"/>

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet"/>

    <script type="text/javascript" src="js/jquery-1.8.2.js"></script> 
    <!-- Morris Charts CSS -->
    <link href="../vendor/morrisjs/morris.css" rel="stylesheet"/>

    <script src="js/http_ajax.googleapis.com_ajax_libs_jquery_3.2.1_jquery.min.js"></script>
    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />

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
        <div class="row" style="width: 100%; display: block; margin: auto;">
         <div class="panel col-md-10 col-lg-10 col-sm-10 col-xs-12 col-md-offset-1 col-lg-offset-1 col-sm-offset-1" style="margin-top: 20px; border: 1px solid #d0dada; border-radius: 4px; padding-top: 5px; padding-bottom: 10px; margin-left:10%">
              <div class="row" style="width: 100%; margin: 5px;">
                    <div style="width: 100%">
                        <img src="images/cue-header.jpg" width="100%" height="100px" />
                        <h3 style="width: 100%; text-align: center;">LICENSING OF STUDENT RECRUITMENT AGENCIES PORTAL</h3>
                        <hr />
                    </div>
                        <div class="panel panel-default" style="width: inherit">
                             <div class="overlay" id="overlay"></div>
                            <div class="panel-heading">Please Fill in all the Details to Reset your  Account Password</div>
                            <div class="panel-body">
                                <div class="panel">
                                    <div id="feedbacks" runat="server"></div>
                                    <div style="padding: 20px;"> 
                                         <div id="feedback" style="display: none"></div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Email Address(Official Email Address)</label>
                                                    <input type="email" class="form-control" id="emailid" placeholder="xxxxxx@cue.or.ke" />
<%--                                                    <asp:TextBox CssClass="form-control" runat="server" ID="emailaddress" Placeholder="Email Address" type="text"  required  Style="height: 42px;" />--%>
                                                </div>
                                            </div>
                                        </div>
                                        <%--<div class="field">
                                            Prove that you are not a robot <sup>*</sup>
                                            <div class="g-recaptcha" data-sitekey="6Ld4LScUAAAAADuGShD198FZNCL8FSzwqw8arOSC" style="display: block; margin: auto;"></div>
                                        </div>  --%>    

                                    </div>
                                        <a href="Login.aspx" class="pull-right">Back to Login</a>
                                    </div>
                                    </div>
                                    </div>
                                  </div>
                                    <div style="background-color: #ececec; padding: 30px;">
                                           <input type="button" id="btn_password_resetrequest" class="btn btn-success btn-block btn_password_resetrequest"  value="Reset Password" style="padding: 10px 39px;"/>
                                        <%--<asp:Button runat="server" CssClass="btn btn-success btn-block btn_js_passc" ID="resetpassword" Text="Reset Password" Style="border-radius: 2px; font-size: 17px; line-height: 1.471; padding: 10px 19px;" />--%>
                                    </div>
                               <div class="col-md-12 col-sm-12 col-xs-12" style="text-align: center;">
                             Copyright  &copy; <%: DateTime.Now.Year %>  Terms and Conditions Apply | <a href="http://www.cue.or.ke/">Commission for University Education</a> 
                                </div>
                                </div>
                             
                             </div>
                           <div>
                        </div>
                  </form>
       <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <script type="text/javascript" src="js/CustomJs.js"></script>
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"/>   
  

     <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="https://www.google.com/recaptcha/api.js"></script>
    </body>

</html>

