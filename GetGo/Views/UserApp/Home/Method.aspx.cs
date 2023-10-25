using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Home_Method : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetDetails()
    {

        var maint = new UserAppController();
        var commandText = @"SELECT LOAN_ID
                             ,A.USER_ID
                             ,B.FIRST_NAME +', ' +B.LAST_NAME AS FULLNAME
                             ,AMOUNT
                             ,APPROVED_STATUS
                             ,STATUS
                         FROM TBL_T_USER_LOAN AS A INNER JOIN TBL_M_USER_MASTER AS B ON A.USER_ID = B.USER_ID  WHERE STATUS='ONGOING' ORDER BY LOAN_ID DESC;";

        var data = JsonConvert.SerializeObject(maint.QueryGetOrPopulateText(commandText));
        return data;
    }
    [WebMethod]
    public static string UserApprove(string userid)
    {
        var maint = new UserAppController();
        var parameters = new { 
        USERID = userid,
        };
        var commandText = @"update TBL_M_USER_MASTER 
                                            set APPROVED_STATUS =1
                                            WHERE USER_ID =@USERID;
 INSERT INTO TBL_T_USER_CREDIT_LIMIT (USER_ID,AMOUNT)VALUES(@USERID,'15000');";
       return JsonConvert.SerializeObject( maint.QueryInsertOrUpdateText(commandText, parameters)); 
    }
    [WebMethod]
    public static string GetUser()
    {
        var user = new UserAppController();
        var commandText = @"SELECT USER_ID, FIRST_NAME +', ' +LAST_NAME AS FULLNAME, APPROVED_STATUS FROM TBL_M_USER_MASTER WHERE APPROVED_STATUS='0' ORDER BY ID DESC;  ";
        return JsonConvert.SerializeObject(user.QueryGetOrPopulateText(commandText));
    }
    [WebMethod]
    public static string LoanApprove(string loanid,string userid)
    {
        var maint = new UserAppController();
        var parameters = new
        {
            LOANID = loanid,
            USERID = userid,
        };
        var commandText = @"update TBL_T_USER_LOAN 
                                    set STATUS ='APPROVED'
                                            WHERE USER_ID =@USERID AND LOAN_ID=@LOANID
           ;";
        return JsonConvert.SerializeObject(maint.QueryInsertOrUpdateText(commandText, parameters));
    }
    public static string QueryUpdate2(string userid)
    {

        return "yes";
    }
}