<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Signup/Page.master" AutoEventWireup="true" CodeFile="Change_Password_Secondary.aspx.cs" Inherits="Views_UserApp_Signup_Change_Password_Secondary" %>

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
    <div class="wrapper">
        <section class="content-header">
            <div class="container-fluid">
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="col-lg-12">
                    <label> Forgot Password?</label>
                    <div class="card">
                        <div class="card-body"  style="text-align:left;">
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
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script type="text/javascript">
        $(document).ready(function () {
            hideAlertLabels();
            initializePasswordValidation();
            initializeConfirmPasswordValidation();
        });
        function hideAlertLabels() {
            $('.label-alert').hide();
        }
        function hideAlertLabel(labelId) {
            var label = $('#' + labelId);
            label.hide();
        }
        function showAlertLabel(labelId, message) {
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
        function initializePasswordValidation() {
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

        function initializeConfirmPasswordValidation() {
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
        function validateForm() {
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
            // Return true if all fields are valid, otherwise false
            return isValidPassword && passwordsMatch;
        }
    </script>
</asp:Content>



