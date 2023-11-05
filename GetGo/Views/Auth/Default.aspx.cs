using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Auth_Default : System.Web.UI.Page
{
    public string ACTION;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ACTION = Request.QueryString["ACTION"];
            if (ACTION == "AuthLink")
            {
                Response.Redirect("~/Views/Auth/Default.aspx?46FFE43A74AC2CAF593E9DCEAB229");
            }
            else if (ACTION == "AuthFingerPrint")
            {
                var UserID = Request.QueryString["USERID"];

                Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?" + UserID);
            }
            else if (ACTION == "EnableBiometrics")
            {
                var UserID = Request.QueryString["USERID"];
                var UserToken = "";

                var maint = new UserAppController();
                var dt = new DataTable();

                var commandText = @"    DECLARE @USERTOKEN NVARCHAR(50);
                                        DECLARE @ExistingToken NVARCHAR(50);
                                        DECLARE @TokenStatus BIT;
                                        
                                        -- Check if user exists and get existing token and status
                                        SELECT @ExistingToken = USERTOKEN, @TokenStatus = TOKEN_STATUS
                                        FROM TBL_T_USER_TOKEN
                                        WHERE USER_ID = @USERID;
                                        
                                        -- If user does not exist, insert a new record
                                        IF @ExistingToken IS NULL
                                        BEGIN
                                          
                                            SET @USERTOKEN = NEWID(); 
                                            
                                            -- Insert new user token record
                                            INSERT INTO TBL_T_USER_TOKEN (USER_ID, USERTOKEN, TOKEN_STATUS)
                                            VALUES (@USERID, @USERTOKEN, 1); -- Setting TOKEN_STATUS to TRUE (1)
                                        
                                        SELECT @ExistingToken = USERTOKEN, @TokenStatus = TOKEN_STATUS
                                        FROM TBL_T_USER_TOKEN
                                        
                                        WHERE USER_ID = @USERID;
                                        END
                                        SELECT @USERID AS USERID ,@ExistingToken AS USERTOKEN,@TokenStatus AS TOKEN_STATUS ";
                SqlParameter[] parameters ={
                 new SqlParameter("@USERID", UserID),
                };
                dt = maint.QueryGetOrPopulateAdoNetText(commandText, parameters);
                if (dt.Rows.Count > 0)
                {
                    UserID = dt.Rows[0]["USERID"].ToString();
                    UserToken = dt.Rows[0]["USERTOKEN"].ToString();
                    
                }
                Response.Redirect("~/Views/UserApp/AuthenticateStatus.aspx?USERID=" + UserID + "&USERTOKEN="+UserToken);
            }

        }
    }
    [WebMethod]
    public static string AuthLink()
    {
        var userToken = "46FFE43A74AC2CAF593E9DCEAB229";
        return JsonConvert.SerializeObject(userToken);
    }

}