<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Views_Auth_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
<%--<script src="../../Resources/plugins/jquery/jquery.min.js"></script>

<script>
    const params = new Proxy(new URLSearchParams(window.location.search), {
        get: (searchParams, prop) => searchParams.get(prop),
    });

    var Action = params.ACTION;
    $(() => {
        if (Action == "AuthLink") {

            GetData({ url: "Default.aspx/AuthLink" }).then(e => {

                let data = JSON.parse(e.d);
                window.location = `../UserApp/AuthenticateStatus.aspx?TOKEN=${data}`;

            });


        }

    });
    const GetData = (config) => {
        config.type = config.type || "POST";
        config.data = config.data || "";
        return $.ajax({
            type: config.type,
            url: config.url,
            data: config.data,
            contentType: "application/json; charset=utf-8",
            dataType: "json",

            success: data => { },
            error: function (xhr, status, error) {
                alert('An error occurred during the request. Status: ' + xhr.status + ' - ' + xhr.statusText);

            }


        });

    };

</script>--%>
</html>
