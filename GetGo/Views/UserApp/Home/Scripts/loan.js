const params = new Proxy(new URLSearchParams(window.location.search), {
    get: (searchParams, prop) => searchParams.get(prop),
});

const allowedExtension = ['image/jpeg', 'image/jpg', 'image/png'];
var files = $('.custom-file-input');
const imagesBaseUrl = "../../../UploadedFiles/";
const LoadingInfo = $("#LoadingInfo");
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
const NameOfCollateral = $('#txtNameOfCollateral');
const Description = $('#txtDescription');
const Remaining = $('#lblRemain');



var loaderContainer = $('#loader-container');
let tenureOptions = [];
let installementPlans = [];
let branchLists = [];
let loanLists = [];


$(document).ready(() => {
    bsCustomFileInput.init();
    GetLoanDetails();
   
    disableStep2FormControls();
    ProfileDetails();
});

/*const remainingCreditLimit = 9000;*/

const GetLoanDetails = () => {
   
    GetData(
        { url: "ApplyLoan.aspx/GetLoanDetails" }).then(e => {
            let data = JSON.parse(e.d);

            loanLists = data.LoanLists;
            installmentPlans = data.InstallmentPlans;
            tenureOptions = data.TenureOptions;
            branchLists = data.BranchLists;
            console.log(data);
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
       
           
            });
            ddlTenure.change(() => {
                updatePaymentAndNo();
            });

            updateRateAndFee();
            GetCreditLimit();
        });
    ddlLoanAmount.change(() => {
        updateRateAndFee();
        SetDefaultValue();
        ddlTenure.empty();
    });
    ddlTenure.change(() => {
        updatePaymentAndNo();
    });
}

