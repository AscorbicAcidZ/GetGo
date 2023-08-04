<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Profile/Page.master" AutoEventWireup="true" CodeFile="Profile_Quartenary.aspx.cs" Inherits="Views_UserApp_Profile_Profile_Quartenary" %>

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
                        <div class="header-label">
                            <label>ID & Signature</label>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                Attach photo of your valid ID here
                            </div>
                            <div class="form-group">
                                <label>Front face </label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="frontface">
                                    <label class="custom-file-label" for="exampleInputFile">Attach photo here</label>
                                </div>
                            </div>

                            <div class="form-group">
                                   <label>Back face </label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="backface">
                                    <label class="custom-file-label" for="exampleInputFile">Attach photo here</label>
                                </div>
                            </div>
                              <div class="form-group">
                                   <label>Signature </label>
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="signature">
                                    <label class="custom-file-label" for="exampleInputFile">Attach photo here</label>
                                </div>
                            </div>
                             <div class="form-group">
                                <div class="input">
                                    <button type="button" class="btn btn-primary" id="btnSave" onclick="User_Update()">Save</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
       
        </section>
        <section class="content">

        </section>
        
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="Server">
</asp:Content>

