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
                                    <select required="" autocomplete="off" id="ddlTenure" class="form-control input  variant-1  select-1">
                                    </select>
                                </div>
                                <p class="align-right" style="display:none;"><label id="lblFee">0</label><label id="lblloanId">0</label></p>
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script>
        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        var userId = params.USERID;
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

            GetData(
                { url: "Home_Loan_Primary.aspx/GetLoanAmounts" }).then(e => {
                    let data = JSON.parse(e.d);
                    const dropdown = $("#ddlLoanAmount");
                    data.map(item => {
                     
                        dropdown.append($(`<option value="${item.LOAN_PLAN_ID}"data-loan="${item.LOAN_PLAN_ID}"data-interest="${item.INTEREST}" data-fee="${item.PROCESS_FEE}">${item.AMOUNT}</option>`));

                    });
                    updateRateAndFee();

                });
            GetData({
                url: "Home_Loan_Primary.aspx/GetBranchList"
            }).then(e => {
                let data = JSON.parse(e.d);
                const dropdown = $("#ddlBranch");
                data.map(item => {
                    dropdown.append($(`<option value="${item.ID}">${item.BRANCH}</option>`));
                });
            });
            GetData({
                url: "Home_Loan_Primary.aspx/GetPlanAndTenure",
            }).then(e => {
                let data = JSON.parse(e.d);

                // Store the received data on the client-side
                const installmentPlans = data.InstallmentPlans;
                const tenureOptions = data.TenureOptions;

                const ddlInstallmentPlan = $("#ddlInstallmentPlan");
                const ddlTenure = $("#ddlTenure");

                ddlInstallmentPlan.append($('<option value="">Please Select</option>'));
                // Populate the ddlInstallmentPlan dropdown
                installmentPlans.forEach(item => {
                    ddlInstallmentPlan.append($(`<option value="${item.INSTALLMENT_ID}">${item.INSTALLMENT_PLAN}</option>`));
                });
                // Add an event handler for the onchange event of ddlInstallmentPlan
                ddlInstallmentPlan.on("change", () => {

                    const selectedInstallmentPlan = parseInt(ddlInstallmentPlan.val());
                    //console.log("Selected Installment Plan:", selectedInstallmentPlan);

                    // Filter and populate the ddlTenure dropdown based on the selected installment plan
                    ddlTenure.empty();

                    // Filter the tenureOptions based on the selectedInstallmentPlan
                    const filteredTenureOptions = tenureOptions.filter(item => item.INSTALLMENT_PLAN === selectedInstallmentPlan);
                    ddlTenure.append($('<option value="">Please select</option>'));
                    // Populate the ddlTenure dropdown with filtered options
                    filteredTenureOptions.forEach(item => {
                        ddlTenure.append($(`<option value="${item.TENURE_ID}">${item.TENURE}</option>`));
                    });
                });
            });
            // Handle change event of "Loan Amount" dropdown
            $('#ddlLoanAmount').change(() => {
                updateRateAndFee();
           /*     SetDefaultValue();*/
            });
            $('#ddlTenure').change(() => {
                updatePaymentAndNo();
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
            const loan = selectedOption.data('loan');
            const fee = selectedOption.data('fee');
            $('#lblRate').text(interest);
            $('#lblloanId').text(loan);
            $('#lblFee').text(fee);
        };
        const updatePaymentAndNo = () => {

            const ddlLoanAmount = $('#ddlLoanAmount').find(":selected").text();
            const Tenure = parseInt($('#ddlTenure').find(":selected").text());
            const ddlInstallmentPlan = $('#ddlInstallmentPlan').find(":selected").text();
            // Get the interest rate from lblRate text
            const LoanAmount = parseInt(ddlLoanAmount);

            const interest = parseFloat($('#lblRate').text()) / 100;

            // Calculate Repayment
            const TotalInterest = LoanAmount * interest;
            const LoanContract = LoanAmount + TotalInterest;
            const Repayment = LoanContract / Tenure;

            $('#lblRepayment').text(Repayment);
            if (ddlInstallmentPlan == "MONTHLY") {
                $('#lblNoOfRepayment').text(Tenure + " Month/s");

            }
            else if (ddlInstallmentPlan == "Weekly") {
                $('#lblNoOfRepayment').text(Tenure + " Week/s");
            }
            else {
                $('#lblNoOfRepayment').text(Tenure + " Day/s");
            }

        };

        const SetDefaultValue = () => {
            
            $('#lblNoOfRepayment').text("N/A");
            $('#lblRepayment').text("N/A");
        };

        function ApplyNow() {
            const amount= $('#lblloanId').text();
            window.location = "Home_Loan_Primary.aspx?USERID=" + userId + "&LOAN=" + amount ;
        }
    </script>
</asp:Content>



