const params = new Proxy(new URLSearchParams(window.location.search), {
    get: (searchParams, prop) => searchParams.get(prop),
});
bsCustomFileInput.init();
const allowedExtension = ['image/jpeg', 'image/jpg', 'image/png'];
var files = $('.custom-file-input');

const ddlLoanAmount = $("#ddlLoanAmount");
const ddlTenure = $("#ddlTenure");
const ddlInstallmentPlan = $("#ddlInstallmentPlan");
const ddlBranchList = $("#ddlBranch");

const Bussiness = $('#txtBussiness');
const NatureOfWork = $('#txtNatureOfWork');
const MonthlyIncome = $('#txtMonthlyIncome');
const CharacterReference = $('#txtCharacterReference');
const CoGuarantor = $('#txtCoGuarantor');
const CoGuarantorNumber = $('#txtCoGuarantorNumber');

let tenureOptions = [];
let installementPlans = [];
let branchLists = [];
let loanLists = [];


$(document).ready(() => {
    GetLoanDetails();
});


const GetLoanDetails = () => {

    GetData(
        { url: "Home_Loan_Primary.aspx/GetLoanDetails" }).then(e => {
            let data = JSON.parse(e.d);

            loanLists = data.LoanLists;
            installmentPlans = data.InstallmentPlans;
            tenureOptions = data.TenureOptions;
            branchLists = data.BranchLists;

            $('.select-1').each(function () {
                $(this).prepend('<option value="" selected="true" disabled="disabled">Please Select</option>');
            });
            loanLists.map(item => {
                ddlLoanAmount.append($(`<option value="${item.LOAN_PLAN_ID}"data-loan="${item.LOAN_PLAN_ID}"data-interest="${item.INTEREST}" data-fee="${item.PROCESS_FEE}">${item.AMOUNT}</option>`));
            });
            installmentPlans.map(item => {
                ddlInstallmentPlan.append($(`<option value="${item.INSTALLMENT_ID}">${item.INSTALLMENT_PLAN}</option>`));
            });
            branchLists.map(item => {
                ddlBranchList.append($(`<option value="${item.ID}">${item.BRANCH}</option>`));
            });

            ddlInstallmentPlan.on("change", (e) => {


                const selectedInstallmentPlan = parseInt(e.target.selectedOptions[0].value);
                //console.log("Selected Installment Plan:", selectedInstallmentPlan);

                // Filter and populate the ddlTenure dropdown based on the selected installment plan
                ddlTenure.empty();

                // Filter the tenureOptions based on the selectedInstallmentPlan
                const filteredTenureOptions = tenureOptions.filter(item => item.INSTALLMENT_PLAN === selectedInstallmentPlan);
                ddlTenure.append($('<option value="" selected="true" disabled="disabled">Please select</option>'));
                // Populate the ddlTenure dropdown with filtered options
                filteredTenureOptions.forEach(item => {
                    ddlTenure.append($(`<option value="${item.TENURE_ID}">${item.TENURE}</option>`));
                });
                SetDefaultValue();
            });
            ddlLoanAmount.change(() => {
                updateRateAndFee();
                /*     SetDefaultValue();*/
            });
            ddlTenure.change(() => {
                updatePaymentAndNo();
            });

            updateRateAndFee();

        });
}
const GetData = (config) => {

    config.type = config.type || "POST";
    config.data = config.data || "";
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

    const LoanAmount = parseInt(ddlLoanAmount.find(":selected").text());
    const Tenure = parseInt(ddlTenure.find(":selected").text());
    const InstallmentPlan = ddlInstallmentPlan.find(":selected").text();

    const interest = parseFloat($('#lblRate').text()) / 100;

    // Calculate Repayment
    const TotalInterest = LoanAmount * interest;
    const LoanContract = LoanAmount + TotalInterest;
    const Repayment = LoanContract / Tenure;

    $('#lblRepayment').text(Repayment);
    if (InstallmentPlan == "MONTHLY") {
        $('#lblNoOfRepayment').text(Tenure + " Month/s");

    }
    else if (InstallmentPlan == "Weekly") {
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
//end of step 1