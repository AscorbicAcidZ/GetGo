<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Profile/Page.master" AutoEventWireup="true" CodeFile="Profile_Secondary.aspx.cs" Inherits="Views_UserApp_Profile_Profile_Secondary" %>

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
                                <img src="../../../Resources/dist/img/prod-1.jpg" class="img-circle" width="70" />
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
        $(document).ready(function () {
            fetchUserDetails();
        });
        function fetchUserDetails() {
            // Fetch the query string parameter values
            var userId = '001';
            /* var userId = getQueryStringValue('userId');*/

            var items = {
                USER_ID: userId
            }
            // ...

            // Make an AJAX request to fetch the user details
            $.ajax({
                url: 'Profile_Secondary.aspx/GetUserDetails',
                type: "POST",
                data: JSON.stringify({ query: "USP_GET_USER_ID", item: items }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Handle the success response
                    var userDetails = response.d;
          
                    // Populate the textboxes with the retrieved user details
                    var userDetails = JSON.parse(response.d);

                    // Populate the textboxes with the retrieved user details
                    $('#txtStreetName').val(userDetails[0].STREET_NO);
                    $('#txtBarangay').val(userDetails[0].BARANGAY);
                    $('#txtCity').val(userDetails[0].CITY);
                    $('#txtProvince').val(userDetails[0].PROVINCE);
                    $('#txtRegion').val(userDetails[0].REGION);
                    $('#txtPostalCode').val(userDetails[0].POSTAL_CODE);
                    // ... populate other textboxes similarly
                },
                error: function (error) {
                    // Handle the error response
                    console.log(error);
                }
            });
        }

        function User_Update() {
            var updatedUser = {
                STREET_NO: $('#txtStreetName').val(),
                BARANGAY: $('#txtBarangay').val(),
                CITY: $('#txtCity').val(),
                PROVINCE: $('#txtProvince').val(),
                REGION: $('#txtRegion').val(),
                ZIPCODE: $('#txtPostalCode').val()
            };
            console.log(updatedUser);
            $.ajax({
                url: 'Profile_Secondary.aspx/InsertOrUpdate',
                type: "POST",
                data: JSON.stringify({ query: "APP_PROFILE_UPDATE", item: updatedUser }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = JSON.parse(response.d);
                    if (result === "Success") {
                        console.log("User details updated successfully.");
                    } else {
                        console.log("Failed to update user details.");
                    }
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
        function getQueryStringValue(key) {
            // Fetch the value of a query string parameter by key
            var urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(key);
        }
    </script>
</asp:Content>
