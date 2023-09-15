using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Dapper;
using System.Collections;
using System.Web.DynamicData;

public partial class Views_UserApp_Home_Home_Loan_Primary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetLoanAmounts()
    {
        var user = new UserAppController();
        var commandText = "SELECT ID, AMOUNT, INTEREST, PROCESS_FEE FROM TBL_M_LOAN_AMOUNT";
        return JsonConvert.SerializeObject(user.QueryGetOrPopulateText(commandText));
    }
    [WebMethod]
    public static string GetBranchList(string id)
    {
        var user = new UserAppController();
        var commandText = "SELECT ID, BRANCH FROM TBL_M_BRANCH WHERE ID = @Id";
        var parameters = new
        {
            Id = id
        };
        return JsonConvert.SerializeObject(user.QueryGetOrPopulateText(commandText,parameters));
    }
}