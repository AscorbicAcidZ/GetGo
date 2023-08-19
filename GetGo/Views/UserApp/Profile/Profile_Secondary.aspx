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
                                <div class="input">
                                       <input type="text" required="" autocomplete="off" id="txtUserID" class="form-control input" style="display:none;">
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
                              <%-- <div class="form-group">
                                <div class="input">
                                    <button type="button" class="btn btn-primary" id="btnSave" onclick="User_Update()">Save</button>
                                </div>
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
        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        const userId = params.USERID;
        $(document).ready(function () {
            fetchUserDetails(userId);
        });
        function fetchUserDetails(input) {
            // Fetch the query string parameter values
            var items = {
                INPUT: input
            }
            // ...

            // Make an AJAX request to fetch the user details
            $.ajax({
                url: 'Profile_Primary.aspx/GetUserDetails',
                type: "POST",
                data: JSON.stringify({ item: items }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    // Handle the success response
                    var userDetails = response.d;
          
                    // Populate the textboxes with the retrieved user details
                    var userDetails = JSON.parse(response.d);
              
                    // Populate the textboxes with the retrieved user details
                    $('#txtUserID').val(userDetails[0].USER_ID);
                    $('#txtStreetName').val(userDetails[0].STREET_NO);
                    $('#txtBarangay').val(userDetails[0].BARANGAY);
                    $('#txtCity').val(userDetails[0].CITY);
                    $('#txtProvince').val(userDetails[0].PROVINCE);
                    $('#txtRegion').val(userDetails[0].REGION);
                    $('#txtPostalCode').val(userDetails[0].ZIPCODE);
                    // ... populate other textboxes similarly
                    //console.log(userDetails[0].USER_ID);
                },
                error: function (error) {
                    // Handle the error response
                    console.log(error);
                }
            });
        }

        function SaveClick() {
            var updatedUser = {
                USER_ID: $('#txtUserID').val(),
                STREET_NO: $('#txtStreetName').val(),
                BARANGAY: $('#txtBarangay').val(),
                CITY: $('#txtCity').val(),
                PROVINCE: $('#txtProvince').val(),
                REGION: $('#txtRegion').val(),
                ZIPCODE: $('#txtPostalCode').val(),
               
           
            };
            //console.log('updateuser update',
            //updatedUser);
            //console.log($('#txtUserID').val())
            $.ajax({
                url: 'Profile_Secondary.aspx/InsertOrUpdate',
                type: "POST",
                data: JSON.stringify({ query: "APP_PROFILE_UPDATE", item: updatedUser }),
                contentType: "application/json;charset=utf-8",
                dataType: "json",
                success: function (response) {
                    var result = JSON.parse(response.d);
                    alert($('#txtUserID').val());
                    window.location = "Profile_Quartenary.aspx?USERID=" + $('#txtUserID').val();
                  
                },
                error: function (error) {
                    console.log(error);
                }
            });
        }
    
    </script>
</asp:Content>
