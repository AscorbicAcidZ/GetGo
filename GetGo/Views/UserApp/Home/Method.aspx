<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Method.aspx.cs" Inherits="Views_UserApp_Home_Method" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="../../../Resources/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css" />
    <!-- DataTables -->
    <link rel="stylesheet" href="../../../Resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />
    <link rel="stylesheet" href="../../../Resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />
    <link rel="stylesheet" href="../../../Resources/plugins/datatables-buttons/css/buttons.bootstrap4.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <section class="content-header">
        <div class="container-fluid">
            <div class="col-lg-12">
                <br />
                <h1 style="font-size: 48px"><b style="color: #2b9348">Get</b><b style="color: #da2c38">Go</b>
                </h1>
            </div>
        </div>
        <!-- /.container-fluid -->
    </section>
    <nav>
        <div class="nav nav-pills nav-fill" id="nav-tab" role="tablist" style="background-color: white;">
            <a class="nav-link active" id="step1-tab" data-toggle="tab" href="#step1">USER APPROVAL</a>
            <a class="nav-link" id="step2-tab" data-toggle="tab" href="#step2">LOAN APPROVAL</a>
        </div>
    </nav>
    <div class="tab-content py-4" id="nav-tabContent">
        <div class="tab-pane fade show active" id="step1">

            <div class="wrapper">
                <br />
                <section class="content">
                    <div class="container">
                        <div class="container-fluid">
                            <div class="card">
                                <div class="card-body">
                                    <table class="user-table table-bordered table-sm" style="width: 100%;">
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

        </div>
         <div class="tab-pane fade show active" id="step2">

            <div class="wrapper">
                <br />
                <section class="content">
                    <div class="container">
                        <div class="container-fluid">
                            <div class="card">
                                <div class="card-body">
                                    <table class="loan-table table table-bordered table-sm" style="width: 100%;">
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script src="../../../Resources/plugins/datatables/jquery.dataTables.min.js"></script>
    <script src="../../../Resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
    <script src="../../../Resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
    <script type="text/javascript">

        var LoanTable;
        var UserTable;

        $(() => {
            user_table();
            loantable();
          
        });

        const loantable = () => {
            GetData({
                url: "Method.aspx/GetDetails"
            }).then(e => {
         
                let data = JSON.parse(e.d);
                if ($.fn.DataTable.isDataTable('.loan-table')) {
                    $('.loan-table').DataTable().destroy();
                }
            
          /*      console.log(data);*/
                LoanTable = $(".loan-table").DataTable({
                    searching: false,
                    paging: true,
                    info: true,
                    ordering: false,
                    scrollX: true,
                    scrollY: 400,

                    data: data,
                    //columnDefs: [
                    //    { 'visible': false, 'targets': [1, 13] }
                    //],
                    columns: [

                        { data: 'LOAN_ID', title: 'LOAN_ID' },
                        { data: 'USER_ID', title: 'USER_ID' },
                        { data: 'FULLNAME', title: 'FULLNAME' },
                        { data: 'AMOUNT', title: 'AMOUNT' },
                        { data: 'STATUS', title: 'LOAN_STATUS' },
                        {
                            title: 'APPROVE LOAN',
                            data: 'LOAN_ID',
                            render: function (e) {

                                return '<button type="button" data-toggle="modal" data-target="#Pullout" class="btn btn-sm btn-primary btn-LOAN-row"  title="Pullout">LOAN</i></button>';

                            }
                        },

                    ],
                });
            });
        }


        const user_table = () => {
            GetData({
                url: "Method.aspx/GetUser"
            }).then(e => {
                let data = JSON.parse(e.d);
                if ($.fn.DataTable.isDataTable('.user-table')) {
                    $('.user-table').DataTable().destroy();
                }
        /*        console.log(data);*/
                UserTable = $(".user-table").DataTable({
                    searching: false,
                    paging: true,
                    info: true,
                    ordering: false,
                    scrollX: true,
                    scrollY: 400,

                    data: data,
                    //columnDefs: [
                    //    { 'visible': false, 'targets': [1, 13] }
                    //],
                    columns: [

                     
                        { data: 'USER_ID', title: 'USER_ID' },
                        { data: 'FULLNAME', title: 'FULLNAME' },
                        { data: 'APPROVED_STATUS', title: 'USER_STATUS' },
                        {
                            title: 'APPROVE USER',
                            data: 'USER_ID',
                            render: function (e) {

                                return '<button type="button" data-toggle="modal" data-target="#Pullout" class="btn btn-sm btn-primary btn-USER-row"  title="Pullout">User</i></button>';

                            }
                        },
                    ],
                });

                loantable();
            });
        }


        $(document).on('click', 'button', function (e) {
            var elem = $(this);
            if (elem.hasClass('btn-USER-row')) {
                var data = UserTable.row($(this).closest('tr')).data();
            




                var userid = data[Object.keys(data)[0]];
                console.log(userid);

                GetData({
                    url: "Method.aspx/UserApprove", data: JSON.stringify({
                        userid: userid
                    })
                }).then(e => {

                    let data = JSON.parse(e.d);
                    //initializeTable();
                   
                    user_table();
                    alert('user account approved');
                  
                });
            }
        });
        $(document).on('click', 'button', function (e) {
            var elem = $(this);
            if (elem.hasClass('btn-LOAN-row')) {
                var data = LoanTable.row($(this).closest('tr')).data();
                console.log(data);


                var loanid = data[Object.keys(data)[0]];
                var userid = data[Object.keys(data)[1]];
                console.log(loanid, userid);

                GetData({
                    url: "Method.aspx/LoanApprove", data: JSON.stringify({
                        loanid:loanid,
                        userid: userid
                    })
                }).then(e => {
                    alert('loan  approved');
  /*                  let data = JSON.parse(e.d);*/
                    loantable();
                });
            }
        });
        const GetData = (config) => {
            console.log(config);
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
