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
using System.Dynamic;

public partial class Views_UserApp_Signup_Change_Password : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    [WebMethod]
    public static string GetUserID(string query, string input)
    {
        var user = new UserAppController();
        var parameters = new { INPUT = input };
        dynamic response = new ExpandoObject(); // Use dynamic type

        var data = user.QueryGetOrPopulate(query, parameters);

        if (data.Rows.Count > 0)
        {
            Random random = new Random();
            int verificationCode = random.Next(100000, 999999);
            string Vcode = verificationCode.ToString();

            //Email configuration
            string senderEmail = "reijideveloper@gmail.com";
            string senderPassword = "kiwwngslnfrrgfsc";
            string recipientEmail = input;
            string subject = "[GetGO] Please verify your device";
            string body = "GetGO Verification: Your one-time PIN is: " + Vcode + ". Please do not share it.";

            // Create a new SmtpClient instance
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new NetworkCredential(senderEmail, senderPassword);

            try
            {
                // Create a new MailMessage instance
                MailMessage mailMessage = new MailMessage(senderEmail, recipientEmail, subject, body);

                // Send the email
                smtpClient.Send(mailMessage);
                var result = Vcode +"|"+ input;
                response.details = result; // Assign Vcode to the response
            }
            catch (Exception ex)
            {

                response.error = ex.Message;
            }
        }
        else
        {
            response.error = "Your email is not registered.";
        }

        return JsonConvert.SerializeObject(response);
    }
    [WebMethod]
    public static string UpdatePassword(string query, string email, string password)
    {
        UserAppController user = new UserAppController();
        var commandtext = @"UPDATE  TBL_M_USER_MASTER 
                                SET PASSWORD =@PASSWORD 
                                WHERE EMAIL_ADDRESS =@EMAIL";
        var parameters = new {EMAIL= email, PASSWORD= password };
        return JsonConvert.SerializeObject(user.QueryInsertOrUpdateText(commandtext, parameters));
  
    }


}