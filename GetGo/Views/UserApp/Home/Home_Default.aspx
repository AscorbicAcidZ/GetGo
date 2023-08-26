<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Default.aspx.cs" Inherits="Views_UserApp_Home_Home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            background-color: #bcf4e4;
            font-family: 'Nunito', sans-serif;
        }

        .card {
            color: black;
            border-radius: 20px;
        }

        .wrapper {
            /* Add your wrapper styles here */
        }

        .content-header {
            /* Add your content-header styles here */
        }

        .container-fluid {
            /* Add your container-fluid styles here */
        }

        .card-body-small {
            padding: 0.55rem;
            height: 130px;
        }

        .element-large {
   
            height: 110px;
            width: 50%;
        }

        .red-card {
            background-color: #da2c38;
            border-radius: 10px;
            color: white;
        }

        .center-align {
            text-align: center;
        }

        .label-below {
            font-size: 42px;
        }

        /* Add other styles as needed */
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
                        <div class="card-body">
                            <div class="form-group">
                                <h5>Branch Name</h5>
                                LIPA CITY
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <h5>Monthly Payment</h5>
                            <h1 style="font-size: 32px; font-weight: bolder;">₱ 0.00</h1>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body card-body-small center-align">
                            <div class="row">
                                <div class="card-body element-large">
                                    <h5>Start Date</h5>
                                    <label class="label-below">-</label><br />

                                </div>
                                <div class="card-body element-large red-card">
                                    <h5>Due Date</h5>
                                    <label class="label-below">-</label><br />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body"></div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script>
        function RefreshTable() {
            location.reload();
        }
    </script>
</asp:Content>
