$('#btn_accountcreation').click(function (event) {
    //To prevent form submit after ajax call
    event.preventDefault();
    var tagencyName = $("#agencyName").val();
    var tresidenctialAddress = $('#residentialAddress').val();
    var tpostalAddress = $('#postalAddress').val(); 
    var ttelephoneNumber = $('#telephoneNo').val();
    var talternativePhoneNumber = $('#alternativePhoneNumber').val();
    var twhatsAppNo = $('#whatsAppNo').val();
    var temailAddress = $('#emailAddress').val();
    var twebsite = $('#website').val();
    var tcertificateNumber = $('#certificateNumber').val();
    var tDate = $('#txtDate').val();
    
    if (tagencyName != ''  && ttelephoneNumber != '' && tresidenctialAddress != '' && temailAddress != '' && tcertificateNumber != '' && tDate != '') {
        //Swal Message
        Swal.fire({
            title: "Confirm Account Request Registration?",
            text: "Are you sure you would like to proceed with submission?",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: true,
            confirmButtonText: "Yes, Proceed!",
            confirmButtonClass: "btn-success",
            confirmButtonColor: "#008000",
            position: "center"
        }).then((result) => {
            if (result.value) {
                $.ajax
                   ({
                       type: 'POST',
                       url: 'RequestAccountCreation.aspx/RequesttoCreateAccount',
                       async: false,
                       data: "{'tagencyName':'" + tagencyName + "','tresidenctialAddress':'" + tresidenctialAddress + "','tpostalAddress':'" + tpostalAddress + "','ttelephoneNumber':'" + ttelephoneNumber
                           + "','talternativePhoneNumber':'" + talternativePhoneNumber + "','twhatsAppNo':'" + twhatsAppNo + "','temailAddress':'" + temailAddress
                           + "','twebsite':'" + twebsite + "','tcertificateNumber':'" + tcertificateNumber + "','tDate':'" + tDate  + "'}",
                       contentType: 'application/json; charset =utf-8',
                       success: function (status) {
                           var obj = status.d;
                           if (obj == 'success') {
                               $('#tagencyName').val('');                              
                               $('#ttelephoneNumber').val('');
                               $('#tcertificateNumber').val('');
                               swal
                                  ({
                                      title: "Account Created!",
                                      text: "Your Account Details has been successfully submitted.Kindly Wait for CUE Notification.",
                                      icon: "success",
                                      type: "success"
                                  }).then(() => {
                                      $("#acccountfeedback").css("display", "block");
                                      $("#acccountfeedback").css("color", "green");
                                      $('#acccountfeedback').attr("class", "alert alert-success");
                                      $("#acccountfeedback").html("Your Account Details was Successfully Submitted.Kindly use wait for Notification from CUE!!");
                                      $("#acccountfeedback").css("display", "block");
                                      $("#acccountfeedback").css("color", "green");
                                      $("#acccountfeedback").html("Your Account Details was Successfully Submitted.Kindly use wait for Notification from CUE!");
                                      window.location = "Login.aspx";
                                  });

                           }
                           else {
                               Swal.fire
                                   ({
                                       title: "Account Creation Error!!!",
                                       text: "Error Occured when Submitting your Details.Kindly Contact CUE for more information ",
                                       type: "error"
                                   }).then(() => {
                                       $("#acccountfeedback").css("display", "block");
                                       $("#acccountfeedback").css("color", "red");
                                       $('#acccountfeedback').addClass('alert alert-danger');
                                       $("#acccountfeedback").html(status.d);
                                   });
                           }
                       },
                       error: function (result) {
                           Swal.fire
                            ({
                                title: "Account Creation Error!!!",
                                text: "Error Occured when Submitting your Details" + status.d,
                                type: "error"
                            }).then(() => {
                                $("#acccountfeedback").css("display", "block");
                                $("#acccountfeedback").css("color", "red");
                                $('#acccountfeedback').addClass('alert alert-danger');
                                $("#acccountfeedback").html(status.d);
                            });
                       }
                   });
            }
            else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire(
                    'Account Registration Cancelled',
                    'You cancelled your registration submission details!',
                    'error'
                );
            }
        });
    }
    else {
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: 'Fill in all the Details before you register!',
            footer: '<a href>Contact CUE for Any Clarifications?</a>'
        })
    }
})