const GetCreditLimit = () => {
    GetData({
        url: "ApplyLoan.aspx/GetCreditLimit", data: JSON.stringify({ userid: params.USERID })
    }).then(e => {
        let data = JSON.parse(e.d);
        const result = data.CreditLimits;
        const CreditLimit = result[0].CREDIT_LIMIT;
        const TotalLoan = result[0].TOTAL_LOAN;


        const total = (parseInt(CreditLimit) - parseInt(TotalLoan))
        Remaining.text(total);
        CreditLimitValidation();
        $('#lblCreditLimit').text(CreditLimit);


    });
}
const CreditLimitValidation = () => {
    var remainingCreditLimit = parseInt(Remaining.text());
    console.log(remainingCreditLimit);
    if (parseInt(remainingCreditLimit) == "0") {
        // Disable all options in ddlLoanAmount
        ddlLoanAmount.prop('disabled', true);
    } else if (remainingCreditLimit === 3000) {
        // Enable 3000 option, disable others
        ddlLoanAmount.prop('disabled', false);
        ddlLoanAmount.find('option').prop('disabled', true); // Disable all options
        ddlLoanAmount.find('option[value="1"]').prop('disabled', false); // Enable 3000 option
    } else if (remainingCreditLimit === 6000) {
        // Enable 3000 and 6000 options, disable others
        ddlLoanAmount.prop('disabled', false);
        ddlLoanAmount.find('option').prop('disabled', true); // Disable all options
        ddlLoanAmount.find('option[value="1"]').prop('disabled', false); // Enable 3000 option
        ddlLoanAmount.find('option[value="2"]').prop('disabled', false); // Enable 6000 option


    } else if (remainingCreditLimit === 9000) {
        // Enable 3000, 6000, and 9000 options, disable others
        ddlLoanAmount.prop('disabled', false);
        ddlLoanAmount.find('option').prop('disabled', true); // Disable all options
        ddlLoanAmount.find('option[value="1"]').prop('disabled', false); // Enable 3000 option
        ddlLoanAmount.find('option[value="2"]').prop('disabled', false); // Enable 6000 option
        ddlLoanAmount.find('option[value="3"]').prop('disabled', false); // Enable 9000 option
    } else if (remainingCreditLimit === 12000) {
        // Enable 3000, 6000, and 9000 options, disable others
        ddlLoanAmount.prop('disabled', false);
        ddlLoanAmount.find('option').prop('disabled', true); // Disable all options
        ddlLoanAmount.find('option[value="1"]').prop('disabled', false); // Enable 3000 option
        ddlLoanAmount.find('option[value="2"]').prop('disabled', false); // Enable 6000 option
        ddlLoanAmount.find('option[value="3"]').prop('disabled', false); // Enable 9000 option
        ddlLoanAmount.find('option[value="4"]').prop('disabled', false); // Enable 9000 option 
    }
    else {
        console.log('credit validation')

    }



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
        //beforeSend: function () {
        //    loaderContainer.show();
        //},
        //complete: function () {
        //    loaderContainer.hide();
        //},
        success: data => { },
        error: function (xhr, status, error) {
            if (xhr.status === 413) {
                alert('Request Entity Too Large: The file you are trying to upload is too large.');
            } else {
                alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
            }
            $('#ERROR').text('Error: ' + error);
            loaderContainer.hide();
        }


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

//step 2
const ProfileDetails = () => {
    var items = {
        INPUT: params.USERID
    }
    // Make an AJAX request to fetch the user details
    $.ajax({
        url: '../Profile/Profile_Primary.aspx/GetUserDetails',
        type: "POST",
        data: JSON.stringify({ item: items }),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (response) {
            var userDetails = response.d;
            // Populate the textboxes with the retrieved user details
            var userDetails = JSON.parse(response.d);
            // Format the date of birth

            if (!userDetails[0].DATE_OF_BIRTH) {
                // If empty, set it to the current date
                var currentDate = new Date().toISOString().split('T')[0];
                $('#txtDOB').val(currentDate);
            } else {
                // If not empty, format the date of birth
                var dateOfBirth = new Date(userDetails[0].DATE_OF_BIRTH).toISOString().split('T')[0];
                $('#txtDOB').val(dateOfBirth);
            }
            $('#txtDOB').val(new Date(userDetails[0].DATE_OF_BIRTH).toISOString().split('T')[0]);

            if (!userDetails[0].PROFILE_IMAGE) {
                // If empty, set it to the current date
                $('#preview_profile').attr('src', '../../../Resources/dist/img/default-150x150.png');

            } else {

                $('#preview_profile').attr('src', imagesBaseUrl + userDetails[0].PROFILE_IMAGE);
            }
            console.log(userDetails[0].PROFILE_IMAGE);
            //Populate the textboxes with the retrieved user details
            ;
            $('#txtFirstName').val(userDetails[0].FIRST_NAME);
            $('#txtLastName').val(userDetails[0].LAST_NAME);
            $('#txtMiddleName').val(userDetails[0].MIDDLE_NAME);

            $('#txtEmail').val(userDetails[0].EMAIL_ADDRESS);
            $('#txtMobileNumber').val(userDetails[0].CONTACTNO);
            $('#txtSex').val(userDetails[0].SEX);
            $('#txtMaritalStatus').val(userDetails[0].MARITAL_STATUS);
            $('#txtStreetName').val(userDetails[0].STREET_NO);
            $('#txtBarangay').val(userDetails[0].BARANGAY);
            $('#txtCity').val(userDetails[0].CITY);
            $('#txtProvince').val(userDetails[0].PROVINCE);
            $('#txtRegion').val(userDetails[0].REGION);
            $('#txtPostalCode').val(userDetails[0].ZIPCODE);

            if (!userDetails[0].PROFILE_IMAGE) {
                // If empty, set it to the current date
                $('#preview_signature').attr('src', '../../../Resources/dist/img/default-150x150.png');

            } else {

                $('#preview_signature').attr('src', imagesBaseUrl + userDetails[0].SIGNATURE_);
            }

        },
        error: function (xhr, status, error) {
            if (xhr.status === 413) {
                alert('Request Entity Too Large: The file you are trying to upload is too large.');
            } else {
                alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
            }
            $('#ERROR').text('Error: ' + error);
            loaderContainer.hide();
        }
    });
}


const filesArray = [];

const Save = () => {
    if (parseInt(Remaining) === 0) {

    }
    else {
        FormValidation();
    }

}
const FormValidation = () => {
    const activeStep = $(".nav-link.active");
    const activeTab = activeStep.attr("id");
    const activeContentId = activeTab.replace("-tab", "");

    if (activeTab === "step1-tab") {

        if (!validateStep1()) {
            return;
        }
    } else if (activeTab === "step2-tab") {

        if (!validateStep2()) {
            return;
        }
    } else if (activeTab === "step3-tab") {

        if (!validateStep3()) {
            return;
        }
    }
    else if (activeTab === "step4-tab") {

        SaveFiles();
    }

    const nextStep = getNextStep(activeContentId);

    // Remove "active" class from the current content and tab
    $("#" + activeContentId).removeClass("show active");
    activeStep.removeClass("active");

    // Add "active" class to the next content and tab
    $("#" + nextStep).addClass("show active");
    $("#" + nextStep + "-tab").addClass("active");

};
const validateStep1 = () => {

    $('.error-message').remove();
    let isValid = true;

    if (ddlLoanAmount.val() === null) {
        ddlLoanAmount.addClass('is-invalid');
        ddlLoanAmount.after('<div class="error-message">Please enter Loan Amount.</div>');
        isValid = false;
    }

    if ($('#ddlInstallmentPlan').val() === null) {
        $('#ddlInstallmentPlan').addClass('is-invalid');
        $('#ddlInstallmentPlan').after('<div class="error-message">Please select Installment Plan.</div>');
        isValid = false;
    }

    if ($('#ddlTenure').val() === null) {
        $('#ddlTenure').addClass('is-invalid');
        $('#ddlTenure').after('<div class="error-message">Please select Tenure.</div>');
        isValid = false;
    }

    if (isValid) {
        $('.is-invalid').removeClass('is-invalid');
        $('.error-message').remove();
    }

    return isValid;
};
const validateStep2 = () => {
    // Perform Step 2 validation here
    // Return true if validation passes, false otherwise
    return true; // Replace with your validation logic
};
const validateStep3 = () => {
    let isValid = true;
    if (Bussiness.val() === '') {
        Bussiness.addClass('is-invalid');
        Bussiness.after('<div class="error-message">Please enter Business.</div>');
        isValid = false;
    }

    if (NatureOfWork.val() === '') {
        NatureOfWork.addClass('is-invalid');
        NatureOfWork.after('<div class="error-message">Please enter Nature of Work.</div>');
        isValid = false;
    }

    if (MonthlyIncome.val() === '') {
        MonthlyIncome.addClass('is-invalid');
        MonthlyIncome.after('<div class="error-message">Please enter Monthly Gross Income.</div>');
        isValid = false;
    }

    if (CharacterReference.val() === '') {
        CharacterReference.addClass('is-invalid');
        CharacterReference.after('<div class="error-message">Please enter Character Reference.</div>');
        isValid = false;
    }

    if (CoGuarantor.val() === '') {
        CoGuarantor.addClass('is-invalid');
        CoGuarantor.after('<div class="error-message">Please enter Co Guarantor.</div>');
        isValid = false;
    }

    if (CoGuarantorNumber.val() === '') {
        CoGuarantorNumber.addClass('is-invalid');
        CoGuarantorNumber.after('<div class="error-message">Please enter Co Guarantor Number.</div>');
        isValid = false;
    }
    if ($('#co_guarantor_signature').val() === '') {
        $('#co_guarantor_signature').addClass('is-invalid');
        $('#co_guarantor_signature').siblings('.custom-file-label').addClass('is-invalid');
        $('#co_guarantor_signature').after('<div class="error-message">Please attach Signature.</div>');
        isValid = false;
    }

    if ($('#co_guarantor_valid_id').val() === '') {
        $('#co_guarantor_valid_id').addClass('is-invalid');
        $('#co_guarantor_valid_id').siblings('.custom-file-label').addClass('is-invalid');
        $('#co_guarantor_valid_id').after('<div class="error-message">Please attach Valid ID.</div>');
        isValid = false;
    }

    if (NameOfCollateral.val() === '') {
        NameOfCollateral.addClass('is-invalid');
        NameOfCollateral.after('<div class="error-message">Please enter Collateral Name.</div>');
        isValid = false;
    }


    if (Description.val() === '') {
        Description.addClass('is-invalid');
        Description.after('<div class="error-message">Please enter Description.</div>');
        isValid = false;
    }

    if ($('#proof_receipt').val() === '') {
        $('#proof_receipt').addClass('is-invalid');
        $('#proof_receipt').siblings('.custom-file-label').addClass('is-invalid');
        $('#proof_receipt').after('<div class="error-message">Please attach proof of receipt</div>');
        isValid = false;
    }

    if ($('#collateral_photo').val() === '') {
        $('#collateral_photo').addClass('is-invalid');
        $('#collateral_photo').siblings('.custom-file-label').addClass('is-invalid');
        $('#collateral_photo').after('<div class="error-message">Please attach collateral photo.</div>');
        isValid = false;
    }
    if (isValid) {
        $('.is-invalid').removeClass('is-invalid');
        $('.error-message').remove();
    }

    return isValid;
};
const disableStep2FormControls = () => {
    // Select all form controls within the Step 2 tab
    const step2FormControls = $('#step2 :input');

    // Disable each form control
    step2FormControls.prop('disabled', true);
};

// Function to determine the next step dynamically
const getNextStep = (currentStep) => {
    const steps = ["step1", "step2", "step3", "step4"];
    const currentIndex = steps.indexOf(currentStep);
    if (currentIndex < steps.length - 1) {
        return steps[currentIndex + 1];
    }
    return currentStep; // Return the current step if it's the last step
};

//saving and uploading files
const SaveFiles = () => {
    loaderContainer.show();
    /* alert('fetching id')*/
    LoadingInfo.text('Dont close proccessing your request');
    let loanData = {
        USER_ID: params.USERID,
        LOAN_AMOUNT: ddlLoanAmount.val(),
        INSTALLMENT_ID: ddlInstallmentPlan.val(),
        TENURE_ID: ddlTenure.val(),
        BRANCH: ddlBranchList.val(),
        BUSSINESS: Bussiness.val(),
        NATURE_OF_WORK: NatureOfWork.val(),
        INCOME: MonthlyIncome.val(),
        CHARACTER_REFERENCE: CharacterReference.val(),
        CO_GUARANTOR: CoGuarantor.val(),
        CO_PHONE_NO: CoGuarantorNumber.val(),
        NAME_OF_COLLATERAL: NameOfCollateral.val(),
        DESCRIPTION: Description.val(),
    }
    files.each(function (index, fileInput) {
        var formData = new FormData();
        formData.append("file", fileInput.files[0]);
        formData.append("classification", fileInput.getAttribute("data-classification")); // Append the correct classification
        filesArray.push(formData);
    });
    /* alert('Checking Attached photo');*/
    LoadingInfo.text('Checking attached file');
    GetData({
        url: "ApplyLoan.aspx/GetLoanID",
        data: JSON.stringify({
            items: loanData
        })
    }).then(e => {
        let result = JSON.parse(e.d);
        /*       alert('uploadarray goes');*/

        LoadingInfo.text('Verifying attached file');

        upload(filesArray, result[0].LOAN_ID);
    }
    );

};

$('.custom-file-input').change(function () {
    if (!allowedExtension.includes(this.files[0]['type'])) {
        alert('Only (jpeg, jpg, png) file extensions can be uploaded!')
        // Clear only the label associated with this input
        $(this).val('');
        $(this).siblings('.custom-file-label').text('Attach photo here');
    }
});
const upload = (filesArray, loanID) => {

    //for (const value of files.values()) {
    //    console.log(value);
    //}
    // Create a new FormData object to store all files
    const allFilesFormData = new FormData();

    // Append each FormData object to the new FormData
    filesArray.forEach(formData => {
        for (const [key, value] of formData.entries()) {
            allFilesFormData.append(key, value);
        }
    });
    //for (const value of allFilesFormData.values()) {
    //    console.log(value);
    //}
    LoadingInfo.text('Processing your loan');
    /*alert("Uploading now to file server ");*/
    $.ajax({
        type: 'post',
        url: '../Home/Handlers/FileUpload.ashx?USERID=' + params.USERID + '&LOANID=' + loanID,
        data: allFilesFormData,
        cache: false,
        processData: false,
        contentType: false,
        success: function (e) {
            /*       alert('success');*/
            const USERID = params.USERID;
            const LOAN = parseInt(ddlLoanAmount.find(":selected").text());
            const INTEREST = $('#lblRate').text()
            const PROCESSFEE = $('#lblFee').text()
            const DAILY = $('#lblRepayment').text()
            const LOANTENURE = $('#lblNoOfRepayment').text()
            const BRANCH = ddlBranchList.find(":selected").text();
            const LOANID = loanID;

            loaderContainer.hide();

            $('#ERROR').text(e, "error")
            const url = `Home_Invoice.aspx?USERID=${USERID}&LOAN=${LOAN}&INTEREST=${INTEREST}&PROCESSFEE=${PROCESSFEE}&DAILY=${DAILY}&LOANTENURE=${LOANTENURE}&BRANCH=${BRANCH}&LOANID=${LOANID}&RESPONSE=success`;

            window.location = url;

        },
        error: function (xhr, status, error) {
            if (xhr.status === 413) {
                alert('Request Entity Too Large: The file you are trying to upload is too large.');
            } else {
                alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);
            }
            $('#ERROR').text('Error: ' + error);
            loaderContainer.hide();
        }

    })


}
