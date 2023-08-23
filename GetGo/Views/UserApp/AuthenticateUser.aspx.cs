using System;
using System.Data;

public partial class Views_User_AuthenticateUser : System.Web.UI.Page
{
    public string UserName, Password;
    UserAppController userapp = new UserAppController();    
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            UserName = Request.QueryString["UserName"];
            Password = Request.QueryString["Password"];
            DataTable dt = new DataTable();
            dt = userapp.QueryGetOrPopulate("APP_LOGIN_GET", new { USERNAME = UserName, PASSWORD = Password});
            if (dt.Rows.Count > 0 )
            {
                var UserID = dt.Rows[0]["USER_ID"].ToString();
                Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?USERID=" + UserID); 
                //Note Will add security JWT Token Later
            }   
            else
            {
                Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?46FFE43A74AC2CAF593E9DCEAB229");
            }
        }
    }
}