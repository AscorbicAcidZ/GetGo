using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Home_Default : System.Web.UI.Page
{
    public string UserID,Action;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            UserID = Request.QueryString["USERID"] ?? "";
            if (!string.IsNullOrEmpty(UserID))
            {

                var maint = new UserAppController();
              


                var commandText = @"SELECT APPROVED_STATUS FROM TBL_M_USER_MASTER WHERE USER_ID=@USERID AND APPROVED_STATUS =1";
                var parameters = new { USERID = UserID };
                var data = maint.QueryGetOrPopulateText(commandText, parameters);
                if (data.Count > 0)
                {

                    Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?d0749aaba8b833466dfcbb0428e4f89c");
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