$('#btn_password_resetrequest').click(function (event) {
    //To prevent form submit after ajax call
    event.preventDefault();
    var temailaddress = $('#emailid').val();
    if (temailaddress != '') {
        $.ajax({
            type: "POST",
            url: 'ForgotPass.aspx/Resetpassword',
            async: false,
            data: "{'temailaddress':'" + temailaddress + "'}",
            contentType: 'application/json; charset =utf-8',
            success: function (status) {
                var obj = status.d;
                if (obj == 'success') {
                    $('#temaiaddress').val('');
                    swal({
                        title: "Password Reset Request!",
                        text: "Your Password Reset Request has been successfully submitted.Kindly Check Your Email for the New Password",
                        icon: "success",
                        confirmButtonText: "Okey",
                    }).then(() => {
                        $("#feedback").css("display", "block");
                        $("#feedback").css("color", "green");
                        $('#feedback').attr("class", "alert alert-success");
                        $("#feedback").html("Your Password Reset Request has been successfully submitted.Kindly Check Your Email for the New Password!");
                        window.location = "Login.aspx";

                    });

                } else {
                    swal({
                        title: "Password Reset Error!!!",
                        text: "Error Your Password Reset Request was not Succesffully Submitted.Kindly Try Again.",
                        type: "error"
                    }).then(() => {
                        $("#feedback").css("display", "block");
                        $("#feedback").css("color", "red");
                        $('#feedback').addClass('alert alert-danger');
                        $("#feedback").html(status.d);
                    });
                }
            },

            error: function (result) {
                swal({
                    title: "Password Reset Error!!!",
                    text: "Error Your Password Reset Request was not Succesffully Submitted.Email Address is Missing",
                    type: "error"
                }).then(() => {
                    $("#feedback").css("display", "block");
                    $("#feedback").css("color", "red");
                    $('#feedback').addClass('alert alert-danger');
                    $("#feedback").html(result);
                });
            }
        });
    }
    else {
        alert("Please fill in your Email Address Before Submittting your Request.");
        return false;
    }
})

$(".btn_js_passcChangePassword").click(function () {
    var temailaddress = $("#emailid").val();
    var toriginalpassword = $("#orginalpassid").val();
    var tnewpassword = $("#newpassid").val();
    var tconfirmpassword = $("#confirmpass").val();
    if (temailaddress != '' && toriginalpassword != '' && tnewpassword != '' && tconfirmpassword != '') {
        //Swal Message
        Swal.fire({
            title: "Confirm  Password Reset?",
            text: "Are you sure you would like to proceed with submission?",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: true,
            confirmButtonText: "Yes, Proceed!",
            confirmButtonClass: "btn-success",
            confirmButtonColor: "#008000",
            position: "center"
        }).then((result) => {
            if (result.value) {
                $.ajax({
                    type: "POST",
                    url: "ChangePassword.aspx/ChangeUserpassword",
                    data: "{'temailaddress':'" + temailaddress + "','toriginalpassword':'" + toriginalpassword + "','tnewpassword':'" + tnewpassword + "','tconfirmpassword':'" + tconfirmpassword + "'}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (status) {
                        switch (status.d) {
                            case "success":
                                swal({
                                    title: "Password Changed!",
                                    text: "Your Account Password was Changed Successfully.Kindly use your new Password to Login.",
                                    icon: "success",
                                    type: "success"
                                }).then(() => {
                                    $("#feedback").css("display", "block");
                                    $("#feedback").css("color", "green");
                                    $('#feedback').attr("class", "alert alert-success");
                                    $("#feedback").html("Your Account Password was Changed Successfully.Kindly use your new Password to Login!");
                                    window.location = "Login.aspx";
                                });
                                break;
                            default:
                                swal({
                                    title: "Password Change Error!!!",
                                    text: "Error Occured when Changing your Password.Kindly Try Again",
                                    type: "error"
                                }).then(() => {
                                    $("#feedback").css("display", "block");
                                    $("#feedback").css("color", "red");
                                    $('#feedback').addClass('alert alert-danger');
                                    $("#feedback").html(status.d);
                                });
                                break;
                        }
                    }
                })
            }
            else if (result.dismiss === Swal.DismissReason.cancel) {
                Swal.fire(
                    'Password Reset Cancelled',
                    'You cancelled your Password Reset submission details!',
                    'error'
                );
            }

        });
    }
    else {
        Swal.fire({
            icon: 'error',
            type: 'error',
            title: 'Oops...',
            text: 'Fill in all the Details before you submit your Request!',
            footer: '<a href>Contact CUE for Any Clarifications!!</a>'
        })
    }
});

