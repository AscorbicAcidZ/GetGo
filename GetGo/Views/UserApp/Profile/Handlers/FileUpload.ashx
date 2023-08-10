<%@ WebHandler Language="C#" Class="FileUpload" %>

using System;
using System.IO;
using System.Web;

public class FileUpload : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            string userId = System.Convert.ToString(context.Request.QueryString["USERID"]);
            string classification = context.Request.Form["classification"];
            try
            {
                string file = "";
                string fileName = "";
                string fileExtension = "";
                string filePath = "";

                for (int i = 0; i < context.Request.Files.Count; i++)
                {
                    HttpPostedFile postedFile = context.Request.Files[i];
                    fileName = postedFile.FileName;
                    filePath = HttpContext.Current.Server.MapPath(Path.Combine("~/UploadedFiles", userId));

                    if (!Directory.Exists(filePath))
                    {
                        Directory.CreateDirectory(filePath);
                    }

                    if (!string.IsNullOrEmpty(fileName))
                    {
                        fileExtension = Path.GetExtension(fileName);
                        file = fileName;
                        postedFile.SaveAs(filePath + "/" + file);
                    }
                }

                FileDetails fd = new FileDetails();
                fd.UserId = userId;
                fd.FileName = fileName;
                fd.FileType = fileExtension;
                fd.FilePath = filePath;
                fd.Classification = classification;
                SaveFiles(fd);

                context.Response.Write(file);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }

    public void SaveFiles(FileDetails fd)
    {
        try
        {
            var maint = new UserAppController();

            var parameters = new
            {
                USER_ID = fd.UserId,
                DESCRIPTION = fd.FileName,
                IMAGE_TYPE = fd.Classification

            };
            maint.QueryInsertOrUpdate("APP_ATTACHMENT_POST", parameters);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}