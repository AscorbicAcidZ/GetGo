<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Signup/Page.master" AutoEventWireup="true" CodeFile="Change_Password.aspx.cs" Inherits="Views_UserApp_Signup_Change_Password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* CSS for the form-check label text */
        .form-check-label {
            font-size: 14px; /* Adjust the font size as needed */
        }

        .label-alert {
            font-size: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <nav>
        <div class="nav nav-pills nav-fill" id="nav-tab" role="tablist" style="background-color: white;">
            <a class="nav-link active" id="step1-tab" data-toggle="tab" href="#step1">Step 1</a>
            <a class="nav-link" id="step2-tab" data-toggle="tab" href="#step2">Step 2</a>
            <a class="nav-link" id="step3-tab" data-toggle="tab" href="#step3">Step 3</a>

        </div>
    </nav>
    <div class="tab-content py-4" id="nav-tabContent">
        <div class="tab-pane fade show active" id="step1">
            <div class="wrapper">
                <section class="content">
                    <div class="container-fluid">
                        <div class="row justify-content-center">
                            <div class="col-lg-4">
                                <%--<label> Change Password</label>--%>
                                <div class="card">
                                    <div class="card-body" style="text-align: left;">
                                        <div class="form-group" id="form-mail">
                                            <label>Enter Registered Email</label>
                                            <div class="group">
                                                <i class="fa  fa-envelope-open icon"></i>
                                                <input type="email" required="" autocomplete="off" id="txtEmail" class="form-control input">
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
        <div class="tab-pane fade" id="step2">
            <div class="wrapper">

                <section class="content">
                    <div class="container-fluid">
                        <div class="row justify-content-center">
                            <div class="col-md-4">
                                <%--<label> Change Password</label>--%>
                                <div class="card">
                                    <div class="card-body" style="text-align: left;">
                                        <div class="form-group" id="form-vcode">
                                            <label class="label-small c1">Enter authentication code sent via email</label>
                                            <div class="group">
                                                <i class="fa  fa-key icon"></i>
                                                <input type="text" required="" autocomplete="off" id="txtVcode" class="form-control input">
                                            </div>
                                            <div class="right" style="text-align: right;">
                                                <label class="label-small c1">Didn’t get the code?</label>

                                                <label class="label-small" id="resendLink">Click here to resend</label>
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
        <div class="tab-pane fade" id="step3">
            <div class="wrapper">
                <section class="content-header">
                    <div class="container-fluid">
                    </div>
                </section>
                <section class="content">
                    <div class="container-fluid">
                        <div class="row justify-content-center">
                            <div class="col-md-4">
                                <label>Forgot Password?</label>
                                <div class="card">
                                    <div class="card-body" style="text-align: left;">
                                        <div class="form-group">
                                            <div class="group">
                                                <i class="fa  fa-unlock-alt icon"></i>
                                                <input type="password" id="password" class="form-control input" placeholder="New Password" />
                                                <i class="far fa-eye icon-right" id="togglePassword" style="cursor: pointer;"></i>
                                            </div>
                                            <label id="passwordValidationMessage" class="label-alert text-danger"></label>
                                        </div>
                                        <div class="form-group">
                                            <div class="group">
                                                <i class="fa  fa-unlock-alt icon"></i>
                                                <input type="password" id="confirmPass" class="form-control input" placeholder=" Confirm Password" />
                                                <i class="far fa-eye icon-right" id="toggleConfirmPassword" style="cursor: pointer;"></i>

                                            </div>
                                            <label id="confirmPassValidationMessage" class="label-alert text-danger"></label>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">

    <script type="text/javascript">
        let details = "";
        let vcode = "";
        let email = "";
        let resendButtonDisabled = false;
        $(document).ready(() => {
            hideAlertLabels();
            initializePasswordValidation();
            initializeConfirmPasswordValidation();

            $('#resendLink').on('click', () => {
                const email = $('#txtEmail').val();
                resendVerificationCode(email);
            });

        });


        const resendVerificationCode = (email) => {
            if (resendButtonDisabled) {
                // Button is disabled, do nothing
                return;
            }


            // Disable the button to prevent multiple clicks
            resendButtonDisabled = true;
            $('#resendLink').addClass('disabled').text('Resending...');

            // Reuse the GetUserID function
            GetData({
                url: 'Change_Password.aspx/GetUserID',
                data: JSON.stringify({ query: "APP_PROFILE_GET_USER_ID", input: email })
            }).then(response => {
                // Handle the response here
                let result = JSON.parse(response.d);
                if (result.details) {
                    // Code sent successfully, update details if needed
                    details = result.details;
                    console.log("New verification code sent.", result.details);

                    // Start a countdown timer for 2 minutes
                    startCountdownTimer();
                } else {
                    // Handle any errors
                    console.error("Failed to resend verification code:", result.error);

                    // Enable the resend button immediately in case of an error
                    resendButtonDisabled = false;
                    $('#resendLink').removeClass('disabled').text('Click here to resend');
                }
            });
        };

        const startCountdownTimer = () => {
            let countdown = 120; // 2 minutes in seconds
            const countdownTimer = setInterval(() => {
                if (countdown <= 0) {
                    clearInterval(countdownTimer);
                    // Timer is over, enable the resend button
                    resendButtonDisabled = false;
                    $('#resendLink').removeClass('disabled').text('Click here to resend');
                } else {
                    $('#resendLink').text(`Resending in ${countdown} seconds`);
                    countdown--;
                }
            }, 1000); // Update every 1 second
        };


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
        const Save = () => {
            FormValidation();
        }

        const FormValidation = () => {
            const activeStep = $(".nav-link.active");
            const activeTab = activeStep.attr("id");
            const activeContentId = activeTab.replace("-tab", "");

            if (activeTab === "step1-tab") {

                if (!validateStep1()) {
                    return;
                }
            } else if (activeTab === "step2-tab") {

                if (!validateStep2()) {
                    return;
                }
            } else if (activeTab === "step3-tab") {
                if (validateStep3()) {

                    const passwordValue = document.getElementById('password').value;
                    GetData({
                        url: 'Change_Password.aspx/UpdatePassword',
                        data: JSON.stringify({ query: "APP_PROFILE_GET_USER_ID", email: email, password: passwordValue })
                    }).then(e => {
                        let result = JSON.parse(e.d);
                        if (result === "success") {

                            //alert('success');
                            window.location = "Change_Password.aspx?Response=success";

                        }
                    });
                } else {
                    return;
                }
            }


            const nextStep = getNextStep(activeContentId);

            // Remove "active" class from the current content and tab
            $("#" + activeContentId).removeClass("show active");
            activeStep.removeClass("active");

            // Add "active" class to the next content and tab
            $("#" + nextStep).addClass("show active");
            $("#" + nextStep + "-tab").addClass("active");

        };
        const validateStep1 = () => {
            let isValid = true;
            var input = $('#txtEmail').val();
            GetData({
                url: 'Change_Password.aspx/GetUserID',
                data: JSON.stringify({ query: "APP_PROFILE_GET_USER_ID", input: input })
            }).then(e => {
                let result = JSON.parse(e.d);
                if (result.error) {

                    $('#txtEmail').addClass('is-invalid');
                    $('#form-mail').after('<div class="error-message">' + result.error + '</div>');
                    isValid = false;
                }

                else {
                    details = result.details;
                    let isValid = true;
                    console.log(details);
                    alert(details);

                }

            }
            );

            return isValid;
        };
        const validateStep2 = () => {
            var enteredVcode = $('#txtVcode').val();
            let isValid = false;
            const parts = details.split('|');
            if (parts.length >= 2) {
                vcode = parts[0];
                email = parts[1];


                if (enteredVcode === vcode) {
                    isValid = true;
                } else if (enteredVcode !== vcode) {
                    $('#txtVcode').addClass('is-invalid');
                    $('#form-vcode').after('<div class="error-message"> Wrong verification code.</div>');
                } else {
                    $('#form-vcode').after('<div class="error-message">' + result.error + '</div>');
                }
                console.log("Entered Vcode:", enteredVcode);
                console.log("This is the generated Vcode:", vcode)
            }

            return isValid;
        };
        const validateStep3 = () => {

            const passwordValue = document.getElementById('password').value;
            const confirmPassValue = document.getElementById('confirmPass').value;
            const isValidPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/.test(passwordValue);
            const passwordsMatch = passwordValue === confirmPassValue;

            // Hide all validation messages first
            hideAlertLabel('passwordValidationMessage');
            hideAlertLabel('confirmPassValidationMessage');

            // Validate password
            if (!isValidPassword) {
                document.getElementById('password').style.border = '1px solid red';
                showAlertLabel('passwordValidationMessage', 'Password must contain 1 capital letter, 1 lowercase letter, 1 number, and be at least 8 characters long.');
            } else {
                document.getElementById('password').style.border = '';
            }

            // Validate confirm password
            if (!passwordsMatch) {
                document.getElementById('confirmPass').style.border = '1px solid red';
                showAlertLabel('confirmPassValidationMessage', 'Passwords do not match.');
            } else {
                document.getElementById('confirmPass').style.border = '';
            }
            if (!email || !passwordValue) {
                getNextStep("step1");
                return false;
            }
            // Return true if all fields are valid, otherwise false

            return isValidPassword && passwordsMatch;
        }

        // Function to determine the next step dynamically
        const getNextStep = (currentStep) => {
            const steps = ["step1", "step2", "step3", "step4"];
            const currentIndex = steps.indexOf(currentStep);
            if (currentIndex < steps.length - 1) {
                return steps[currentIndex + 1];
            }
            return currentStep; // Return the current step if it's the last step
        };

        // password verification
        const hideAlertLabels = () => {
            $('.label-alert').hide();
        }
        const hideAlertLabel = (labelId) => {
            var label = $('#' + labelId);
            label.hide();
        }
        const showAlertLabel = (labelId, message) => {
            var label = $('#' + labelId);
            label.text(message);
            label.show();
        }
        const togglePassword = document.querySelector('#togglePassword');
        const toggleConfirmPassword = document.querySelector('#toggleConfirmPassword');
        const password = document.querySelector('#password');
        const confirmPass = document.querySelector('#confirmPass');
        togglePassword.addEventListener('click', function (e) {
            // toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);

            this.classList.toggle('fa-eye-slash');
        });
        toggleConfirmPassword.addEventListener('click', function (e) {
            // toggle the type attribute
            const type = confirmPass.getAttribute('type') === 'password' ? 'text' : 'password';
            confirmPass.setAttribute('type', type);

            this.classList.toggle('fa-eye-slash');


        });
        const initializePasswordValidation = () => {
            password.addEventListener('input', function () {
                const passwordValue = password.value;
                const passwordInput = document.getElementById('password');

                // Check if the password meets the criteria
                const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/;
                const isValidPassword = passwordRegex.test(passwordValue);

                if (isValidPassword) {
                    // If valid, remove red border (if previously added)
                    passwordInput.style.border = '';
                    // Hide the password validation message
                    hideAlertLabel('passwordValidationMessage');
                } else {
                    // If not valid, add red border to the password input
                    passwordInput.style.border = '1px solid red';
                    // Show the password validation message
                    showAlertLabel('passwordValidationMessage', 'Password must contain 1 capital letter, 1 lowercase letter, 1 number, and be at least 8 characters long.');
                }
            });
        }
        const initializeConfirmPasswordValidation = () => {
            confirmPass.addEventListener('input', function () {
                const password = document.getElementById('password').value;
                const confirmPass = document.getElementById('confirmPass').value;
                const confirmPassInput = document.getElementById('confirmPass');

                // Check if the confirm password matches the password
                if (password !== confirmPass) {
                    // If not matched, add red border to the confirm password input
                    confirmPassInput.style.border = '3px solid red';
                    // Show the confirm password validation message
                    showAlertLabel('confirmPassValidationMessage', 'Passwords do not match.');
                } else {
                    // If matched, add green border to the confirm password input
                    confirmPassInput.style.border = '3px solid green';
                    // Hide the confirm password validation message
                    hideAlertLabel('confirmPassValidationMessage');
                }
            });
        }



    </script>


</asp:Content>

