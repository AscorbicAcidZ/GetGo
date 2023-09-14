<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Loan_Primary.aspx.cs" Inherits="Views_UserApp_Home_Home_Loan_Primary" %>

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
                            <label>Loan Application</label>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <div class="align-right">
                                    <p>Credit Limit:<label>P 0000</label></p>
                                </div>
                            </div>
                               <div class="form-group">
                                     <input type="text" required="" autocomplete="off" id="txtUserID" class="form-control input" style="display: none;">
                                <div class="input">
                                    <label for="name">Loan Amount</label>
                                    <select autocomplete="off" id="ddlLoanAmount" class="form-control input variant-1  select-1 ">
                                        <option selected="selected">Please Select</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Installment Plan</label>
                                    <select autocomplete="off" id="ddlInstallmentPlan" class="form-control input variant-1  select-1 ">
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Loan Tenure</label>
                                    <select required="" autocomplete="off" id="txtLoanTenure" class="form-control input  variant-1  select-1">
                                             <option></option>
                                    </select>
                                
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

