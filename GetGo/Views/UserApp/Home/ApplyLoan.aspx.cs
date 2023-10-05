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
    [WebMethod]
    public static string GetCreditLimit(string userid)
    {

        var user = new UserAppController();
        var commandText = @"WITH CALCULATED_AMOUNT AS (
                                           SELECT 
                                              CAST(ROUND(AMOUNT * (CONVERT(DECIMAL, INTEREST)/100), 0) AS INT) AS INTEREST,
                                              CAST(ROUND(AMOUNT + (AMOUNT * (CONVERT(DECIMAL, INTEREST)/100)), 0) AS INT) AS CALCULATED_AMOUNT
                                            FROM 
                                                [db_Getgo].[dbo].[TBL_M_LOAN_AMOUNT]
                                        ), TOTAL_LOAN AS(
                                        
                                        SELECT ISNULL(SUM(AMOUNT- INTEREST),0) AS TOTAL_LOAN,USER_ID
                                        FROM  CALCULATED_AMOUNT  
                                        INNER JOIN TBL_T_USER_LOAN ON CALCULATED_AMOUNT = AMOUNT
                                        WHERE USER_ID =@USERID AND STATUS !='FULLY PAID'
                                           GROUP BY USER_ID
                                        
                                        
                                        )
                                        ,CREDIT_LIMIT AS (
                                        			SELECT COALESCE(AMOUNT, 0) AS CREDIT_LIMIT, USER_ID
                                        			FROM TBL_T_USER_CREDIT_LIMIT
                                        			WHERE USER_ID = @USERID)
                                        
                                         SELECT COALESCE(TL.TOTAL_LOAN, 0) AS TOTAL_LOAN, COALESCE(CL.CREDIT_LIMIT, 0) AS CREDIT_LIMIT
                                                                        FROM TOTAL_LOAN AS TL
                                                                        RIGHT JOIN CREDIT_LIMIT AS CL ON TL.USER_ID = CL.USER_ID
                                                                        UNION ALL
                                                                        SELECT 0 AS TOTAL_LOAN, 0 AS CREDIT_LIMIT
                                                                        WHERE NOT EXISTS (SELECT 1 FROM TOTAL_LOAN);";
        var parameters = new { USERID = userid};

        var data = user.QueryGetCreditLimitInformation(commandText,parameters);
        return data;
    }
}