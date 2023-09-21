using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Home_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetLoanID(UserLoan loanData)
    {
        string query = "SP_SOMETHING";
        var parameters = new
        {
            USER_ID     = loanData.USER_ID,
            LOAN_AMOUNT = loanData.LOAN_AMOUNT,
            BRANCH      = loanData.BRANCH,
            BUSSINESS   = loanData.BUSSINESS,
            NATUREOFWORK = loanData.NATURE_OF_WORK,
            INCOME       = loanData.INCOME,
            CO_GUARANTOR =loanData.CO_GUARANTOR,
            CO_PHONE_NO  = loanData.CO_PHONE_NO, 
            COLLATERALNAME  = loanData.NAME_OF_COLLATERAL,
            DESCRIPTION     = loanData.DESCRIPTION,
        };

        var json = new
        {
            LOAN_ID = 1
        };

        return JsonConvert.SerializeObject(json);

    }
}