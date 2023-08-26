<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Loan_Secondary.aspx.cs" Inherits="Views_UserApp_Home_Home_Loan_Secondary" %>

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
                                <div class="input">
                                    <input type="text" required="" autocomplete="off" id="txtUserID" class="form-control input" style="display: none;">
                                    <label for="name">Enter Loan Amount</label>
                                    <input type="text" required="" autocomplete="off" id="txtLoanAmount" class="form-control input">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Nature of Work</label>
                                    <select autocomplete="off" id="ddlNOW" class="form-control input select-1 ">
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
                                    <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_SIGNATURE" id="frontface">
                                    <label class="custom-file-label" for="frontface">Attach Signature here</label>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_SIGNATURE" id="frontface">
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
                                    <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_SIGNATURE" id="frontface">
                                    <label class="custom-file-label" for="frontface">Attach proof of receipt here</label>
                                </div>
                            </div>
                              <div class="form-group">

                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" data-classification="CO_GUARANTOR_SIGNATURE" id="frontface">
                                    <label class="custom-file-label" for="frontface">Attach collateral photo here</label>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

