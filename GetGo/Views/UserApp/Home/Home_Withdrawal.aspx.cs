using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Home_Home_Withdrawal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string SaveUserRequest(string userid,
        string availablecredit, 
        string accountno,
        string bankname,
        string accountname,
        string withdrawal,
        string method)
    {
        var parameters = new
        {
          USERID= userid,
          CREDIT = availablecredit,
          ACCOUNTNO = accountno,
          BANKNAME = bankname,
          ACCOUNTNAME = accountname,
          WITHDRAWAL = withdrawal,
          METHOD = method   
        };
        var commandText = @"INSERT INTO TBL_T_USER_WITHDRAWAL
                            (USER_ID,AVAILABLE_CREDIT,BANK_ACCOUNT_NO,BANK_NAME,ACCOUNT_NAME,WITHDRAWAL_AMOUNT,METHOD) VALUES 
                            (@USERID,@CREDIT,@ACCOUNTNO,@BANKNAME,@ACCOUNTNAME,@WITHDRAWAL,@METHOD)

                            SELECT TOP 1 WITHDRAWAL_ID FROM TBL_T_USER_WITHDRAWAL WHERE USER_ID =@USERID ORDER BY WITHDRAWAL_ID DESC"
                            ;
        var maint = new UserAppController();
        return JsonConvert.SerializeObject(maint.QueryGetOrPopulateText(commandText, parameters));
    }

}