using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Profile_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
    }
    [WebMethod]
    public static string GetUserDetails(string query, object parameters) 
    {
        UserAppController user = new UserAppController();
        return JsonConvert.SerializeObject(user.QueryGetOrPopulate(query, parameters));
    }

}