using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_UserApp_Menu_Menu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetUserLoanInformation(string user_id)
    {

        var commmandText = @"
         SELECT A.[LOAN_ID]
              ,A.[RELEASED_DATE]
              ,A.[MATURITY_DATE]
              ,A.[AMOUNT]
              ,B.[INSTALLMENT_PLAN]
              ,C.[TENURE]
              ,A.[PROCESSING_FEE]
              ,A.[INTEREST_RATE]
              ,A.[STATUS]
        	  ,D.BRANCH
          FROM [db_Getgo].[dbo].[TBL_T_USER_LOAN] AS A WITH(NOLOCK)
         INNER JOIN  TBL_M_LOAN_PLAN  AS B WITH(NOLOCK) ON A.INSTALLMENT_ID=  B.INSTALLMENT_ID
         INNER JOIN TBL_M_LOAN_TENURE_OPTIONS AS C WITH(NOLOCK) ON A.TENURE =c.TENURE_ID 
         INNER JOIN TBL_M_BRANCH AS D  ON  A.BRANCH = D.ID WHERE A.USER_ID =@USER_ID ORDER BY LOAN_ID ASC;
         
         SELECT A.LOAN_DETAILS_ID,
                A.LOAN_ID,
                A.START_DATE,
                A.DUE_DATE,
                A.AMOUNT,
                A.METHOD,
                A.AMOUNT_PAID,
                A.BALANCE,
                A.IS_COMPLETE
                FROM TBL_T_BORROWER_LOAN_PLAN_DETAILS AS A 
                INNER JOIN  TBL_T_USER_LOAN AS B WITH(NOLOCK) ON A.LOAN_ID = B.LOAN_ID WHERE A.USER_ID =@USER_ID  ORDER BY A.LOAN_DETAILS_ID ASC ;"
            ;
        var parameters = new { USER_ID = user_id };
        var user = new UserAppController();
        var jsonData = user.QueryGetLoanInformation(commmandText, parameters);
        return jsonData;
    }
}