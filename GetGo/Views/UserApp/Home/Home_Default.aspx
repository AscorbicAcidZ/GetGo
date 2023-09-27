<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Default.aspx.cs" Inherits="Views_UserApp_Home_Home_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
                            <div class="card-body text-left">
                                <div class="form-group">
                                    <h5>Branch Name</h5>
                                </div>
                            </div>

                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">

                                    <div class="align-center">
                                        <span class="badge badge-info color-1 text-b">Amount Borrowed:</span><label>P 32131.23</label>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="input">
                                        <label for="name">Loan List</label>
                                        <select autocomplete="off" id="ddlLoanAmount" class="form-control input variant-1  select-1 "></select>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="input">
                                        <label for="name">Payment</label>
                                        <input type="text" class="form-control variant-1" style="font-size: 30px" disabled="disabled" value="21312321" />
                                    </div>

                                </div>
                                <div class="form-group">
                                    <div class="align-right">
                                        <button type="button" class="badge badge-info color-1 text-b" data-toggle="modal" data-target="#modal-current-loan">See More</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group row">
                                    <div class="loan-date" style="width: 50%; height: 100px; border-radius: 10px;">
                                        <label style="line-height: 2;">Start Date</label><br />
                                        <label style="font-size: 30px; line-height: 0;">28</label><br />
                                        <label style="line-height: 0;">Mar 2023</label>
                                    </div>
                                    <div class="loan-date" style="background-color: red; width: 50%; height: 100px; border-radius: 10px; color: white">
                                        <label style="line-height: 2;">Next Due Date</label><br />
                                        <label style="font-size: 30px; line-height: 0;">28</label><br />
                                        <label style="line-height: 0;">Mar 2023</label>
                                    </div>
                                </div>
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
                                        <div class="card-body">
                                            <div class="form-group row custom-form-group justify-content-between">
                                                <div class="current-loan custom-current-loan">
                                                    <label class="loan-amount">3000</label><br />
                                                    <label class="loan-start-date">Started on 12/24/2023</label><br />
                                                    <label class="loan-due-date">157.5 due on everyday</label>
                                                </div>
                                                <div class="current-loan-button">
                                                    <button type="button" data-toggle="modal" data-target="#modal-loan-details"><i class="fas fa-arrow-circle-right"></i></button>
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
                <div class="modal-body">
                    <div class="wrapper">
                        <section class="content-header">
                        </section>
                        <section class="content">
                            <div class="container-fluid">
                                <div class="col-lg-12">

                                    <div class="card">
                                        <div class="header-label">
                                            <label>Loans Details</label>
                                        </div>
                                        <div class="card-body box">
                                            <div class="form-group custom-loan-title">
                                                <label style="font-size: 30px">₱ 3000</label>
                                                <br />

                                                <label>Total Loan Amount</label>

                                            </div>
                                            <div class="form-group" style="border-radius: 10px; background-color: #E9E9E9; color: ">
                                                <h6>Transaction Summary</h6>

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
                                            <div class="form-group" style="border-radius: 10px; background-color: #E9E9E9; color: ">
                                                <h6>Monthly Repayment Details</h6>

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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script>
        $(() => {
            $('#modal-loan-details').modal("show");
        });

        const populateTable = () => {
            // Sample data
            let html = "";
            let data = [
                { ID: 1, Payment: 23450, Start: "Aug 27,23", Due: "Aug 27,23" }

            ];

            var tableBody = $('#tableBody'); // Get the tbody element

            // Clear any existing content in the tbody
            tableBody.empty();
            data.map(item => {
                html += `
                        <tr data-id="${item.ID}">
                            <td>
                              
                    <div class=""
                                    <div class="item_code top">${item.Barcode_Serial}</div>
                                    <div class="item_desc top">${item.ItemDesc}</div>
                                    <div class="item_price bottom"> P <span>${item.Price}</span> </div>
                                    <div class="item_qty bottom"> <span data-qty="${item.Qty}">${item.Qty}</span> Qty </div>
                                </div>
                            </td>
                            <td class="legend_star">
                                <i class="fa fa-star"></i>
                            </td>
                        </tr>                        
                    `
            })

            tbody.append(html)
            // Loop through the data and create rows
            //data.forEach(item => {
            //    var row = $('<tr>'); // Create a table row

            //    // Create the Start and Due cells
            //    var startDueCell = $('<td>').text('Start: ' + item.Start + '\nEnd: ' + item.Due);
            //    row.append(startDueCell);

            //    var paymentCell = $('<td>').text('Payment: ' + item.Payment);
            //    row.append(paymentCell);
            //    // Create the button cell
            //    var buttonCell = $('<td>').html('<button type="button" class="btn btn-primary">Pay</button>');
            //    row.append(buttonCell);

            //    // Append the row to the tbody
            //    tableBody.append(row);
            //});
        }
    </script>
</asp:Content>
