bsCustomFileInput.init();
const params = new Proxy(new URLSearchParams(window.location.search), {
    get: (searchParams, prop) => searchParams.get(prop),
});

const allowedExtension = ['image/jpeg', 'image/jpg', 'image/png'];
var files = $('.custom-file-input');
const Bussiness = $('#txtBussiness');
const NatureOfWork = $('#txtNatureOfWork');
const MonthlyIncome = $('#txtMonthlyIncome');
const CharacterReference = $('#txtCharacterReference');
const CoGuarantor = $('#txtCoGuarantor');
const CoGuarantorNumber = $('#txtCoGuarantorNumber');

const ddlInstallmentPlan = $("#ddlInstallmentPlan");
const ddlTenure = $("#ddlTenure");
let tenureOptions = [];

//const GetData = (config) => {
//    config.type ??= "POST"
//    config.data ??= "";
//    return $.ajax({
//        type: config.type,
//        url: config.url,
//        data: config.data,
//        contentType: "application/json; charset=utf-8",
//        dataType: "json",
//        success: data => { }

//    });
//};
const Ajax = (config) => {
    config.type ??= "POST";
    config.data ??= "";
    config.processData ??= true;
    config.contentType ??= "application/json;charset=utf-8";
    config.dataType ??= "json";
    config.cache ??= true;

    return $.ajax({
        type: config.type,
        url: config.url,
        data: config.data,
        cache: config.cache,
        processData: config.processData,
        contentType: config.contentType,
        dataType: config.dataType,
        success: data => { },
        error: function (err) {
            alert(err);
        }
    });
};
var userId = params.USERID;

$(document).ready(() => {
    Step1();
});
function Step1() {

    Ajax(
        { url: "Home_Loan_Primary.aspx/GetLoanAmounts" }).then(e => {
            let data = JSON.parse(e.d);
            const dropdown = $("#ddlLoanAmount");
            data.map(item => {

                dropdown.append($(`<option value="${item.LOAN_PLAN_ID}"data-loan="${item.LOAN_PLAN_ID}"data-interest="${item.INTEREST}" data-fee="${item.PROCESS_FEE}">${item.AMOUNT}</option>`));

            });
            updateRateAndFee();

        });
    Ajax({
        url: "Home_Loan_Primary.aspx/GetBranchList"
    }).then(e => {
        let data = JSON.parse(e.d);
        const dropdown = $("#ddlBranch");
        data.map(item => {
            dropdown.append($(`<option value="${item.ID}">${item.BRANCH}</option>`));
        });
    });
    Ajax({
        url: "Home_Loan_Primary.aspx/GetPlanAndTenure",
    }).then(e => {
        let data = JSON.parse(e.d);

        // Store the received data on the client-side
        const installmentPlans = data.InstallmentPlans;
        tenureOptions = data.TenureOptions;

       

        ddlInstallmentPlan.append($('<option value="">Please Select</option>'));
        // Populate the ddlInstallmentPlan dropdown
        installmentPlans.forEach(item => {
            ddlInstallmentPlan.append($(`<option value="${item.INSTALLMENT_ID}">${item.INSTALLMENT_PLAN}</option>`));
        });
        // Add an event handler for the onchange event of ddlInstallmentPlan
       
    });
    ddlInstallmentPlan.on("change", (e) => {
   

        const selectedInstallmentPlan = parseInt(e.target.selectedOptions[0].value);
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
    // Handle change event of "Loan Amount" dropdown
    $('#ddlLoanAmount').change(() => {
        updateRateAndFee();
        /*     SetDefaultValue();*/
    });
    $('#ddlTenure').change(() => {
        updatePaymentAndNo();
    });
}


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
    const loan = $('#lblloanId').text();
    console.log(loan, userId);
   /* window.location = "Home_Loan_Primary.aspx?USERID=" + userId + "&LOAN=" + loan;*/
}