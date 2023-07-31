<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Signup/Page.master" AutoEventWireup="true" CodeFile="Signup_Primary.aspx.cs" Inherits="Views_UserApp_Signup_Signup_Primary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="col-lg-12" style="text-align: center">
                    <br />
                    <h1 style="font-size: 48px"><b style="color: #2b9348">Get</b><b style="color: #da2c38">Go</b>
                    </h1>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <h4>Hi there, Welcome!</h4>
                                <h4>Sign up to continue</h4>
                            </div>
                        </div>

                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa fa-user icon"></i>
                                    <input type="text" id="txtUserName" class="form-control input" placeholder="Username" />
                                </div>
                                <label id="lblUserName" class="label-alert text-danger"></label>
                            </div>
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa fa-mobile-alt icon"></i>
                                    <input type="number" id="txtPhoneNumber" class="form-control input" placeholder="Phone Number" />
                                </div>
                                <label id="lblPhoneNumber"  class="label-alert text-danger"></label>
                            </div>
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa  fa-paper-plane icon"></i>
                                    <input type="email" id="txtEmail" class="form-control input" placeholder="Email Address" />
                                </div>
                                   <label id="lblEmail"  class="label-alert text-danger"></label>
                            </div>
                         <%--   <div class="input">
                                <button type="button" class="btn btn-primary" id="btnSave" onclick="SaveClick()">Save</button>
                            </div>--%>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script type="text/javascript">

        $(document).ready(function () {
            hideAlertLabels();
         /*   adjustContentPosition();*/
        });
        function hideAlertLabels() {
            $('.label-alert').hide();
        }

        // Function to show the alert label with a specific message
        function showAlertLabel(labelId, message) {
            var label = $('#' + labelId);
            label.text(message);
            label.show();
        }
        function adjustContentPosition() {
            var contentElement = $('.wrapper'); // Replace this selector with the appropriate element that wraps your content
            var windowHeight = window.innerHeight;
            var contentHeight = contentElement.outerHeight();
            var keyboardHeight = windowHeight - contentHeight;

            if (keyboardHeight > 0) {
                // Keyboard is open
                contentElement.css('margin-top', -(keyboardHeight + 20) + 'px'); // You can adjust the offset (20) as needed
            } else {
                // Keyboard is closed
                contentElement.css('margin-top', '0');
            }
            $(window).on('resize', function () {
                adjustContentPosition();
            });
        }
        function SaveClick() {
            var Username = $('#txtUserName').val();
            var PhoneNumber = $('#txtPhoneNumber').val();
            var Email = $('#txtEmail').val();
            //console.log(Username, PhoneNumber, Email);
            $.ajax({
                url: 'Signup_Primary.aspx/CheckExist',
                type: "POST",
                data: JSON.stringify({
                    query: "APP_SIGNUP",
                    username: Username,
                    phonenumber: PhoneNumber,
                    email: Email

                }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Handle the success response

                    // Populate the textboxes with the retrieved user details

                    var userDetails = JSON.parse(response.d);

                    if (userDetails[0].USERNAME === '1') {
                        // Clear the textbox and show the alert for USERNAME
                        $('#txtUserName').val('').css('border', '1px solid red');
                        showAlertLabel('lblUserName', 'Username already exists.');
                    } else {
                        // Reset the border and hide the alert for USERNAME
                        $('#txtUserName').css('border', ''); // This clears the inline style
                        $('#lblUserName').hide();
                    }

                    if (userDetails[0].PHONENUMBER === '1') {
                        // Clear the textbox and show the alert for PhoneNumber
                        $('#txtPhoneNumber').val('').css('border', '1px solid red');
                        showAlertLabel('lblPhoneNumber', 'Phone number already exists.');
                    } else {
                        // Reset the border and hide the alert for PhoneNumber
                        $('#txtPhoneNumber').css('border', ''); // This clears the inline style
                        $('#lblPhoneNumber').hide();
                    }

                    if (userDetails[0].EMAIL === '1') {
                        // Clear the textbox and show the alert for Email
                        $('#txtEmail').val('').css('border', '1px solid red');
                        showAlertLabel('lblEmail', 'Email address already exists.');
                    } else {
                        // Reset the border and hide the alert for Email
                        $('#txtEmail').css('border', ''); // This clears the inline style
                        $('#lblEmail').hide();
                    }
                    if (userDetails[0].USERNAME === '0' && userDetails[0].PHONENUMBER === '0' && userDetails[0].EMAIL === '0') {
                        window.location = "Signup_Primary.aspx?UserName=" + Username + "&PhoneNumber=" + PhoneNumber + "&Email=" + Email;
                    }

                    console.log(userDetails);
                    // ... populate other textboxes similarly
                },
                error: function (error) {
                    // Handle the error response
                    console.log(error);
                }
            });

          
        }

    



    </script>
</asp:Content>

