<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Profile/Page.master" AutoEventWireup="true" CodeFile="Home_LoanApplication.aspx.cs" Inherits="Views_UserApp_Home_Home_LoanApplication" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .variant-1 {
            height: calc(3.25rem + 2px);
        }

        .select-1 {
            font-size: 100%;
            border-radius: 10px;
            width: 100%;
            background-color: #f2f2f2;
            border: none;
            padding: 0.5em;
        }

        .color-1 {
            background-color: #f2f2f2;
        }

        .b-1 {
            border-left: solid #C4C4C4
        }

        .text-b {
            color: black;
        }
        .align-right {
    text-align: right;
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
                            <label>Loan Application</label>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="align-right">
                                    <p>Credit Limit:<label>P 000</label></p>
                                </div>
                                <div class="input">
                                    <input type="text" required="" autocomplete="off" id="txtUserID" class="form-control input" style="display: none;">
                                    <label for="name">Enter Loan Amount</label>
                                    <input type="text" required="" autocomplete="off" id="txtLoanAmount" class="form-control input variant-1">
                                </div>
                                <div class="align-right">
                                    <span class="badge badge-info color-1 text-b">Quick Add:</span>
                                    <button type="button" class="badge badge-info color-1 text-b">P 2000</button>
                                    <button type="button" class="badge badge-info  color-1 text-b ">P 5000</button>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Installment Plan</label>
                                    <select autocomplete="off" id="ddlInstallmentPlan" class="form-control input variant-1  select-1 ">
                                        <option selected="selected">Please Select</option>
                                        <option>Monthly</option>
                                        <option>Daily</option>
                                        <option>Meow</option>
                                        <option>Meow2</option>
                                        <option>Meow3</option>
                                        <option>Meow4</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Loan Tenure</label>
                                    <select required="" autocomplete="off" id="txtLoanTenure" class="form-control input  variant-1  select-1"></select>
                                    
                                </div>

                                <p class="align-right">Interest rate:5%</p>
                            </div>
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Branch Name</label>
                                    <select type="text" required="" autocomplete="off" id="txtBranch" class="form-control input  select-1"></select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="row">

                                    <div class="card-body color-1">
                                        <h6>Repayment</h6>
                                        <p>N/A</p>
                                    </div>
                                    <div class="card-body color-1 b-1">
                                        <h6>No of Repayment</h6>
                                        <p>N/A</p>
                                    </div>
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
</asp:Content>

