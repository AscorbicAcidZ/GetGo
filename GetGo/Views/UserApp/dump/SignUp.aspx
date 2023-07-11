<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Page.master" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="Views_UserApp_SignUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="container-lg">

        <input type="text" id="username" class="form-control" required="required" placeholder="User Name" />
        <br />

        <input type="email" id="email" class="form-control" required="required" placeholder="Email Address" />
        <br />

        <input type="number" id="phone" class="form-control" required="required" placeholder="Phone Number" />
        <br />

        <input type="password" id="password" required="required" class="form-control" placeholder="Password" />
        <button id="passwordVisibilityToggle" type="button" onclick="togglePasswordVisibility()">*</button>
        <br />
        <input type="password" id="confirmPassword" required="required" oninput="validatePasswords()" class="form-control" placeholder="Confirm Password" />
        <button id="confirmPasswordVisibilityToggle" type="button" onclick="toggleConfirmPasswordVisibility()">*</button>
        <br />
        <span id="passwordValidationMessage"></span>
 <%--       <button type="button" id="btnSave" text="Save"></button>--%>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">

    <script type="text/javascript">
        $(document).ready(function () {
            $('#btnSave').on('click', function () {
                saveData();
            })
        });
        function saveData() {
            // Get the values from the input fields
            var username = document.getElementById("username").value;
            var email = document.getElementById("email").value;
            var phone = document.getElementById("phone").value;
            var password = document.getElementById("password").value;

            var query = "USP_APP_SIGNUP_CREATE_OR_UPDATE";
            var parameters = {
                USERNAME: username,
                EMAIL: email,
                PHONENUMBER: phone,
                PASSWORD: password
            };

            $.ajax({
                url: "SignUp.aspx/QueryInsertOrUpdate",
                type: "POST",
                data: JSON.stringify({
                    query: query,
                    parameters: parameters
                }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (e) {
                    console.log(e);
                    alert('success');
                },
                error: function (errormessage) {
                    console.log(errormessage);
                }
            });


        }
        function validatePasswords() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            var validationMessage = document.getElementById("passwordValidationMessage");

            if (password !== confirmPassword) {
                validationMessage.textContent = "Passwords do not match";
            } else {
                validationMessage.textContent = "Password Match";
            }
        }

        function togglePasswordVisibility() {
            var passwordInput = document.getElementById("password");
            var passwordVisibilityToggle = document.getElementById("passwordVisibilityToggle");

            if (passwordInput.type === "password") {
                passwordInput.type = "text";
                passwordVisibilityToggle.textContent = "*";
            } else {
                passwordInput.type = "password";
                passwordVisibilityToggle.textContent = "*";
            }
        }

        function toggleConfirmPasswordVisibility() {
            var confirmPasswordInput = document.getElementById("confirmPassword");
            var confirmPasswordVisibilityToggle = document.getElementById("confirmPasswordVisibilityToggle");

            if (confirmPasswordInput.type === "password") {
                confirmPasswordInput.type = "text";
                confirmPasswordVisibilityToggle.textContent = "*";
            } else {
                confirmPasswordInput.type = "password";
                confirmPasswordVisibilityToggle.textContent = "*";
            }
        }
    </script>
</asp:Content>

