<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Default.aspx.cs" Inherits="Views_UserApp_Home_Home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;700&display=swap" rel="stylesheet">
    <link href="../../../Resources/custom-css/home-default.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="wrapper">
        <section class="content-header">

            <div class="container-fluid">
                <div class="col-lg-12" style="text-align: left">
                    <br />
                    <h1 style="font-size: 48px"><b style="color: #2b9348">Get</b><b style="color: #da2c38">Go</b>
                    </h1>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row justify-content-center">

                    <div class="col-md-4">
                        <div class="card">
                            <div class="card-body text-left" style="padding-bottom: 5px !important; padding-top: 15px !important;">

                                <h5 id="lblBranch">Branch Name</h5>

                            </div>

                        </div>
                        <div class="card">
                            <div class="card-body" style="padding-bottom: 0 !important; padding-top: 0 !important;">
                                <div class="form-group">
                                </div>
                                <div class="form-group">
                                    <div class="input">
                                        <label for="name">Loan List</label>
                                        <select autocomplete="off" id="ddlLoanAmount" class="form-control input variant-1  select-1 "></select>
                                    </div>

                                </div>
                                <div class="form-group row justify-content-between">
                                    <div>
                                        <label for="name" id="lblPaymentHeader">Payment</label><br />
                                        <label style="font-size: 48px" id="lblPayment">₱ -</label>
                                    </div>
                                    <div class="current-loan-status">
                                        <button type="button" class="badge-1 color-1 text-b " data-toggle="modal" data-target="#modal-current-loan" id="see-more">See More</button>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="card-sample" style="background-color: white; border-radius: 10px; padding-left: 1px;">

                            <div class="form-group row">
                                <div class="loan-date-box" style="width: 98%">
                                    <div class="loan-date">
                                        <label class="date-label">Start Date</label><br />
                                        <label class="date-value">-</label><br />

                                    </div>
                                    <div class="loan-date next-due">
                                        <label class="date-label">Next Due Date</label><br />
                                        <label class="date-value">-</label><br />

                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="card">
                            <div class="borrowed-card" style="border-radius: 10px;">
                                <div class="text-left">
                                    <div class="amount-padding" style="padding: 10px;">
                                        <span class="badge badge-info color-1 text-b">Amount Borrowed:</span>₱<label id="lblAmountBorrowed">-</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="form-group">
                                addtional text here
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div class="modal fade" id="modal-current-loan" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="wrapper">
                        <section class="content-header">
                        </section>
                        <section class="content">
                            <div class="container-fluid">
                                <div class="col-lg-12">

                                    <div class="card">
                                        <div class="header-label">
                                            <label>Current Loans</label>
                                        </div>
                                        <div class="card-body loan-container">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modal-loan-details" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="padding-left: 2px !important; padding-right: 2px !important">
                    <div class="wrapper">
                        <section class="content-header">
                        </section>
                        <section class="content">
                            <div class="container-fluid">
                                <div class="col-lg-12">

                                    <div class="card" style="padding-left: 0 !important">
                                        <div class="header-label">
                                            <label>Loans Details</label>
                                        </div>
                                        <div class="card-body box">
                                            <div class="form-group custom-loan-title">
                                                <label style="font-size: 30px" id="LoanAmount">3000</label>
                                                <br />

                                                <label>Total Loan Amount</label>

                                            </div>
                                            <div class="form-group" style="border-radius: 10px; background-color: #E9E9E9;">
                                                <h6>Transaction Summary</h6>

                                            </div>
                                            <div class="form-group">
                                                <table class="loan-summary">
                                                    <tr>
                                                        <th style="width: 50%">Start Date:</th>
                                                        <td class="data" id="startDate">Data7</td>
                                                        <!-- Data for Start Date -->
                                                    </tr>
                                                    <tr>
                                                        <th>Loan Tenure:</th>
                                                        <td class="data" id="loanTenure">Data6</td>
                                                        <!-- Data for Loan Tenure -->
                                                    </tr>
                                                    <tr>
                                                        <th>Process Fee:</th>
                                                        <td class="data" id="processFee">Data3</td>
                                                        <!-- Data for Process Fee -->
                                                    </tr>
                                                    <tr>
                                                        <th>Interest Rate:</th>
                                                        <td class="data" id="interestRate">Data2</td>
                                                        <!-- Data for Interest Rate -->
                                                    </tr>
                                                    <tr>
                                                        <th>Late Fee (Implemented if past due date*):</th>
                                                        <td class="data" id="lateFee">1%</td>
                                                        <!-- Data for Late Fee -->
                                                    </tr>


                                                    <tr>
                                                        <th>Transaction Branch Name:</th>
                                                        <td class="data" id="branchName">Data8</td>
                                                        <!-- Data for Branch Name -->
                                                    </tr>
                                                    <tr>
                                                        <th class="dashed">Loan ID:</th>
                                                        <td class="data dashed" id="loanID">Data9</td>
                                                        <!-- Data for Loan ID -->
                                                    </tr>
                                                </table>

                                            </div>
                                            <div class="form-group" style="border-radius: 10px; background-color: #E9E9E9;">
                                                <h6>Monthly Repayment Details</h6>

                                            </div>
                                            <div class="loan-details-list">
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <div class="modal fade" id="modal-repayment" style="display: none;" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content" style="background-color: #bcf4e4">
                <div class="modal-header">

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <section class="content">
                        <div class="container-fluid">
                            <div class="row justify-content-center">
                                <div class="col-md-12">


                                    <div class="card">
                                        <div class="card-body">
                                            <br />
                                            <div class="form-group">
                                                <div class="header-label-2">

                                                    <label class=" color-1">Select Method</label>
                                                </div>
                                            </div>
                                            <div class="form-group row justify-content-around">
                                                <img src="../../../Resources/dist/img/additional/branch.png" width="80" height="50" class="clickable-image" onclick="ModeOfRepayment('branch')" />
                                                <img src="../../../Resources/dist/img/additional/gcash.png" width="80" height="50" class="clickable-image" onclick="ModeOfRepayment('gcash')" />
                                                <img src="../../../Resources/dist/img/additional/bank.png" width="80" height="50" class="clickable-image" onclick="ModeOfRepayment('bank')" />
                                            </div>

                                        </div>

                                    </div>

                                    <div class="card" id="repayment-details">
                                        <br />
                                        <div class="card-body">
                                            <div class="branch-repayment" id="branch-repayment">
                                                <div class="form-group">
                                                    <div class="header-label-2">
                                                        <label class=" color-1">Attach Receipt Here</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <img src="../../../Resources/dist/img/additional/branch.png" width="90" height="70" />
                                                    <p style="font-size: 14px;">Once paid at your chosen branch, kindly attach your transaction receipt here.</p>
                                                </div>
                                            </div>

                                            <div class="bank-repayment" id="bank-repayment">
                                                <div class="form-group">
                                                    <div class="header-label-2">
                                                        <label class=" color-1">Send Your Payment</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <img src="../../../Resources/dist/img/additional/bank.png" width="90" height="70" />
                                                    <div class="input">
                                                        <input type="text" required="" autocomplete="off" class="form-control input" value="1684 620 00999" readonly="readonly" style="text-align: center">
                                                    </div>
                                                    <div class="input" style="text-align: center">
                                                        <input type="text" required="" autocomplete="off" class="form-control input" value="JOSHUA CABADIN" readonly="readonly" style="text-align: center">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="gcash-repayment" id="gcash-repayment">
                                                <div class="form-group">
                                                    <div class="header-label-2">
                                                        <label class=" color-1">Send Your Payment</label>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <img src="../../../Resources/dist/img/additional/gcash.png" width="90" height="70" />
                                                </div>
                                                <div class="form-group">
                                                    <img src="../../../Resources/dist/img/additional/gcash-01.png" width="152" height="213" />
                                                </div>
                                            </div>

                                            <div class="form-group">
                                                <div class="custom-file">
                                                    <input type="file" class="custom-file-input" data-classification="sjksgfdlk" id="receipt">
                                                    <label class="custom-file-label" style="font-size: 12px" for="receipt">Attach receipt here</label>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <button class="btn btn-success" type="button" style="width: 100%; border-radius: 10px;" onclick="ConfirmPayment()">Confirm</button>
                                            </div>
                                        </div>

                                    </div>

                                </div>
                            </div>

                        </div>
                    </section>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">

    <script>

        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        const user_id = params.USERID;
        const startTime = new Date().getTime();
        const ddlLoanAmount = $("#ddlLoanAmount");
        const lblPayment = $("lblPayment");
        let tenureOptions = [];
        let installementPlans = [];
        let branchLists = [];
        let loanLists = [];
        let loanRecords = [];
        let loanDetailsRecords = [];
        $(() => {
            //$('#modal-loan-details').modal("show");
            InitializeInfo();
            $("#see-more").click(() => {
                // Call the CurrentLoans function when the button is clicked
                CurrentLoans();
            });



        });

        const InitializeInfo = () => {
            GetData({
                url: "Home_Default.aspx/GetUserLoanInformation",
                data: JSON.stringify({
                    user_id: user_id
                })
            }).then(e => {
                let data = JSON.parse(e.d);
                loanRecords = data.LoanRecords;
                loanDetailsRecords = data.LoanDetailsRecords;
                //console.log(loanRecords);
                //console.log(loanDetailsRecords);

                loanRecords.map(item => {
                    ddlLoanAmount.append($(`<option value="${item.LOAN_ID}"data-loan="${item.AMOUNT}"data-interest="${item.INTEREST}" data-fee="${item.PROCESSING_FEE}">${item.AMOUNT}</option>`));

                })


                updateSelectedLoan();


                // Display the total loan amount in lblAmountBorrowed

                const endTime = new Date().getTime();
                const duration = endTime - startTime; // Calculate the duration in milliseconds
                console.log(`Operation took ${duration} milliseconds.`);
            });
            ddlLoanAmount.change(() => {
                updateSelectedLoan();
            });


        }
        const updateSelectedLoan = () => {
            const selectedLoanID = $('#ddlLoanAmount option:selected').val();
            const selectedLoanDetail = loanDetailsRecords.find(item => item.LOAN_ID === parseInt(selectedLoanID) && !item.IS_COMPLETE);
            //console.log(selectedLoanID, selectedLoanDetail)
            const selectedLoanRecord = loanRecords.find(item => item = item.LOAN_ID === parseInt(selectedLoanID))

            if (selectedLoanDetail) {
                // Display the data from LoanDetailsRecords
                $('#lblPayment').text("₱ " + selectedLoanDetail.AMOUNT);
                $('#StartDate').text(selectedLoanDetail.START_DATE);
                $('#NextDueDate').text(selectedLoanDetail.DUE_DATE);

                $('#lblBranch').text(selectedLoanRecord.BRANCH + " Branch");
                $('#lblPaymentHeader').text(selectedLoanRecord.INSTALLMENT_PLAN + " PAYMENT");

                let totalLoanAmount = 0;

                ddlLoanAmount.find('option').each(function () {
                    const loanAmount = parseFloat($(this).data('loan'));
                    if (!isNaN(loanAmount)) {
                        totalLoanAmount += loanAmount;
                    }
                });
                $('#lblAmountBorrowed').text(totalLoanAmount.toFixed(2));

                InitializeLoanDate({ start: selectedLoanDetail.START_DATE, due: selectedLoanDetail.DUE_DATE });
            } else {
                // Handle the case where no matching loan detail is found
                $('#lblPayment').text('-');
                $('#StartDate').text('No data available');
                $('#NextDueDate').text('No data available');
            }


        }
        const InitializeLoanDate = (config) => {

            const startDate = FormatDate(config.start);

            // Format the Next Due Date
            const nextDueDate = FormatDate(config.due);
            $(".loan-date-box").empty();
            // Create the HTML string
            const html = `
             
                     <div class="loan-date">
                         <label class="date-label">Start Date</label><br />
            <label class="date-value">${startDate.day}</label><br />
            <label class="date-month">${startDate.month} ${startDate.year}</label>
                    
                     </div>
                     <div class="loan-date next-due">
                         <label class="date-label">Next Due Date</label><br />
                           <label class="date-value">${nextDueDate.day}</label><br />
                             <label class="date-month">${nextDueDate.month} ${nextDueDate.year}</label>
                      
                     </div>
               `;

            // Append the HTML to the parent div
            $(".loan-date-box").append(html);
        }
        const FormatDate = (dateString) => {

            const date = new Date(dateString);
            const day = date.getDate();
            const month = date.toLocaleString('default', { month: 'short' });
            const year = date.getFullYear();
            return {
                day: day,
                month: month,
                year: year,
            };
        }

        const CurrentLoans = () => {
            let html = '';

            // Iterate through loanRecords and loanDetailsRecords
            for (let i = 0; i < loanRecords.length; i++) {
                const loanRecord = loanRecords[i];
                const loanDetail = loanDetailsRecords.find(detail => detail.LOAN_ID === loanRecord.LOAN_ID);
                if (loanDetail) {
                const startDate = FormatDate(loanDetail.START_DATE);
                var params = {
                    amount: loanRecord.AMOUNT,
                    tenure: loanRecord.TENURE,
                    processfee: loanRecord.PROCESSING_FEE,
                    interestrate: loanRecord.INTEREST_RATE,
                    startdate: startDate.day + " " + startDate.month + " " + startDate.year,
                    branch: loanRecord.BRANCH,
                    loanid: loanRecord.LOAN_ID

                };
               
                    html += `
                <div class="current-loans">
                    <div class="form-group row custom-form-group justify-content-between">
                        <div class="current-loan custom-current-loan">
                            <label class="loan-amount">  ${loanRecord.AMOUNT}</label><br />
                            <label class="loan-start-date">Start on ${startDate.day} ${startDate.month} ${startDate.year} </label><br />
                            <label class="loan-due-date">₱ ${loanDetail.AMOUNT} ${loanRecord.INSTALLMENT_PLAN}</label>
                        </div>
                        <div class="current-loan-button">
                           <button type="button" data-toggle="modal" data-target="#modal-loan-details" onclick='CurrentDetails(${JSON.stringify(params)});' class="see-details"><i class="fas fa-arrow-circle-right"></i></button>
                        </div>
                    </div>
                </div>
            `;
                }
            }

            // Append the generated HTML to the container
            $(".loan-container").html(html);
        }
        const CurrentDetails = (config) => {
            $(".loan-details-list").empty();
            let html = '';
            console.log(config.loanid);


            const filteredDetails = loanDetailsRecords
                .filter(detail => detail.LOAN_ID === config.loanid)
                .sort((b, a) => new Date(b.START_DATE) - new Date(a.START_DATE));


            $('#LoanAmount').text("₱ " + config.amount);
            $('#processFee').text(config.processfee);
            $('#interestRate').text(config.interestrate);
            $('#loanTenure').text(config.tenure);
            $('#startDate').text(config.startdate);
            $('#branchName').text(config.branch);
            $('#loanID').text(config.loanid);

            // Iterate through filtered loanDetailsRecords
            for (let i = 0; i < filteredDetails.length; i++) {
                const loanDetail = filteredDetails[i];
                const startDate = FormatDate(loanDetail.DUE_DATE);

                // Determine the status based on ISComplete
                const status = loanDetail.IS_COMPLETE ? 'PAID' : 'UNPAID';

                html += `
            <div class="separator-line">
                <div class="form-group row justify-content-between" style="border-bottom: 1px solid #E9E9E9;">
                    <div class="current-loan custom-current-details">
                        <label>${i + 1}/${filteredDetails.length}</label>,
                        <label>${loanDetail.AMOUNT}</label><br />
                        <label class="loan-due-date">Due Date: ${startDate.day} ${startDate.month} ${startDate.year}</label>
                    </div>
                    <div class="current-loan-status">
                        <label>${status}</label>
                    </div>
                </div>
            </div>
        `;
            }

            // Append the generated HTML to the container
            $(".loan-details-list").html(html);
            console.log(html);
        }


        const ModeOfRepayment = (category) => {
            $('#repayment-details').show();
            if (category === "branch") {
                $(".branch-repayment").show();
                $(".bank-repayment, .gcash-repayment").hide();
                $('.custom-file-input').attr("data-classification", "BRANCH");
            } else if (category === "gcash") {
                $(".gcash-repayment").show();
                $(".branch-repayment, .bank-repayment").hide();
                $('.custom-file-input').attr("data-classification", "GCASH");
            } else if (category === "bank") {
                $(".bank-repayment").show();
                $(".branch-repayment, .gcash-repayment").hide();
                $('.custom-file-input').attr("data-classification", "BANK");
            }
/*            alert(category);*/
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


        const RepaymentModal = () => {
            $('#modal-repayment').modal('show');
            $('#repayment-details').hide();
        }
        const ConfirmPayment = () => {
            const selectedLoanID = $('#ddlLoanAmount option:selected').val();
            const selectedLoanDetail = loanDetailsRecords.find(item => item.LOAN_ID === parseInt(selectedLoanID) && !item.IS_COMPLETE);
            const LoanID = selectedLoanDetail.LOAN_DETAILS_ID;
            console.log(loanDetailsRecords);


            var files = $('.custom-file-input');
            files.each(function (index, fileInput) {
                var formData = new FormData();
                formData.append("file", fileInput.files[0]);
                formData.append("classification", fileInput.getAttribute("data-classification"));
                upload(formData, LoanID);


            });
        }
        const upload = (files, loanID) => {

            $.ajax({
                type: 'post',
                url: '../Home/Handlers/FileUpload.ashx?USERID=' + params.USERID + '&LOANID=' + loanID,
                data: files,
                cache: false,
                processData: false,
                contentType: false,
                success: function (e) {
                    $('#modal-repayment').modal('hide');
                    alert('success');

                },
                error: function (xhr, status, error) {
                    if (xhr.status === 413) {
                        alert('Request Entity Too Large: The file you are trying to upload is too large.');
                    } else {
                        alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText + '-' + error);
                    }       
       
                }

            })
        }


    </script>
</asp:Content>
