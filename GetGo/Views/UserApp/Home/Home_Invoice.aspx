<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Invoice.aspx.cs" Inherits="Views_UserApp_Home_Home_Invoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
          .box {
            --mask: radial-gradient(4.47px at 50% 6.00px,#000 99%,#0000 101%) calc(50% - 8px) 0/16px 51% repeat-x, radial-gradient(4.47px at 50% -2px,#0000 99%,#000 101%) 50% 4px/16px calc(51% - 4px) repeat-x, radial-gradient(4.47px at 50% calc(100% - 6.00px),#000 99%,#0000 101%) calc(50% - 8px) 100%/16px 51% repeat-x, radial-gradient(4.47px at 50% calc(100% + 2.00px),#0000 99%,#000 101%) 50% calc(100% - 4px)/16px calc(51% - 4px) repeat-x;
            -webkit-mask: var(--mask);
            mask: var(--mask);
            background-color: #1B5B6B;
            width: 100%;
            color: ghostwhite;
        }

        .loan-summary {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            padding: 8px;
            font-size:12px;
            text-align: left; /* Align headers to the left */
        }

            td.data {
                text-align: right; /* Align data cells to the right */
            }

        .dashed {
            border-top: 1px dashed; /* Add a dashed border on top of the cell */
        }

        .bg-loan-primary {
            background-color: #1B5B6B;
            color: ghostwhite;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
       <div class="wrapper">
                <section class="content-header">
                </section>
                <section class="content">
                    <div class="container-fluid">
                        <div class="row justify-content-center">
                            <div class="col-md-6">
                                <div class="card" style="background-color: #bcf4e4; color: #1B5B6B; border: none; box-shadow: none;">
                                    <div class="text-center">
                                        <img src="../../../Resources/dist/img/10_1.png" width="150" />
                                        <h6>That was too easy!</h6>
                                        <h4>Wait for 2-3 working days for your loan confirmation.</h4>
                                    </div>


                                </div>
                                <div class="card" style="background-color: #bcf4e4; border: none; box-shadow: none;">
                                    <div class="card-body box">

                                        <div class="form-group">
                                            <h6>Transaction Summary</h6>
                                            <h6 style="border: dashed 1px"></h6>
                                        </div>
                                        <div class="form-group">
                                            <table class="loan-summary">
                                                <tr>
                                                    <th>Total Loan Amount:</th>
                                                    <td class="data" id="LoanAmount">Data1</td>
                                                    <!-- Data for Total Loan Amount -->
                                                </tr>
                                                <tr>
                                                    <th>Interest Rate:</th>
                                                    <td class="data" id="interestRate">Data2</td>
                                                    <!-- Data for Interest Rate -->
                                                </tr>
                                                <tr>
                                                    <th>Process Fee:</th>
                                                    <td class="data" id="processFee">Data3</td>
                                                    <!-- Data for Process Fee -->
                                                </tr>
                                                <tr>
                                                    <th>Late Fee (Implemented if past due date*):</th>
                                                    <td class="data" id="lateFee">1%</td>
                                                    <!-- Data for Late Fee -->
                                                </tr>
                                                <tr>
                                                    <th>Daily Payment:</th>
                                                    <td class="data" id="dailyPayment">Data5</td>
                                                    <!-- Data for Daily Payment -->
                                                </tr>
                                                <tr>
                                                    <th>Loan Tenure:</th>
                                                    <td class="data" id="loanTenure">Data6</td>
                                                    <!-- Data for Loan Tenure -->
                                                </tr>
                                                <tr>
                                                    <th>Start Date:</th>
                                                    <td class="data" id="startDate">Data7</td>
                                                    <!-- Data for Start Date -->
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
                                    </div>
                                </div>
                                <div class="card bg-loan-primary">
                                    <div class="card-body ">
                                        <h6>NOTE: Transactions will be credited during Monday - Friday only!</h6>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" Runat="Server">
    <script>
        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        const getCurrentDate = () => {
            const currentDate = new Date();
            const options = { day: '2-digit', month: 'long', year: '2-digit' };
            return currentDate.toLocaleDateString('en-US', options).replace(',', '');
        }
        const TotalLoanAmount = params.LOAN;
        const InterestRate = params.INTEREST;
        const ProcessFee = params.PROCESSFEE;
        const DailyPayment = params.DAILY;
        const LoanTenure = params.LOANTENURE;
        const Branch = params.BRANCH;
        const LOANID = params.LOANID;

       

   
        $(document).ready(() => {
            const formattedDate = getCurrentDate();
          
            $('#LoanAmount').text(TotalLoanAmount);
            $('#processFee').text(ProcessFee);
            $('#interestRate').text(InterestRate);
            $('#dailyPayment').text(DailyPayment);
            $('#loanTenure').text(LoanTenure);
            $('#startDate').text(formattedDate);
            $('#branchName').text(Branch);
            $('#loanID').text(LOANID);

        });
    </script>
</asp:Content>

