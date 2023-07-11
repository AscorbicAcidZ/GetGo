using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Views_UserApp_SignUp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string QueryInsertOrUpdate(string query,object parameters)
    {
        UserAppController  userapp = new UserAppController();

        return JsonConvert.SerializeObject(userapp.QueryInsertOrUpdate(query, parameters));
    }
}