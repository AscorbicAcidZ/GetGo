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
    public static string GetLoanID(UserLoan items)
    {
        string query = "SP_SOMETHING";
        //var parameters = new
        //{
        //    USER_ID = items.USER_ID,
        //    LOAN_AMOUNT = items.LOAN_AMOUNT,
        //    BRANCH = items.BRANCH,
        //    BUSSINESS = items.BUSSINESS,
        //    NATUREOFWORK = items.NATURE_OF_WORK,
        //    INCOME = items.INCOME,
        //    CHARACTER_REFERENCE = items.CHARACTER_REFERENCE,
        //    CO_GUARANTOR = items.CO_GUARANTOR,
        //    CO_PHONE_NO = items.CO_PHONE_NO,
        //    COLLATERALNAME = items.NAME_OF_COLLATERAL,
        //    DESCRIPTION = items.DESCRIPTION,
        //};

        var json = new
        {
            LOAN_ID = 1
        };

        return JsonConvert.SerializeObject(json);

    }
}