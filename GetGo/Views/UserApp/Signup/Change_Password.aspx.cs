using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;

public partial class Views_UserApp_Signup_Change_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetUserID(string query, string input)
    {
        var user = new UserAppController();
        var parameters =
            new { INPUT = input };
        return JsonConvert.SerializeObject(user.QueryGetOrPopulate(query, parameters));

    }
    [WebMethod]
    public static object SendMail(string email)
    {
        Random random = new Random();
        int verificationCode = random.Next(100000, 999999);
        string Vcode = verificationCode.ToString();
        try
        {
            // Email configuration
            string senderEmail = "reijideveloper@gmail.com";
            string senderPassword = "kiwwngslnfrrgfsc";
            string recipientEmail = email;
            string subject = "[GetGO] Please verify your device";
            string body = "GetGO Verification" + "Your one-time PIN is:" + Vcode + "Please do not share it.";

            // Create a new SmtpClient instance
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new NetworkCredential(senderEmail, senderPassword);

            // Create a new MailMessage instance
            MailMessage mailMessage = new MailMessage(senderEmail, recipientEmail, subject, body);

            // Send the email
            smtpClient.Send(mailMessage);

            var user = new UserAppController();
            var commandText = @"
                    MERGE INTO TBL_T_VERIFICATION AS target
                    USING (SELECT @EMAIL AS EMAIL, @VCODE AS VCODE) AS source
                    ON target.EMAIL = source.EMAIL
                    WHEN MATCHED THEN
                        UPDATE SET target.USER_CODE = source.VCODE
                    WHEN NOT MATCHED THEN
                        INSERT (EMAIL, USER_CODE)
                        VALUES (source.EMAIL, source.VCODE);
               ";
            var parameters = new { EMAIL = email, VCODE = Vcode };

            return user.QueryInsertOrUpdateText(commandText, parameters);
            //var response = new { message = "success" };
            //return response;

        }
        catch (Exception ex)
        {
            var response = new { message = ex.Message };
            return JsonConvert.SerializeObject(response);
        }
    }


}