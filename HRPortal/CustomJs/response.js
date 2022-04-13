$("body").on("click", "#btnSave", function () {
    //Loop through the Table rows and build a JSON array.
    var DocumentNo = $("#txtAppNo").val();
    var PrimaryInitiative = new Array();
    $("#tbl_bidpricing_details TBODY TR").each(function () {
        var row = $(this);
        var Targets = {};
        Targets.comment = ($(this).find("TD select").eq(0).val());
        Targets.targetNumber = ($(this).find('td').eq(0).text());
        Targets.category = ($(this).find('td').eq(1).text());
        Targets.ApplicationNo = DocumentNo;
        PrimaryInitiative.push(Targets);
    });
    console.log(JSON.stringify(PrimaryInitiative))
    Swal.fire({
        title: "Confirm Response Submission?",
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
                url: "NewApplication.aspx/InsertComponentItems",
                data: '{cmpitems: ' + JSON.stringify(PrimaryInitiative) + '}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                processData: false
            }).done(function (status) {
                var registerstatus = status.d;
                console.log(JSON.stringify(registerstatus))
                if (registerstatus == 'success') {
                    Swal.fire
                       ({
                           title: "Response Submitted!",
                           text: "Your Response have been successfully submitted.Kindly Proceed!",
                           type: "success"
                       }).then(() => {
                           $("#feedback").css("display", "block");
                           $("#feedback").css("color", "green");
                           $('#feedback').attr("class", "alert alert-success");
                           $("#feedback").html("Your Response have been successfully submitted.Kindly Proceed!");
                           $("#feedback").css("display", "block");
                           $("#feedback").css("color", "green");
                           $("#feedback").html("Your Response have been successfully submitted.Kindly Proceed!");
                           location.reload(true);
                       });
                }

                else {
                    Swal.fire
                            ({
                                title: "Response submission Error!!!",
                                text: registerstatus,
                                type: "error"
                            }).then(() => {
                                $("#feedback").css("display", "block");
                                $("#feedback").css("color", "red");
                                $('#feedback').addClass('alert alert-danger');
                                $("#feedback").html("Your Response could not be submitted.Kindly select again and try to submit!" + registerstatus);
                                location.reload(true);
                            });

                }

            });
        }
    });
});