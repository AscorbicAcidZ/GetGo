<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Page.master" AutoEventWireup="true" CodeFile="Signup.aspx.cs" Inherits="Views_UserApp_Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../Resources/font/nunito-font.css" rel="stylesheet" />
    <link href="../../Resources/custom-css/signup.css" rel="stylesheet" />
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
                            <div class="form-group">
                                <h4>Hi there, Welcome!</h4>
                                <h4>Sign up to continue</h4>
                            </div>
                        </div>

                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa fa-user icon"></i>
                                    <input type="text" class="form-control input" placeholder="Username" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa fa-mobile-alt icon"></i>
                                    <input type="number" class="form-control input" placeholder="Phone Number" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa  fa-paper-plane icon"></i>
                                    <input type="email" class="form-control input" placeholder="Email Address" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa  fa-unlock-alt icon"></i>
                                    <input type="password" id="password" class="form-control input" placeholder="Password" />
                                      <i class="far fa-eye icon-right" id="togglePassword" style="cursor: pointer;"></i>

                                </div>
                            </div>
                            <div class="form-group">
                                <div class="group">
                                    <i class="fa  fa-unlock-alt icon"></i>
                                    <input type="password" class="form-control input" placeholder="Password" />
                                  
                                </div>
                            </div>
                        <%--    <div class="form-group" style="display: flex; align-items: center; justify-content: center;">
                                <input type="checkbox" class="form-check-input" style="margin-right: 290px; margin-bottom: 13px;" />
                                <h6>I agree to <b>Terms & Conditions</b> and <b>Policy</b></h6>
                            </div>--%>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
    <script type="text/javascript">
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password');

        togglePassword.addEventListener('click', function (e) {
            // toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
    
            this.classList.toggle('fa-eye-slash');
        });
    </script>
</asp:Content>


