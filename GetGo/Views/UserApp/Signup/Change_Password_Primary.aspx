<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Signup/Page.master" AutoEventWireup="true" CodeFile="Change_Password_Primary.aspx.cs" Inherits="Views_UserApp_Signup_Change_Password_Primary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* CSS for the form-check label text */
        .form-check-label {
            font-size: 14px; /* Adjust the font size as needed */
        }

        .label-alert {
            font-size: 10px;
        }

        .label-small {
            font-size: 12px;
        }

        .c1 {
            color: black;
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
        <section class="content ">
            <div class="container-fluid ">
                <div class="col-lg-12">
                    <%--<label>Change Password</label>--%>
                    <div class="card">
                        <div class="card-body" style="text-align: left;">
                            <div class="form-group">
                                <label class="label-small c1">Enter authentication code sent via email</label>
                                <div class="group">
                                    <i class="fa  fa-key icon"></i>
                                    <input type="text" required="" autocomplete="off" id="txtEmail" class="form-control input">
                                </div>
                                <div class="right" style="text-align: right;">
                                    <label class="label-small c1">Didn’t get the code?</label>
                                    <label class="label-small">Click here to resend</label>
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
    <script>
        $(document).ready(() => {

        });

        const GetData = (config) => {
            config.type ??= "POST"
            config.data ??= "";
            return $.ajax({
                type: config.type,
                url: config.url,
                data: config.data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: data => { }

            });
    </script>
</asp:Content>

