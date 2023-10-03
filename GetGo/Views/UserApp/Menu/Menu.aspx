<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Menu.aspx.cs" Inherits="Views_UserApp_Menu_Menu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .clickable-image {
            /* Your existing styles for clickable images */
            /* ... */
            transition: transform 0.3s ease; /* Apply smooth transition effect */
            user-select: none; /* Disable text selection */
        }

            .clickable-image:hover {
                transform: scale(1.1); /* Scale up the image by 10% on hover */

                cursor: pointer; /* Change cursor to indicate interactivity */
            }

        .green-1 {
            color: #2B9348;
            font-weight: 900;
        }

        .red-1 {
            color: #DA2C38;
            font-weight: 900;
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
                                    <h4>Name here</h4>
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
                        <div class="custom-modal">
                              <div class="card">
                            <div style="align-items: center; margin-top: -35px">
                                <img src="../../../Resources/dist/img/cash.png" width="70" height="70" class="clickable-image" onclick="ModeOfRepayment('branch')" />
                            </div>
                                  <div class="custom-modal-body">

                                  </div>
                            
                        </div>
                            <div class="custom-modal-footer" >
                                <button type="button" class="btn btn-primary" data-dismiss="modal" aria-label="Close" style="width:100%;background-color:#1B5B6B; border-radius:10px"> Go back</button>
                            </div>
                        </div>
                      
                    </div>

                </div>
            </div>
        </section>
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
                                            <label>Current Loans</label>
                                        </div>
                                        <div class="card-body loan-container">
                                            <div class="current-loans">
                                                <div class="form-group row custom-form-group justify-content-between">
                                                    <div class="current-loan custom-current-loan">
                                                        <label class="loan-amount">${loanRecord.AMOUNT}</label><br />
                                                        <label class="loan-start-date">Start on ${startDate.day} ${startDate.month} ${startDate.year} </label>
                                                        <br />
                                                        <label class="loan-due-date">₱ ${loanDetail.AMOUNT} ${loanRecord.INSTALLMENT_PLAN}</label>
                                                    </div>
                                                    <div class="current-loan-button">
                                                        <button type="button" data-toggle="modal" data-target="#modal-loan-details" onclick='CurrentDetails(${JSON.stringify(params)});' class="see-details"><i class="fas fa-arrow-circle-right"></i></button>
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
    <div class="modal fade" id="modal-notifications" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="modal-header">
                </div>
                <div class="modal-body" style="padding-left: 0px !important; padding-right: 0px !important;">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                    <div class="wrapper">
                        <section class="content-header">
                        </section>
                        <section class="content">
                            <div class="container-fluid" style="padding: 0px !important">
                                <div class="col-lg-12">

                                    <div class="card" style="padding: 0px !important">
                                        <div class="header-label">
                                            <label>Loan</label>
                                        </div>
                                        <div class="card-body loan-container">
                                            asdasdasd
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
    <div class="modal fade" id="modal-alert" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <br />
            <br />

            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="custom-modal-header" style="width: 100px; color: red;">
                </div>
                <div class="custom-modal-body">
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <%--  <script>
        document.addEventListener('contextmenu', function (event) {
            event.preventDefault();
        });

        document.onkeydown = function (e) {
            if (e.key === 'F12' || (e.ctrlKey && e.shiftKey && e.key === 'I') || (e.ctrlKey && e.shiftKey && e.key === 'C') || (e.ctrlKey && e.shiftKey && e.key === 'J') || (e.ctrlKey && e.key === 'U')) {
                e.preventDefault();
            }
        }
    </script>--%>
    <script>

        $(() => {
            //  $('#modal-alert').modal('show');

        });
        const OptionProfile = () => {
            $('#modal-profile').modal('show');
        }
        const OptionLoanHistory = () => {
            $('#modal-history').modal('show');
        }
        const OptionNotifications = () => {
            $('#modal-notifications').modal('show');
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
                    loaderContainer.hide();
                }


            });

        };

    </script>
</asp:Content>

