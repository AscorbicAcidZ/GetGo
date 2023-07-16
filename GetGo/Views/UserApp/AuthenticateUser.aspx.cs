using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            dt = userapp.QueryGetOrPopulate("APP_USER_GET", new { USERNAME = UserName, PASSWORD = Password});
            if (dt.Rows.Count > 0 )
            {
                var FullName = dt.Rows[0]["FULL_NAME"].ToString();
                var UserID = dt.Rows[0]["USER_ID"].ToString();
                Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?Name=" + FullName +"&UserId=" + UserID); 
                //Note Will add security JWT Token Later
            }
            else
            {
                Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?Name=");
            }
        }
    }
    private void AuthenticateUser(string Query , object parameters)
    {

    }
}