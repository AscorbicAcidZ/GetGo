<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Repayment.aspx.cs" Inherits="Views_UserApp_Home_Home_Repayment" %>

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
                                    <label class="custom-file-label" for="receipt">Attach receipt here</label>
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
    <script type="text/javascript">
        const params = new Proxy(new URLSearchParams(window.location.search), {
            get: (searchParams, prop) => searchParams.get(prop),
        });
        const userId = params.USERID;
        const category = params.CATEGORY;
        const imagesBaseUrl = "../../../UploadedFiles/Resources/dist/img/additional/";
        const allowedExtension = ['image/jpeg', 'image/jpg', 'image/png'];

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
      
        $('.custom-file-input').change(function () {
            if (!allowedExtension.includes(this.files[0]['type'])) {
                alert('Only (jpeg, jpg, png) file extensions can be uploaded!')
                $(this).val('');
                $('.custom-file-label').text('Attach receipt here');
        
            }
        });
        function SaveClick() {
            var files = $('.custom-file-input');
            files.each(function (index, fileInput) {
                var formData = new FormData();
                formData.append("file", fileInput.files[0]);
                formData.append("classification", fileInput.getAttribute("data-classification"));
            });
           
          
        };

        function upload(files) {
            /*    console.log(files);*/

            $.ajax({
                type: 'post',
                url: '../Home/Handlers/FileUpload.ashx?USERID=' + $('#txtUserID').val(),
                data: files,
                cache: false,
                processData: false,
                contentType: false,
                success: function (e) {

                    alert('success');
                    window.location = "Profile_Quartenary.aspx?USERID=" + $('#txtUserID').val();

                },
                error: function (err) {
                    alert(err);
                }
            })
        }

    </script>

</asp:Content>

