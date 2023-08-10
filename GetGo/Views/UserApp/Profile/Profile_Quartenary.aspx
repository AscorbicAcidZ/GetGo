<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Profile/Page.master" AutoEventWireup="true" CodeFile="Profile_Quartenary.aspx.cs" Inherits="Views_UserApp_Profile_Profile_Quartenary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .left-align-label {
            text-align: left;
        }

        /* Styles for form title */
        .form-title {
            background-color: #F2F2F2;
            border-radius: 20px;
            font-weight: bold;
        }


        /* Styles for buttons */
        .btn-primary {
            background-color: #007BFF;
            border-color: #007BFF;
        }

        .compact-notes {
            font-size:10px;
            margin-bottom:unset;
            color:#F2F2F2;
            padding: 0; /* Remove padding */
            color: black;
            text-align: left; /* Align text to the left */
        }
        .compact-notes p{
              margin-bottom:unset;
        }

        /* Style for Valid IDs link */
        .valid-ids-link {
            text-decoration: underline;
            cursor: pointer;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="col-lg-12">
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
                                    <label class="custom-file-label" for="frontface" >Attach photo here</label>
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
                                <p>• View list of <span class="valid-ids-link">Valid IDs</span>.</p>
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
                            <div class="form-group">
                                <div class="input">
                                    <button type="button" class="btn btn-primary" id="btnSave">Save</button>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>

        </section>
        <section class="content">
        </section>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="Scripts/Profile_Quartenary.js"></script>
</asp:Content>

