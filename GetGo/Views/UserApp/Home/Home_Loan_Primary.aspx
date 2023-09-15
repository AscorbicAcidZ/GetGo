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
                                    <select required="" autocomplete="off" id="txtLoanTenure" class="form-control input  variant-1  select-1">
                                    </select>
                                </div>
                                <p class="align-right">Process fee:<label id="lblFee">0</label>%</p>
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
    <script>
        //$(document).ready(() => {

        //  // Populate "Loan Amount" dropdown
        //  populateDropdown({
        //            url: "Home_Loan_Primary.aspx/GetLoanAmounts",
        //            dropdownSelector: $('#ddlLoanAmount')
        //     });
        //});

        //const populateDropdown = (config) => {
        //    $.ajax({
        //        type: "POST",
        //        url: config.url,
        //        contentType: "application/json; charset=utf-8",
        //        dataType: "json",
        //        success: (data) => {
        //            const dropdown = config.dropdownSelector;
        //            data.d.forEach((item) => {
        //                dropdown.append($(`<option value="${item.ID}">${item.AMOUNT || item.INSTALLMENT_PLAN || item.TENURE}</option>`));
        //            });
        //        },
        //    });
        //};
        $(document).ready(() => {

            GetData({ url: "Home_Loan_Primary.aspx/GetLoanAmounts" }).then(e => {
                let data = JSON.parse(e.d);
                const dropdown = $("#ddlLoanAmount");
                data.map(item => {
                    dropdown.append($(`<option value="${item.ID}" data-interest="${item.INTEREST}" data-fee="${item.PROCESS_FEE}">${item.AMOUNT}</option>`));

                });
                updateRateAndFee();

            });
            GetData({ url: "Home_Loan_Primary.aspx/GetBranchList", data: JSON.stringify({id:"1"})
}).then(e => {
                let data = JSON.parse(e.d);
                const dropdown = $("#ddlBranch");
                data.map(item => {
                    dropdown.append($(`<option value="${item.ID}">${item.BRANCH}</option>`));
                });
            });    
            // Handle change event of "Loan Amount" dropdown
            $('#ddlLoanAmount').change(() => {
                updateRateAndFee();
            });
        });


        const GetData = (config) => {
            config.type ??= "POST"
            config.data ??= "";
            return $.ajax({
                type: config.type,
                url: config.url,
                data: config.data,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: data => { }

            });
        };
        const updateRateAndFee = () => {
            const selectedOption = $('#ddlLoanAmount option:selected');
            const interest = selectedOption.data('interest');
            const fee = selectedOption.data('fee');
            $('#lblRate').text(interest);
            $('#lblFee').text(fee);
        };



    </script>
</asp:Content>



