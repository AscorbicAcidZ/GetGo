<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Home_Loan_Contract.aspx.cs" Inherits="Views_UserApp_Home_Home_Loan_Contract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="wrapper">
        <section class="content-header">
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="col-lg-12">

                    <div class="card">
                        <div class="header-label">
                            <label>Contract</label>
                        </div>
                        <div class="card-body">
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body">
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Signature</label>
                                    <img src="../../../Resources/dist/img/default-150x150.png" id="image_upload_preview" class="form-control input variant-2" />
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="input">
                                    <label for="name">Co Guarantor</label>
                                    <input type="text" required="" autocomplete="off" id="txtCoGuarantor" class="form-control input">
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
</asp:Content>

