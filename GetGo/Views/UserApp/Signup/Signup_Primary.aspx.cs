using Newtonsoft.Json;
using System;
using System.Web.Services;

public partial class Views_UserApp_Signup_Signup_Primary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string CheckExist(string query, string username, string phonenumber, string email)
    {
        var user = new UserAppController();
        var parameters = new
        {
            ACTION= "CHECK_EXIST",
            USERNAME = username,
            PHONENUMBER = phonenumber,
            EMAIL = email
        };
        return JsonConvert.SerializeObject(user.QueryGetOrPopulate(query, parameters));
    }
}