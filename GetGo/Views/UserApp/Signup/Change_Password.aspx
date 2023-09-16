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
    <div class="wrapper">
        <section class="content-header">
            <div class="container-fluid">
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="col-lg-12">
                    <%--<label> Change Password</label>--%>
                    <div class="card">
                        <div class="card-body" style="text-align: left;">
                            <div class="form-group">
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
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">

    <script type="text/javascript">
        $(document).ready(function () {
   
        });

        function GetUserID() {
            var input = $('#txtEmail').val();
            $.ajax({
                url: 'Change_Password.aspx/GetUserID',
                type: "POST",
                data: JSON.stringify({ query: "APP_PROFILE_GET_USER_ID", input: input }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                  
                    // Handle the success response
                    var result = response.d;
                    var result = JSON.parse(response.d)
                    if (result && result.length > 0) {
                   
                        SendMail(input);
                    } else {
                        // Show an error message for the case when no user is found
                        alert('Email Not found');
                    }
                },
                error: function (error) {
                    // Handle the error response
                    console.log(error);
                }
            });
        }

        function SendMail(input) {
            $.ajax({
                url: 'Change_Password.aspx/SendMail',
                type: "POST",
                data: JSON.stringify({ email: input }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Handle the success response
                    try {


                        if (response.d === "success") {
                               window.location = "Change_Password_Primary.aspx?RESPONSE=Success&EMAIL="+input;
                       /*     alert('success');*/
                            //window.location = "Change_Password.aspx?" + result.success;
                        } else {
                            alert(response.message);
                        }
                    } catch (response) {
                        alert('An error occurred while processing the response');
                    }
                },
                error: function (error) {
                    // Handle the error response
                    console.log(error);
                }
            });
        }

    </script>


</asp:Content>

