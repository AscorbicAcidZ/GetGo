<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Profile/Page.master" AutoEventWireup="true" CodeFile="Profile_Quartenary.aspx.cs" Inherits="Views_UserApp_Profile_Profile_Quartenary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .left-align-label {
            text-align: left;
        }

        /* Styles for form title */
        .form-title {
            background-color: #F2F2F2;
            font-size: 14px;
            border-radius: 20px;
            font-weight: bold;
        }


        /* Styles for buttons */
        .btn-primary {
            background-color: #007BFF;
            border-color: #007BFF;
        }

        .compact-notes {
            font-size: 10px;
            margin-bottom: unset;
            color: #F2F2F2;
            padding: 0; /* Remove padding */
            color: black;
            text-align: left; /* Align text to the left */
        }

            .compact-notes p {
                margin-bottom: unset;
            }

        /* Style for Valid IDs link */
        .valid-ids-link {
            text-decoration: underline;
            cursor: pointer;
        }

        .custom-file-label {
            font-size: 12px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
    <link href="../../../Resources/custom-css/loader.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="loader-container" id="loader-container" style="display: none">
        <span id="LoadingInfo" style="color: white">Loading </span>
        <br />
        <div class="loader">
            <div></div>
            <div></div>
            <div></div>
            <div></div>
        </div>
    </div>

    <div class="wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="col-lg-12">
                    <br />
                    <%--<h1 style="font-size: 48px"><b style="color: #2b9348">Get</b><b style="color: #da2c38">Go</b>--%>
                    <%--</h1>--%>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="col-lg-12">

                    <div class="card">

                        <div class="header-label">
                            <input type="text" required="" autocomplete="off" id="txtUserID" class="form-control input" style="display: none">
                            <label>ID & Signature</label>
                        </div>
                        <div class="card-body">

                            <div class="form-title">
                                Attach photo of your valid ID here
                            </div>
                            <br />
                            <div class="form-group">
                                <div class="left-align-label">
                                    <label>Front face:</label>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" data-classification="FRONTFACE" id="frontface">
                                    <label class="custom-file-label" for="frontface">Attach photo here</label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="left-align-label">
                                    <label>Back face:</label>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" data-classification="BACKFACE" id="backface">
                                    <label class="custom-file-label" for="backface">Attach photo here</label>
                                </div>
                            </div>
                            <div class="form-group compact-notes">
                                <h6>Note:</h6>

                                <p>• Fake IDs and Blurred Photos may result in a declined loan application.</p>
                                <p>• View list of <span class="valid-ids-link"><a id="viewID" onclick="PromptModal()">Valid IDs</a></span>.</p>
                            </div>
                        </div>
                    </div>

                    <div class="card">

                        <div class="card-body">
                            <div class="form-title">
                                Attach photo of your Signature here
                            </div>
                            <br />
                            <div class="form-group">
                                <div class="left-align-label">
                                    <label>Signature:</label>
                                </div>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" data-classification="SIGNATURE" id="signature">
                                    <label class="custom-file-label" for="signature">Attach photo here</label>
                                </div>
                            </div>
                            <div class="form-group compact-notes">
                                <h6>Note:</h6>
                                <p>•Provide three (3) Signatures, it must match the signature from your attached Valid ID.</p>
                            </div>
                            <%-- <div class="form-group">
                                <div class="input">
                                    <button type="button" class="btn btn-primary" id="btnSave" onclick="SaveClick()">Save</button>
                                </div>
                            </div>--%>
                        </div>


                    </div>
                </div>
            </div>

        </section>
        <section class="content">
        </section>

    </div>
    <div class="modal fade" id="viewIDModal" style="z-index: 99999;" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">List of Valid ID</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

           
                    <table>
                        <tr>
                            <th>Number</th>
                            <th>ID Type</th>
                        </tr>
                        <tr>
                            <td>1.</td>
                            <td>Driver’s License</td>
                        </tr>
                        <tr>
                            <td>2.</td>
                            <td>UMID</td>
                        </tr>
                        <tr>
                            <td>3.</td>
                            <td>Philhealth ID</td>
                        </tr>
                        <tr>
                            <td>4.</td>
                            <td>Philippine Postal ID</td>
                        </tr>
                        <tr>
                            <td>5.</td>
                            <td>Passport</td>
                        </tr>
                        <tr>
                            <td>6.</td>
                            <td>SSS ID</td>
                        </tr>
                        <tr>
                            <td>7.</td>
                            <td>PRC ID</td>
                        </tr>
                        <tr>
                            <td>8.</td>
                            <td>Voter’s ID</td>
                        </tr>
                        <tr>
                            <td>9.</td>
                            <td>Pagibig ID</td>
                        </tr>
                        <tr>
                            <td>10.</td>
                            <td>Philsys ID / Ephil ID</td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="Scripts/Profile_Quartenary.js"></script>
    <script>
        const PromptModal = () => {
            $('#viewIDModal').modal('show'); // 'termsModal' should be the id of your modal element
        }

    </script>
</asp:Content>

