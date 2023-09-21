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
                for (int i = 0; i < context.Request.Files.Count; i++)
                {
                    HttpPostedFile postedFile = context.Request.Files[i];
                    string fileName = postedFile.FileName;
                    string fileExtension = Path.GetExtension(fileName);
                    string filePath = HttpContext.Current.Server.MapPath(Path.Combine("~/UploadedFiles", userId));

                    //if (!Directory.Exists(filePath))
                    //{
                    //    Directory.CreateDirectory(filePath);
                    //}

                    //if (!string.IsNullOrEmpty(fileName))
                    //{
                    //    string file = fileName;
                    //    postedFile.SaveAs(Path.Combine(filePath, file));

                    //    FileDetails fd = new FileDetails();
                    //    fd.UserId = userId;
                    //    fd.FileName = fileName;
                    //    fd.FileType = fileExtension;
                    //    fd.FilePath = Path.Combine(filePath, file); // Store the full file path
                    //    fd.Classification = classification;
                    //    SaveFiles(fd);
                    //}
                }

                context.Response.Write("Files uploaded successfully");
            }
            catch (Exception ex)
            {
                context.Response.StatusCode = 500; // Set an appropriate HTTP error code
                context.Response.Write("Error: " + ex.Message);
            }
        }
    }

    public void SaveFiles(FileDetails fd)
    {
        try
        {
            // Your code to save file details to the database goes here
            // You can insert each file's details into your database as needed
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