<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Profile/Page.master" AutoEventWireup="true" CodeFile="Profile_Primary.aspx.cs" Inherits="Views_UserApp_Profile_Profile_Primary" %>

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
                        <div class="header-label">
                            <label>Profile</label>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="inputFile" style="cursor: pointer;">
                                    <img src="../../../Resources/dist/img/default-150x150.png" id="image_upload_preview" class="img-circle" width="70" height="70" />
                                </label>
                                <input type='file' id="inputFile" style="display: none;" class="custom-file-input" onchange="readURL(this);" />
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
                                    <input type="date" required="" autocomplete="off" id="txtDOB" class="form-control input">
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
                                    <button type="button" class="btn btn-primary" id="btnSave" onclick="User_Update()">Save</button>
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
        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        const userId = params.USERID;
        const userName = params.USERNAME;
        const phoneNumber = params.PHONENUMBER;
        const imagesBaseUrl = "../../../UploadedFiles/";
        const allowedExtension = ['image/jpeg', 'image/jpg', 'image/png'];

        $(document).ready(function () {

            fetchUserDetails();

        });
        function fetchUserDetails() {
            var input;
            if (userId == null || userId == "") {
                input = userName;
            }
            else {
                input = userId;
            }

            var items = {
                INPUT: input
            }
        
            // Make an AJAX request to fetch the user details
            $.ajax({
                url: 'Profile_Primary.aspx/GetUserDetails',
                type: "POST",
                data: JSON.stringify({ item: items }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var userDetails = response.d;
                    // Populate the textboxes with the retrieved user details
                    var userDetails = JSON.parse(response.d);
                    // Format the date of birth
                    console.log(response);
                    if (!userDetails[0].DATE_OF_BIRTH) {
                        // If empty, set it to the current date
                        var currentDate = new Date().toISOString().split('T')[0];
                        $('#txtDOB').val(currentDate);
                    } else {
                        // If not empty, format the date of birth
                        var dateOfBirth = new Date(userDetails[0].DATE_OF_BIRTH).toISOString().split('T')[0];
                        $('#txtDOB').val(dateOfBirth);
                    }
                    $('#image_upload_preview').attr('src', imagesBaseUrl + userDetails[0].PROFILE_IMAGE);
                    //Populate the textboxes with the retrieved user details
                    $('#txtFirstName').val(userDetails[0].FIRST_NAME);
                    $('#txtLastName').val(userDetails[0].LAST_NAME);
                    $('#txtMiddleName').val(userDetails[0].MIDDLE_NAME);

                    $('#txtEmail').val(userDetails[0].EMAIL_ADDRESS);
                    $('#txtMobileNumber').val(userDetails[0].CONTACTNO);
                    $('#txtSex').val(userDetails[0].SEX);
                    $('#txtMaritalStatus').val(userDetails[0].MARITAL_STATUS);
                    // ... populate other textboxes similarly
                },
                error: function (error) {
                    //alert(error,userId,userName,phoneNumber);
                    // Handle the error response
                    alert('ERROR');
                    console.log(error);

                }
            });
        }

        function User_Update() {
            var files = $('.custom-file-input');
            var formData = new FormData();
            formData.append("file", files[0].files[0]);
            upload(formData);
             //Fetch the updated user details from the textboxes


            var updatedUser = {
                USER_ID: userId,
                FIRST_NAME: $('#txtFirstName').val(),
                LAST_NAME: $('#txtLastName').val(),
                MIDDLE_NAME: $('#txtMiddleName').val(),
                DATE_OF_BIRTH: $('#txtDOB').val(),
                EMAIL_ADDRESS: $('#txtEmail').val(),
                CONTACTNO: $('#txtMobileNumber').val(),
                SEX: $('#txtSex').val(),
                MARITAL_STATUS: $('#txtMaritalStatus').val(),
            };
            console.log(updatedUser);
            // Make an AJAX request to update the user details
            $.ajax({
                url: 'Profile_Primary.aspx/InsertOrUpdate',
                type: "POST",
                data: JSON.stringify({ query: "APP_PROFILE_UPDATE", item: updatedUser }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Handle the success response
                    var result = JSON.parse(response.d);
                    if (result === "Success") {
                        // Show a success message
                        fetchUserDetails();

                        console.log("User details updated successfully.");
                    } else {
                        // Show an error message
                        console.log("Failed to update user details.");
                    }
                },
                error: function (error) {
                    // Handle the error response
                    console.log(error);
                }
            });
        }
        function getQueryStringValue(key) {
            // Fetch the value of a query string parameter by key
            var urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(key);
        }
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#image_upload_preview').attr('src', e.target.result);
                }

                reader.readAsDataURL(input.files[0]);
            }
        }

        $("#inputFile").change(function () {
            readURL(this);
            if (!allowedExtension.includes(this.files[0]['type'])) {
                alert('Only (jpeg, jpg, png) file extensions can be uploaded!')
                $(this).val('');
            }

        });
        function upload(files) {
            console.log(files);
            $.ajax({
                type: 'post',
                url: '../Profile/Handlers/FileUpload.ashx?USERID='+ userId,
                data: files,
                cache: false,
                processData: false,
                contentType: false,
                success: function (e) {
                    console.log(e);
     /*               alert('success');*/
                },
                error: function (err) {
                    console.log(err);
                }
            })
        }


    </script>
</asp:Content>
