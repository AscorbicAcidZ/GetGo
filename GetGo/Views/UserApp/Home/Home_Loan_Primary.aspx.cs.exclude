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
    public static string GetLoanDetails()
    {
        var user = new UserAppController();
        var commandText = @"
        SELECT INSTALLMENT_ID, INSTALLMENT_PLAN FROM TBL_M_LOAN_PLAN;
        SELECT TENURE_ID, INSTALLMENT_PLAN, TENURE FROM TBL_M_LOAN_TENURE_OPTIONS;
        SELECT ID, BRANCH FROM TBL_M_BRANCH;
        SELECT LOAN_PLAN_ID, AMOUNT, INTEREST, PROCESS_FEE FROM TBL_M_LOAN_AMOUNT;";
        // Call the QueryGetMultipleText method to get the JSON data
        var jsonData = user.QueryGetMultipleText(commandText);
        return jsonData;
    }
}