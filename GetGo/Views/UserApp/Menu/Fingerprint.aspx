<%@ Page Title="" Language="C#" MasterPageFile="~/Views/UserApp/Home/Page.master" AutoEventWireup="true" CodeFile="Fingerprint.aspx.cs" Inherits="Views_UserApp_Menu_Fingerprint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .switch {
            font-size: 17px;
            position: relative;
            display: inline-block;
            width: 62px;
            height: 35px;
        }

            /* Hide default HTML checkbox */
            .switch input {
                opacity: 1;
                width: 0;
                height: 0;
            }

        /* The slider */
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0px;
            background: #fff;
            transition: .4s;
            border-radius: 30px;
            border: 1px solid #ccc;
        }

            .slider:before {
                position: absolute;
                content: "";
                height: 1.9em;
                width: 1.9em;
                border-radius: 16px;
                left: 1.2px;
                top: 0;
                bottom: 0;
                background-color: white;
                box-shadow: 0 2px 5px #999999;
                transition: .4s;
            }

        input:checked + .slider {
            background-color: #5fdd54;
            border: 1px solid transparent;
        }

            input:checked + .slider:before {
                transform: translateX(1.5em);
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="wrapper">
        <section class="content">

            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <div class="form-group">
                                    <img src="../../../Resources/dist/img/bio1.png" width="200" height="210" />
                                </div>
                                <div class="form-group">
                                    <label class="switch">
                                        <input type="checkbox">
                                        <span class="slider"></span>
                                    </label>
                                </div>

                            </div>
                            <div class="card-footer">
                                For Questions and Inquiries, email customer support:<a href="#">GetGoSupport@gmail.com </a>
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

