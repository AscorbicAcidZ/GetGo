using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Signup_Signup_Secondary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string UserSignUp(string username,string phonenumber, string email,string password)
    {
        UserAppController user =  new UserAppController();

        var query = "APP_SIGNUP";
        var parameters = new {
        ACTION ="INSERT",
        USERNAME = username,
        PHONENUMBER = phonenumber,
        EMAIL = email,
        PASSWORD = password
        };
        return JsonConvert.SerializeObject(user.QueryInsertOrUpdate(query,parameters));
    }
}