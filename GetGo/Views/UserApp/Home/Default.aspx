<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Views_UserApp_Home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <nav>
        <div class="nav nav-pills nav-fill" id="nav-tab" role="tablist" style="background-color:white;">
            <a class="nav-link active" id="step1-tab" data-toggle="tab" href="#step1">Step 1</a>
            <a class="nav-link" id="step2-tab" data-toggle="tab" href="#step2">Step 2</a>
            <a class="nav-link" id="step3-tab" data-toggle="tab" href="#step3">Step 3</a>
            <a class="nav-link" id="step4-tab" data-toggle="tab" href="#step4">Step 4</a>
        </div>
    </nav>
    <div class="tab-content py-4" id="nav-tabContent">
        <div class="tab-pane fade show active" id="step1">

            <div class="wrapper">
                <%--    <section class="content-header">
            <div class="container-fluid">
                <div class="col-lg-12" style="text-align: center">
                    <br />
                    <h1 style="font-size: 48px"><b style="color: #2b9348">Get</b><b style="color: #da2c38">Go</b>
                    </h1>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>--%>
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
                                            <p>
                                                Credit Limit:<label>P </label>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <input type="text" required="" autocomplete="off" id="txtUserID" class="form-control input" style="display: none;">
                                        <div class="input">

                                            <label for="name">Loan Amount</label>

                                            <select autocomplete="off" id="ddlLoanAmount" class="form-control input variant-1  select-1 ">
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
                                            <select required="" autocomplete="off" id="ddlTenure" class="form-control input  variant-1  select-1">
                                            </select>
                                        </div>
                                        <p class="align-right" style="display: none;">
                                            <label id="lblFee">0</label><label id="lblloanId">0</label>
                                        </p>
                                        <p class="align-right">Interest rate:<label id="lblRate">0</label>%</p>
                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Branch Name</label>
                                            <select type="text" required="" autocomplete="off" id="ddlBranch" class="form-control input  select-1"></select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="row">

                                            <div class="card-body color-1">
                                                <h6>Repayment</h6>
                                                <p>
                                                    <label id="lblRepayment">N/A</label>
                                                </p>
                                            </div>
                                            <div class="card-body color-1 b-1">
                                                <h6>No of Repayment</h6>
                                                <p>
                                                    <label id="lblNoOfRepayment">N/A</label>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="tab-pane fade" id="step2">
            <h4>Step 2</h4>

        </div>
        <div class="tab-pane fade" id="step3">

            <div class="wrapper">
                <section class="content">
                    <div class="container-fluid">
                        <div class="col-lg-12">

                            <div class="card">
                                <div class="header-label">
                                    <label>Loan Application</label>
                                </div>
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="input">
                                            <%--<input type="text" required="" autocomplete="off" id="txtUserID" class="form-control input" style="display: none;">--%>
                                            <label for="name">Bussiness</label>
                                            <input type="text" required="" autocomplete="off" id="txtBussiness" class="form-control input">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Nature of Work</label>
                                            <input type="text" required="" autocomplete="off" id="txtNatureOfWork" class="form-control input">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Monthly Gross Income</label>
                                            <input type="text" required="" autocomplete="off" id="txtMonthlyIncome" class="form-control input">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Character Reference</label>
                                            <input type="text" required="" autocomplete="off" id="txtCharacterReference" class="form-control input">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Co Guarantor</label>
                                            <input type="text" required="" autocomplete="off" id="txtCoGuarantor" class="form-control input">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Phone Number of Co Guarantor</label>
                                            <input type="text" required="" autocomplete="off" id="txtCoGuarantorNumber" class="form-control input">
                                        </div>
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <div class="header-label-2">
                                            <label class=" color-1">Signature and Valid ID</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group compact-notes">
                                            <h6>Note:</h6>
                                            <p>•Three signatures in one photo.</p>
                                            <p>•Co-guarantor included in the photo. (Selfie).</p>
                                        </div>

                                    </div>
                                    <div class="form-group">

                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_SIGNATURE" id="co_guarantor_signature">
                                            <label class="custom-file-label" for="signature">Attach Signature here</label>
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_VALID_ID" id="co_guarantor_valid_id">
                                            <label class="custom-file-label" for="frontface">Attach Valid ID here</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group compact-notes">
                                            <p>• View list of <span class="valid-ids-link">Valid IDs</span>.</p>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="header-label-2">
                                            <label class=" color-1">Collateral Register</label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group compact-notes">
                                            <h6>Note:</h6>
                                            <p>•The worth of the collateral must be higher than the loan.</p>
                                            <p>•The collateral will be taken from the 3rd missed payment.</p>
                                        </div>

                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Type Of Collateral</label>
                                            <select autocomplete="off" id="ddlTypeCollateral" class="form-control input select-1 ">
                                                <option selected="selected">Please Select</option>
                                                <option>1</option>
                                                <option>2</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Name of Collateral</label>
                                            <input type="text" required="" autocomplete="off" id="txtNameOfCollateral" class="form-control input">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Description</label>
                                            <input type="text" required="" autocomplete="off" id="txtDescription" class="form-control input variant-1">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="form-group compact-notes">
                                            <p>•Indicate other details about the collateral. (Ex. the year model acquisition of the car) .</p>
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" data-classification="PROOF_RECEIPT" id="proof_receipt">
                                            <label class="custom-file-label" for="proof_receipt">Attach proof of receipt here</label>
                                        </div>
                                    </div>
                                    <div class="form-group">

                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" data-classification="COLLATERAL_PHOTO" id="collateral_photo">
                                            <label class="custom-file-label" for="collateral_photo">Attach collateral photo here</label>
                                        </div>
                                        <div class="form-group compact-notes">
                                            <p>•Borrower included in the photo .</p>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
        <div class="tab-pane fade" id="step4">
            <h4>Step 4</h4>
            <div class="wrapper">
                <section class="content-header">
                </section>
                <section class="content">
                    <div class="container-fluid">
                        <div class="col-lg-12">

                            <div class="card">
                                <div class="header-label">
                                    <label>Contract</label>
                                </div>
                                <div class="card-body">
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-body">
                                    <div class="form-group">
                                        <div class="input">
                                            <label for="name">Signature</label>
                                            <img src="../../../Resources/dist/img/default-150x150.png" id="image_upload_preview" class="form-control input variant-2" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="Scripts/loan.js"></script>

</asp:Content>

