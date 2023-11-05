<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Withdrawal.aspx.cs" Inherits="Views_UserApp_Home_Home_Withdrawal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <nav>
        <div class="nav nav-pills nav-fill" id="nav-tab" role="tablist" style="background-color: white;">
            <a class="nav-link active" id="step1-tab" data-toggle="tab" href="#step1">Step 1</a>
            <a class="nav-link" id="step2-tab">Step 2</a>
            <a class="nav-link" id="step3-tab">Step 3</a>


        </div>
        <div class="tab-content py-4" id="nav-tabContent">
            <div class="tab-pane fade show active" id="step1">
                <div class="wrapper">

                    <section class="content">
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-5">

                                    <div class="card">
                                        <div class="card-body">
                                            <br />
                                            <div class="form-group">
                                                <div class="header-label-2">

                                                    <label class=" color-1">Available Loan Credit:</label>
                                                </div>
                                            </div>
                                            <div class="form-group row justify-content-center" style="font-weight: bold">
                                                <h1>₱ </h1>
                                                <h1 id="lblCreditLimit"></h1>
                                            </div>

                                        </div>

                                    </div>

                                    <div class="card">
                                        <div class="card-body">
                                            <br />
                                            <div class="form-group">
                                                <div class="header-label-2">

                                                    <label class=" color-1">Withdrawal Method</label>
                                                </div>
                                            </div>
                                            <div class="form-group row justify-content-around">
                                                <img src="../../../Resources/dist/img/additional/branch.png" width="80" height="50" class="clickable-image" onclick="ModeOfRepayment('branch')" />
                                                <img src="../../../Resources/dist/img/additional/bank.png" width="80" height="50" class="clickable-image" onclick="ModeOfRepayment('bank')" />
                                                <img src="../../../Resources/dist/img/additional/gcash.png" width="80" height="50" class="clickable-image" onclick="ModeOfRepayment('gcash')" />

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
                <div class="row justify-content-center">
                    <div class="col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="header-label-2">
                                    <label class=" color-1">Widthrawal Details</label>
                                </div>
                                <div class="branch-repayment" id="branch-withdraw">

                                    <div class="form-group">
                                        <img src="../../../Resources/dist/img/additional/branch.png" width="90" height="70" />
                                    </div>
                                </div>

                                <div class="bank-repayment" id="bank-withdraw">

                                    <div class="form-group">
                                        <img src="../../../Resources/dist/img/additional/bank.png" width="90" height="70" />
                                        <div class="input">
                                            <label>Enter Bank Account Number</label>
                                            <input type="text" required="" autocomplete="off" class="form-control input numeric-input" id="txtAccountNumber" style="text-align: center">
                                         <div id="accountNumberError" style="color: red; font-size:8px;"></div>
                                        </div>
                                        <div class="input" style="text-align: center">
                                            <label>Enter Bank Account Name</label>
                                            <input type="text" required="" autocomplete="off" class="form-control input" id="txtAccountName" style="text-align: center">
                                        </div>
                                        <div class="input" style="text-align: center">
                                            <label>Name of the Bank</label>
                                            <select autocomplete="off" id="ddlSelectedBank" class="form-control input variant-1  select-1 ">
                                                <option>BPI</option>
                                                <option>Landbank ATM Online</option>
                                                <option>BDO</option>
                                                <option>RCBC</option>
                                                <option>Metrobank</option>
                                                <option>PNB Online</option>
                                                <option>Robinsons Bank Online Banking</option>
                                                <option>China Bank</option>
                                                <option>Bank of Commerce</option>
                                            </select>

                                        </div>

                                    </div>
                                </div>

                                <div class="gcash-repayment" id="gcash-withdraw">

                                    <div class="form-group">
                                        <img src="../../../Resources/dist/img/additional/gcash.png" width="90" height="70" />
                                    </div>
                                    <div class="form-group">
                                        <div class="input" style="text-align: center">
                                            <label>Enter GCASH Number</label>
                                            <input type="text" required="" autocomplete="off" class="form-control input numeric-input" id="txtGcashNumber" style="text-align: center">
                                        </div>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade " id="step3">
                <div class="wrapper">

                    <section class="content">
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-5">


                                    <div class="card">
                                        <div class="card-body">
                                            <br />
                                            <div class="form-group">
                                                <div class="header-label-2">

                                                    <label class=" color-1">Withdrawal Method</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <div class="content-withdraw  row justify-content-start">
                                                    <div class="bank-image" style="padding-right: 10px">
                                                        <img src="../../../Resources/dist/img/additional/bank.png" width="80" height="50" class="clickable-image" />

                                                    </div>
                                                    <div class="gcash-image" style="padding-right: 10px">

                                                        <img src="../../../Resources/dist/img/additional/gcash.png" width="80" height="50" class="clickable-image" />
                                                    </div>

                                                    <div class="withdraw-details text-left" style="font-size: 10px;">
                                                        <label style="font-size: 15px;" id="masked">2321321</label><br />
                                                        <label>• Minimum withdrawal amount: ₱100 </label>
                                                        <br />
                                                        <label>• Maximum withdrawal amount: ₱500,000</label><br />
                                                        <label>• Funds should arrive in 1 - 3 working days</label><br />
                                                    </div>

                                                </div>

                                            </div>
                                            <div class="form-group">
                                                <div class="input">
                                                    <label>Enter Amount</label>
                                                    <input type="text" required="" autocomplete="off" class="form-control input variant-1 numeric-input" style="text-align: center" id="txtWithdraw">
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

        </div>
    </nav>
    <div class="modal fade" id="CashModal"  style="z-index:99999;" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">You selected cash</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                  
                   <p style="text-align:center;">
                   Go to the branch to that you have applied for your loan and claim the money in cash..
                   </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script>
        const accountNumberInput = document.getElementById('txtAccountNumber');
        const errorDiv = document.getElementById('accountNumberError');

        accountNumberInput.addEventListener('input', function () {
            const accountNumber = accountNumberInput.value.trim();

            if (/^\d{12,17}$/.test(accountNumber)) {
                // Valid input (12 to 17 numeric characters)
                errorDiv.textContent = '';
            } else {
                // Invalid input
                errorDiv.textContent = 'Account number must be between 12 and 17 numeric characters.';
            }
        });
    </script>
    <script>
        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        let CreditLimit = "";
        let TotalLoan = "";
        $(() => {

            GetData({
                url: "ApplyLoan.aspx/GetCreditLimit", data: JSON.stringify({ userid: params.USERID })
            }).then(e => {


                let data = JSON.parse(e.d);
                const result = data.CreditLimits;
                CreditLimit = result[0].CREDIT_LIMIT;
                 TotalLoan = result[0].TOTAL_LOAN;
                $('#lblCreditLimit').text(CreditLimit);

            }
            );
        });



        let method = "";
        const ModeOfRepayment = (category) => {
            method = category;
            $('#repayment-details').show();
            if (category === "branch") {
                $('#CashModal').modal('show');
                return;

            } else if (category === "gcash") {
                $(".gcash-repayment, .gcash-image").show();
                $(".branch-repayment, .bank-repayment, .bank-image").hide();
                $("#bank").hide();

            } else if (category === "bank") {
                $(".bank-repayment, .bank-image").show();
                $(".branch-repayment, .gcash-repayment, .gcash-image").hide();
            }
            FormValidation();
            console.log(category);
        }

        const FormValidation = () => {
            const activeStep = $(".nav-link.active");
            const activeTab = activeStep.attr("id");
            const activeContentId = activeTab.replace("-tab", "");


            if (activeTab === "step2-tab") {
                const accountno = $('#txtAccountNumber').val();
                const masked = "*".repeat(10) + accountno.substring(10);
                $('#masked').text("(" + masked + ")");

            } else if (activeTab === "step3-tab") {
                if (method === "bank") {

                    config = {
                        USERID: params.USERID,
                        CreditLimit: CreditLimit,
                        bankNo: $('#txtAccountNumber').val(),
                        bankName: $('#ddlSelectedBank').find(":selected").text(),
                        AccountName: $('#txtAccountName').val(),
                        Withdrawal: $('#txtWithdraw').val(),
                        Method: "BANK TRANSFER",
                    }
                    TransactDetails(config);


                } else if (method === "gcash") {
                    config = {
                        USERID: params.USERID,
                        CreditLimit: CreditLimit,
                        bankNo: $('#txtGcashNumber').val(),
                        bankName: "GCASH",
                        AccountName: params.USERID,
                        Withdrawal: $('#txtWithdraw').val(),
                        Method: "GCASH TRANSFER",
                    }
    /*                console.log(config)*/
                    TransactDetails(config);
                }

            }
            else {

            }

            const nextStep = getNextStep(activeContentId);

            // Remove "active" class from the current content and tab
            $("#" + activeContentId).removeClass("show active");
            activeStep.removeClass("active");

            // Add "active" class to the next content and tab
            $("#" + nextStep).addClass("show active");
            $("#" + nextStep + "-tab").addClass("active");
        }
        const Save = () => {
            const activeStep = $(".nav-link.active");
            const activeTab = activeStep.attr("id");

            if (activeTab === "step1-tab") {
                alert('Please select Method')
                return;
            }

            FormValidation()


        }
        const TransactDetails = (config) => {

            GetData({
                url: "Home_Withdrawal.aspx/SaveUserRequest", data: JSON.stringify({

                    userid: config.USERID,
                    availablecredit: config.CreditLimit,
                    accountno: config.bankNo,
                    bankname: config.bankName,
                    accountname: config.AccountName,
                    withdrawal: config.Withdrawal,
                    method: config.Method
                })
            }).then(e => {


                let data = JSON.parse(e.d);
                const LOANID = data[0].WITHDRAWAL_ID;

                const url = `Home_Invoice_withdrawal.aspx?USERID=${config.USERID}&LOAN=${TotalLoan}&WITHDRAWAL=${config.Withdrawal}&LOANID=${LOANID}&RESPONSE=success`;
         
                window.location = url;
            }
            );
        }
  
        const getNextStep = (currentStep) => {
            const steps = ["step1", "step2", "step3"];
            const currentIndex = steps.indexOf(currentStep);
            if (currentIndex < steps.length - 1) {
                return steps[currentIndex + 1];
            }
            return currentStep; // Return the current step if it's the last step
        };
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

                }


            });

        };
        
    </script>
</asp:Content>

