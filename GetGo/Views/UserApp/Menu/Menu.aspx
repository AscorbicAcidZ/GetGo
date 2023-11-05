<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Views_UserApp_Menu_Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .body {
            user-select: none;
        }


        .green-1 {
            color: #2B9348;
            font-weight: 900;
        }

        .red-1 {
            color: #DA2C38;
            font-weight: 900;
        }

        .centered-image {
            align-items: center;
            margin-top: -35px;
        }

        .blue-text {
            color: #1B5B6B;
        }

        .gray-box {
            background-color: #E9E9E9;
            border-radius: 10px;
            padding-left: 10px;
            margin: 10px;
        }

        .custom-notification {
            background-color: #E9E9E9;
            padding: 10px;
            border-radius: 10px;
            margin-bottom: 10px;
            user-select: none;
            cursor: pointer;
        }



        .notif-image img {
            display: block;
            margin: 0 auto;
        }

        .notification-title {
            font-size: 12px;
            font-weight: bold;
            margin-bottom: 5px; /* Add margin between title and date */
        }

        .notification-date {
            font-size: 10px;
        }

        .notification-description {
            font-size: 10px;
            line-height: 1.2;
            /* Adjust line-height for better readability */
        }

        .notif-logo {
            width: 70px;
            height: 70px;
            background-size: cover;
        }

        .truncated-text {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            width: 200px;
        }
    </style>
    <link href="../../../Resources/custom-css/home-default.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <br />
    <div class="wrapper">
        <section class="content">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-6">

                        <div class="card">
                            <div class="card-body" style="padding-bottom: 0 !important">
                                <div class="form-group">
                                    <h4 id="lblFullName"></h4>
                                </div>
                                <div class="form-group row justify-content-around">
                                    <img src="../../../Resources/dist/img/additional/profile.png" width="100" height="65" class="clickable-image" onclick="OptionProfile()" />
                                    <img src="../../../Resources/dist/img/additional/loan history.png" width="100" height="65" class="clickable-image" onclick="OptionLoanHistory()" />
                                    <img src="../../../Resources/dist/img/additional/notifications.png" width="100" height="65" class="clickable-image" onclick="OptionNotifications()" />

                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">

                                <div class="content row justify-content-around">
                                    <div class="left-image">
                                        <img src="../../../Resources/dist/img/5.png" width="100" height="100" class="clickable-image" onclick="ModeOfRepayment('branch')" />
                                    </div>
                                    <div class="right-content" style="width: 180px; text-align: end; font-size: 12px">
                                        <h4><b class="green-1">Get</b><b class="red-1">Go</b></h4>
                                        Make the time-consuming process of getting a loan easier and more enjoyable.
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>

    <div class="modal fade" id="modal-profile" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-12">

                                    <div class="card">
                                        <div class="header-label">
                                            <label>Profile</label>
                                        </div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label for="inputFile" style="cursor: pointer;">
                                                    <img src="../../../Resources/dist/img/default-150x150.png" id="preview_profile" class="img-circle" width="70" height="70" />
                                                </label>
                                                <%--<input type="file" id="inputFile" style="display: none;" class="custom-file-input" data-classification="PROFILE" onchange="readURL(this);" />--%>
                                                <%--<img src="../../../Resources/dist/img/default-150x150.png" id="image_upload_preview" class="img-circle" width="70" height="70" />
                                <input type='file' id="inputFile" />--%>
                                            </div>

                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">First Name</label>
                                                    <input type="text" required="" autocomplete="off" id="txtFirstName" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Last Name</label>
                                                    <input type="text" required="" autocomplete="off" id="txtLastName" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Middle Name</label>
                                                    <input type="text" required="" autocomplete="off" id="txtMiddleName" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Date of Birth</label>
                                                    <input type="text" required="" autocomplete="off" id="txtDOB" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Email Address</label>
                                                    <input type="text" required="" autocomplete="off" id="txtEmail" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Mobile Number</label>
                                                    <input type="text" required="" autocomplete="off" id="txtMobileNumber" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Sex</label>
                                                    <input type="text" required="" autocomplete="off" id="txtSex" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Marital Status</label>
                                                    <input type="text" required="" autocomplete="off" id="txtMaritalStatus" class="form-control input">
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="input">

                                                    <label for="name">Street Name, Building, House No.</label>
                                                    <input type="text" required="" autocomplete="off" id="txtStreetName" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Barangay</label>
                                                    <input type="text" required="" autocomplete="off" id="txtBarangay" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">City</label>
                                                    <input type="text" required="" autocomplete="off" id="txtCity" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Province</label>
                                                    <input type="text" required="" autocomplete="off" id="txtProvince" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Region</label>
                                                    <input type="text" required="" autocomplete="off" id="txtRegion" class="form-control input">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label for="name">Postal Code</label>
                                                    <input type="text" required="" autocomplete="off" id="txtPostalCode" class="form-control input">
                                                </div>
                                            </div>

                                        </div>


                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modal-history" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="wrapper">
                        <section class="content-header">
                        </section>
                        <section class="content">
                            <div class="container-fluid">
                                <div class="col-lg-12">

                                    <div class="card">
                                        <div class="header-label">
                                            <label>Loan History</label>
                                        </div>
                                        <div class="card-body loan-container">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modal-notifications" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="wrapper">
                        <section class="content-header">
                        </section>
                        <section class="content">
                            <div class="container-fluid">
                                <div class="col-lg-12">

                                    <div class="card">
                                        <div class="header-label">
                                            <label>Notifications</label>
                                        </div>
                                        <div class="card-body ">
                                            <div class="notification-container">
                                                <div class="notifications custom-notification" id="notificationTrigger">
                                                    <div class="row align-items-center">
                                                        <div class="col-auto">
                                                            <div class="notif-image">
                                                                <img src="../../../Resources/dist/img/meme.png" width="30" height="30" class="clickable-image" />
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="row justify-content-between">
                                                                <div class="col-auto">
                                                                    <label class="notification-title">Money Received</label>
                                                                    <label class="notification-date">06/11/2023</label>
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-auto">
                                                                    <p class="notification-description">Make the time-consuming processqweq weqweqwe</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


    <div class="modal fade" id="modal-loan-details" style="display: none;" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="padding-left: 2px !important; padding-right: 2px !important">
                    <div class="wrapper">
                        <section class="content-header">
                        </section>
                        <section class="content">
                            <div class="container-fluid">
                                <div class="col-lg-12">

                                    <div class="card" style="padding-left: 0 !important">
                                        <div class="header-label">
                                            <label>Loans Details</label>
                                        </div>
                                        <div class="card-body box">
                                            <div class="form-group custom-loan-title">
                                                <label style="font-size: 30px" id="LoanAmount">3000</label>
                                                <br />

                                                <label>Total Loan Amount</label>

                                            </div>
                                            <div class="form-group" style="border-radius: 10px; background-color: #E9E9E9;">
                                                <h6>Transaction Summary</h6>

                                            </div>
                                            <div class="form-group">
                                                <table class="loan-summary">
                                                    <tr>
                                                        <th style="width: 50%">Start Date:</th>
                                                        <td class="data" id="startDate">Data7</td>
                                                        <!-- Data for Start Date -->
                                                    </tr>
                                                    <tr>
                                                        <th>Loan Tenure:</th>
                                                        <td class="data" id="loanTenure">Data6</td>
                                                        <!-- Data for Loan Tenure -->
                                                    </tr>
                                                    <tr>
                                                        <th>Process Fee:</th>
                                                        <td class="data" id="processFee">Data3</td>
                                                        <!-- Data for Process Fee -->
                                                    </tr>
                                                    <tr>
                                                        <th>Interest Rate:</th>
                                                        <td class="data" id="interestRate">Data2</td>
                                                        <!-- Data for Interest Rate -->
                                                    </tr>
                                                    <tr>
                                                        <th>Late Fee (Implemented if past due date*):</th>
                                                        <td class="data" id="lateFee">1%</td>
                                                        <!-- Data for Late Fee -->
                                                    </tr>


                                                    <tr>
                                                        <th>Transaction Branch Name:</th>
                                                        <td class="data" id="branchName">Data8</td>
                                                        <!-- Data for Branch Name -->
                                                    </tr>
                                                    <tr>
                                                        <th class="dashed">Loan ID:</th>
                                                        <td class="data dashed" id="loanID">Data9</td>
                                                        <!-- Data for Loan ID -->
                                                    </tr>
                                                </table>

                                            </div>
                                            <div class="form-group" style="border-radius: 10px; background-color: #E9E9E9;">
                                                <h6>Monthly Repayment Details</h6>

                                            </div>
                                            <div class="loan-details-list">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="alert-notifications" style="display: none; background-color: rgba(0, 0, 0, 0.5);"
        aria-hidden="true" tabindex="-1" role="dialog" aria-labelledby="notificationModalLabel">
        <div class="modal-dialog">
            <br />
            <br />
            <br />
            <br />

            <div class="custom-modal">
                <div class="card">
                    <div class="custom-modal-content notifications">
                        <div class="centered-image">

                            <img src="../../../Resources/dist/img/meme.png" width="70" height="70" class="clickable-image" />
                        </div>
                        <div class="custom-head dt-center">
                            <h5>Notifications</h5>
                            <h6 class="blue-text"></h6>
                        </div>
                        <div class="custom-body">
                            <p class="gray-box"></p>
                        </div>
                    </div>
                </div>
                <div class="custom-modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" style="width: 100%; background-color: #1B5B6B; border-radius: 10px; border: none;">
                        Go back</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
      <script>
        document.addEventListener('contextmenu', function (event) {
            event.preventDefault();
        });

        document.onkeydown = function (e) {
            if (e.key === 'F12' || (e.ctrlKey && e.shiftKey && e.key === 'I') || (e.ctrlKey && e.shiftKey && e.key === 'C') || (e.ctrlKey && e.shiftKey && e.key === 'J') || (e.ctrlKey && e.key === 'U')) {
                e.preventDefault();
            }
        }
    </script>
    <script>
        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        const imagesBaseUrl = "../../../UploadedFiles/";

        let notifications = [];


        $(() => {
            $('#modal-profile input[type="text"]').prop('readonly', true);
            /*    $('#modal-history').modal('show');*/
            InitializeInfo();

        });
        $("#notificationTrigger").click(() => {
            $("#alert-notifications").modal("show");
        });

        $(".notification-container").on("click", ".custom-notification", function () {
            // Get the data associated with the clicked notification
            const notificationId = parseInt($(this).data("id"));


            // Find the corresponding notification data
            const notification = notifications.find(item => item.ID === notificationId); // Adjust the property name as per your data structure

            // Check if the notification is found
            if (notification) {
                // Populate the modal with notification data
                $(".custom-modal-content .blue-text").text(notification.TITLE);
                $(".custom-modal-content .gray-box").text(notification.DESCRIPTION);

                // Show the modal
                $('#alert-notifications').modal('show');
            } else {
                console.log("Notification not found for ID:", notificationId);
            }
            // Show the modal
            $('#alert-notifications').modal('show');
        });
        const InitializeInfo = () => {
            var items = {
                INPUT: params.USERID
            }
            // Make an AJAX request to fetch the user details
            $.ajax({
                url: '../Profile/Profile_Primary.aspx/GetUserDetails',
                type: "POST",
                data: JSON.stringify({ item: items }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var userDetails = response.d;
                    // Populate the textboxes with the retrieved user details
                    var userDetails = JSON.parse(response.d);
                    // Format the date of birth

                    if (!userDetails[0].DATE_OF_BIRTH) {
                        // If empty, set it to the current date
                        var currentDate = new Date().toISOString().split('T')[0];
                        $('#txtDOB').val(currentDate);
                    } else {
                        // If not empty, format the date of birth
                        var dateOfBirth = new Date(userDetails[0].DATE_OF_BIRTH).toISOString().split('T')[0];
                        $('#txtDOB').val(dateOfBirth);
                    }
                    $('#txtDOB').val(new Date(userDetails[0].DATE_OF_BIRTH).toISOString().split('T')[0]);

                    if (!userDetails[0].PROFILE_IMAGE) {
                        // If empty, set it to the current date
                        $('#preview_profile').attr('src', '../../../Resources/dist/img/default-150x150.png');

                    } else {

                        $('#preview_profile').attr('src', imagesBaseUrl + userDetails[0].PROFILE_IMAGE);
                    }
                    console.log(userDetails[0].PROFILE_IMAGE);
                    //Populate the textboxes with the retrieved user details
                    ;
                    $('#txtFirstName').val(userDetails[0].FIRST_NAME);
                    $('#txtLastName').val(userDetails[0].LAST_NAME);
                    $('#txtMiddleName').val(userDetails[0].MIDDLE_NAME);
                    $('#lblFullName').text(userDetails[0].FIRST_NAME, userDetails[0].LAST_NAME);
                    $('#txtEmail').val(userDetails[0].EMAIL_ADDRESS);
                    $('#txtMobileNumber').val(userDetails[0].CONTACTNO);
                    $('#txtSex').val(userDetails[0].SEX);
                    $('#txtMaritalStatus').val(userDetails[0].MARITAL_STATUS);
                    $('#txtStreetName').val(userDetails[0].STREET_NO);
                    $('#txtBarangay').val(userDetails[0].BARANGAY);
                    $('#txtCity').val(userDetails[0].CITY);
                    $('#txtProvince').val(userDetails[0].PROVINCE);
                    $('#txtRegion').val(userDetails[0].REGION);
                    $('#txtPostalCode').val(userDetails[0].ZIPCODE);

                    if (!userDetails[0].PROFILE_IMAGE) {
                        // If empty, set it to the current date
                        $('#preview_signature').attr('src', '../../../Resources/dist/img/default-150x150.png');

                    } else {

                        $('#preview_signature').attr('src', imagesBaseUrl + userDetails[0].SIGNATURE_);
                    }


                },
                error: function (xhr, status, error) {
                    if (xhr.status === 413) {
                        alert('Request Entity Too Large: The file you are trying to upload is too large.');
                    } else {
                        alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
                    }
                    $('#ERROR').text('Error: ' + error);

                }
            });
        }
        const OptionProfile = () => {

            $('#modal-profile').modal('show');

        }


        const OptionLoanHistory = () => {

            GetData({
                url: "Menu.aspx/GetUserLoanInformation",
                data: JSON.stringify({
                    user_id: params.USERID
                })
            }).then(e => {
                let data = JSON.parse(e.d);
                loanRecords = data.LoanRecords;
                loanDetailsRecords = data.LoanDetailsRecords;
                let html = '';

                // Iterate through loanRecords and loanDetailsRecords
                for (let i = 0; i < loanRecords.length; i++) {
                    const loanRecord = loanRecords[i];
                    const loanDetail = loanDetailsRecords.find(detail => detail.LOAN_ID === loanRecord.LOAN_ID);
                    if (loanDetail) {
                        const startDate = FormatDate(loanDetail.START_DATE);
                        var params = {
                            amount: loanRecord.AMOUNT,
                            tenure: loanRecord.TENURE,
                            processfee: loanRecord.PROCESSING_FEE,
                            interestrate: loanRecord.INTEREST_RATE,
                            startdate: startDate.day + " " + startDate.month + " " + startDate.year,
                            branch: loanRecord.BRANCH,
                            loanid: loanRecord.LOAN_ID

                        };

                        const statusClasses = {
                            "ONGOING": "badge-warning",
                            "APPROVED": "badge-success",
                            "DISAPPROVED": "badge-danger",
                            "FULLY-PAID": "badge-info"
                        };
                        const defaultClass = "badge-secondary";
                        const badgeClass = statusClasses[loanRecord.STATUS] || defaultClass
                        html += `
                           <div class="current-loans">
                               <div class="form-group row custom-form-group justify-content-between">
                                   <div class="current-loan custom-current-loan">
                                       <label class="loan-amount">  ${loanRecord.AMOUNT}</label>
                                       <span class="badge ${badgeClass}"> ${loanRecord.STATUS}</span><br />
                                       <label class="loan-start-date">Start on ${startDate.day} ${startDate.month} ${startDate.year} </label><br />
                                       <label class="loan-due-date">₱ ${loanDetail.AMOUNT} ${loanRecord.INSTALLMENT_PLAN}</label>
                                   </div>
                                   <div class="current-loan-button">
                                      <button type="button" data-toggle="modal" data-target="#modal-loan-details" onclick='CurrentDetails(${JSON.stringify(params)});' class="see-details"><i class="fas fa-arrow-circle-right"></i></button>
                                   </div>
                               </div>
                           </div> `;
                    }
                }

                // Append the generated HTML to the container
                $(".loan-container").html(html);
            })
            $('#modal-history').modal('show');
        }
        const OptionNotifications = () => {
            GetData({
                url: "Menu.aspx/GetNotifications",
                data: JSON.stringify({
                    user_id: params.USERID
                })
            }).then(e => {
                let data = JSON.parse(e.d);
                notifications = data.Notifications;


                let html = '';

                // Iterate through loanRecords and loanDetailsRecords
                for (let i = 0; i < notifications.length; i++) {
                    const notification = notifications[i];

                    const startDate = FormatDate(notification.CREATED_DATE);
                    //var params = {
                    //    amount: loanRecord.AMOUNT,
                    //    tenure: loanRecord.TENURE,
                    //    processfee: loanRecord.PROCESSING_FEE,
                    //    interestrate: loanRecord.INTEREST_RATE,
                    //    startdate: startDate.day + " " + startDate.month + " " + startDate.year,
                    //    branch: loanRecord.BRANCH,
                    //    loanid: loanRecord.LOAN_ID

                    //};


                    html += `
                               
                                                   <div class="notifications custom-notification" id="notificationTrigger" data-id=" ${notification.ID} ">
                                                <div class="row align-items-center">
                                                    <div class="col-auto">
                                                        <div class="notif-image">
                                                            <img src="../../../Resources/dist/img/meme.png" width="30" height="30" class="clickable-image" />
                                                        </div>
                                                    </div>
                                                    <div class="col">
                                                        <div class="row justify-content-between">
                                                            <div class="col-auto">
                                                                <label class="notification-title"> ${notification.TITLE} </label>
                                                                <label class="notification-date">${startDate.day} ${startDate.month} ${startDate.year}</label>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-auto">
                                                                <p class="notification-description truncated-text">${notification.DESCRIPTION} </p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                          `;

                }
                // Append the generated HTML to the container
                $(".notification-container").html(html);
                $('#modal-notifications').modal('show');
            })



        }
        const CurrentDetails = (config) => {
            $(".loan-details-list").empty();
            let html = '';
            console.log(config.loanid);


            const filteredDetails = loanDetailsRecords
                .filter(detail => detail.LOAN_ID === config.loanid)
                .sort((b, a) => new Date(b.START_DATE) - new Date(a.START_DATE));


            $('#LoanAmount').text("₱ " + config.amount);
            $('#processFee').text(config.processfee);
            $('#interestRate').text(config.interestrate);
            $('#loanTenure').text(config.tenure);
            $('#startDate').text(config.startdate);
            $('#branchName').text(config.branch);
            $('#loanID').text(config.loanid);

            // Iterate through filtered loanDetailsRecords
            for (let i = 0; i < filteredDetails.length; i++) {
                const loanDetail = filteredDetails[i];
                const startDate = FormatDate(loanDetail.DUE_DATE);

                // Determine the status based on ISComplete
                const status = loanDetail.IS_COMPLETE ? 'PAID' : 'UNPAID';

                html += `
            <div class="separator-line">
                <div class="form-group row justify-content-between" style="border-bottom: 1px solid #E9E9E9;">
                    <div class="current-loan custom-current-details">
                        <label>${i + 1}/${filteredDetails.length}</label>,
                        <label>${loanDetail.AMOUNT}</label><br />
                        <label class="loan-due-date">Due Date: ${startDate.day} ${startDate.month} ${startDate.year}</label>
                    </div>
                    <div class="current-loan-status">
                        <label>${status}</label>
                    </div>
                </div>
            </div>
        `;

            }

            // Append the generated HTML to the container
            $(".loan-details-list").html(html);
            //   console.log(html);
        }

        const FormatDate = (dateString) => {

            const date = new Date(dateString);
            const day = date.getDate();
            const month = date.toLocaleString('default', { month: 'short' });
            const year = date.getFullYear();
            return {
                day: day,
                month: month,
                year: year,
            };
        }
        const GetData = (config) => {
            config.type = config.type || "POST";
            config.data = config.data || "";
            return $.ajax({
                type: config.type,
                url: config.url,
                data: config.data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                //beforeSend: function () {
                //    loaderContainer.show();
                //},
                //complete: function () {
                //    loaderContainer.hide();
                //},
                success: data => { },
                error: function (xhr, status, error) {
                    if (xhr.status === 413) {
                        alert('Request Entity Too Large: The file you are trying to upload is too large.');
                    } else {
                        alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
                    }
                    $('#ERROR').text('Error: ' + error);

                }


            });

        };


    </script>

</asp:Content>

