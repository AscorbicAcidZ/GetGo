using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Profile_Profile_Primary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    [WebMethod]
    public static string GetUserDetails(UserModel item)
    {
        var user = new UserAppController();
        var query = "APP_PROFILE_GET";
        var parameters = new {INPUT = item.INPUT };
        
        return JsonConvert.SerializeObject(user.QueryGetOrPopulate(query, parameters));
    }
    [WebMethod]
    public static string InsertOrUpdate(string query, UserModel item)
    {
        var user = new UserAppController();
        var parameters = new
        {
            ACTION = "PRIMARY",
            USER_ID = item.USER_ID,
            FIRST_NAME = item.FIRST_NAME,
            MIDDLE_NAME = item.MIDDLE_NAME,
            LAST_NAME = item.LAST_NAME,
            DATE_OF_BIRTH = item.DATE_OF_BIRTH,
            EMAIL_ADDRESS = item.EMAIL_ADDRESS,
            CONTACTNO = item.CONTACTNO,
            SEX = item.SEX,
            MARITAL_STATUS = item.MARITAL_STATUS
        };
        return JsonConvert.SerializeObject(user.QueryInsertOrUpdate(query, parameters));
    }
}