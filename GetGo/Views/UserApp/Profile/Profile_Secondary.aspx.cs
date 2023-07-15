using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Profile_Profile_Secondary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetUserDetails(string query, UserModel item)
    {
        var user = new UserAppController();
        var parameters = new { USER_ID = item.USER_ID };
        return JsonConvert.SerializeObject(user.QueryGetOrPopulate(query, parameters));
    }
    [WebMethod]
    public static string InsertOrUpdate(string query, UserModel item)
    {
        var user = new UserAppController();
        var parameters = new
        {
            ACTION= "SECONDARY",
            STREET_NO = item.STREET_NO,
            BARANGAY = item.BARANGAY,
            CITY = item.CITY,
            PROVINCE = item.PROVINCE,
            REGION = item.REGION,
            ZIPCODE = item.ZIPCODE
        };
        return JsonConvert.SerializeObject(user.QueryInsertOrUpdate(query, parameters));
    }
}