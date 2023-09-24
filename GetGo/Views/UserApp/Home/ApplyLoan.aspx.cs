using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Home_ApplyLoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetLoanID(UserLoan items)
    {
        string query = "APP_LOAN_APPLY";
        var parameters = new
        {
            USER_ID = items.USER_ID,
            LOAN_AMOUNT = items.LOAN_AMOUNT,
            INSTALLMENT_ID = items.INSTALLMENT_ID,
            TENURE = items.TENURE_ID,
            BRANCH = items.BRANCH,
            BUSSINESS = items.BUSSINESS,
            NATUREOFWORK = items.NATURE_OF_WORK,
            INCOME = items.INCOME,
            CHARACTER_REFERENCE = items.CHARACTER_REFERENCE,
            CO_GUARANTOR = items.CO_GUARANTOR,
            CO_PHONE_NO = items.CO_PHONE_NO,
            COLLATERALNAME = items.NAME_OF_COLLATERAL,
            DESCRIPTION = items.DESCRIPTION,
        };

        var maint = new UserAppController();
        return JsonConvert.SerializeObject(maint.QueryGetOrPopulate(query, parameters));
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