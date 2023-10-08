using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Menu_Default : System.Web.UI.Page
{
    public string UserID, Action;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UserID = Request.QueryString["USERID"] ?? "";
            if (!string.IsNullOrEmpty(UserID))
            {

                var maint = new UserAppController();



                var commandText = @"SELECT TOP 1 USERTOKEN FROM TBL_T_USER_TOKEN WHERE USER_ID=@USERID";
                var parameters = new { USERID = UserID };
                var data = maint.QueryGetOrPopulateText(commandText, parameters);
                if (data.Count > 0)
                {
                    string token = data[0]["USERTOKEN"].ToString();
                    Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?USERTOKEN="+token+"");
                    //Note Will add security JWT Token Later
                }
                else
                {
                    Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?46FFE43A74AC2CAF593E9DCEAB229");
                }
            }


        }
    }

    
}