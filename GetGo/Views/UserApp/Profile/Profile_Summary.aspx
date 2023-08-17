<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Profile/Page.master" AutoEventWireup="true" CodeFile="Profile_Summary.aspx.cs" Inherits="Views_UserApp_Profile_Profile_Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .form-control[disabled] {
            background-color: #f5f5f5; /* Set a background color */
            color: #555555; /* Set a text color */
            cursor: not-allowed; /* Change the cursor style */
            border: 1px solid #dddddd; /* Add a border to indicate disabled state */
            opacity: 0.8; /* Reduce opacity to visually indicate disabled state */
        }
    </style>
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
                                <%--<input type="file" id="inputFile" style="display: none;" class="custom-file-input" data-classification="PROFILE" onchange="readURL(this);" />--%>
                                <%--<img src="../../../Resources/dist/img/default-150x150.png" id="image_upload_preview" class="img-circle" width="70" height="70" />
                                <input type='file' id="inputFile" />--%>
                            </div>
                            <input type="text" required="" autocomplete="off" id="txtUserID" class="form-control input" style="display: none">
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
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Front Face</label>
                                    <input type="text" required="" autocomplete="off" id="txtFrontFace" class="form-control input">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Back Face</label>
                                    <input type="text" required="" autocomplete="off" id="txtBackFace" class="form-control input">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="input">
                                <button type="button" class="btn btn-primary" id="btnSave" onclick="Submit()">Save</button>
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
            fetchUserDetails(userId);
            // Disable all input fields
            $('input[type="text"]').prop('disabled', true);
        });
        function fetchUserDetails(input) {
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
                        $('#image_upload_preview').attr('src', '../../../Resources/dist/img/default-150x150.png');

                    } else {

                        $('#image_upload_preview').attr('src', imagesBaseUrl + userDetails[0].PROFILE_IMAGE);
                    }

                    //Populate the textboxes with the retrieved user details
                    $('#txtUserID').val(userDetails[0].USER_ID);
                    $('#txtFirstName').val(userDetails[0].FIRST_NAME);
                    $('#txtLastName').val(userDetails[0].LAST_NAME);
                    $('#txtMiddleName').val(userDetails[0].MIDDLE_NAME);

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
                    var frontfaceImg = userDetails[0].FRONTFACE; // Assuming the property name in the response is "FRONTFACE"
                    if (frontfaceImg) {
                        var filename = frontfaceImg.split('/').pop();
                        $('#txtFrontFace').val(filename);
                    }

                    var backfaceImg = userDetails[0].BACKFACE; // Assuming the property name in the response is "BACKFACE"
                    if (backfaceImg) {
                        var filename = backfaceImg.split('/').pop();
                        $('#txtBackFace').val(filename);
                    }
         /*           console.log('face', frontfaceImg);*/
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
        function Submit() {
            window.location = "Profile_Summary.aspx?USERID=" + userId;
            alert('1');
        }


    </script>
</asp:Content>
