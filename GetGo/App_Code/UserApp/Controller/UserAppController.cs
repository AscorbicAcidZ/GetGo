using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Dapper;
using System.Runtime.Remoting.Messaging;

/// <summary>
/// Summary description for UserAppController
/// </summary>
public class UserAppController
{
    string sqlconn = ConfigurationManager.AppSettings["GetGoConnectionString"];
    public DataTable QueryGetOrPopulate(string query, object parameters = null)
    {
        {
            try
            {
                var dataTable = new DataTable();
                using (SqlConnection conn = new SqlConnection(sqlconn))
                {
                    var result = conn.ExecuteReader(query, parameters, commandType: CommandType.StoredProcedure);
                    dataTable.Load(result);
                }
                return dataTable;
            }
            catch (SqlException ex)
            {
                throw ex;
            }
            catch (Exception ex)
            {
                throw ex;
            }


        }
    }
    public string QueryInsertOrUpdate(string query, object parameters)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(sqlconn))
            {
                conn.Open();
                var trans = conn.BeginTransaction();
                conn.Execute(query, parameters, trans, commandType: CommandType.StoredProcedure);
                trans.Commit();
                return "Success";
            }
        }
        catch (SqlException ex)
        {
            LogErrorMessageToDatabase(ex.Message);
            return ex.Message;
        }
        catch (Exception ex)
        {
            return ex.Message;
          
        }

    }
    private void LogErrorMessageToDatabase(string errorMessage)
    {
        try
        {
            // Create a new SqlConnection and SqlCommand to insert the error message into the database
            using (SqlConnection conn = new SqlConnection(sqlconn))
            using (SqlCommand cmd = new SqlCommand("INSERT INTO ErrorLog (ErrorMessage, Timestamp) VALUES (@ErrorMessage, @Timestamp)", conn))
            {
                conn.Open();

                // Add parameters to the SqlCommand
                cmd.Parameters.AddWithValue("@ErrorMessage", errorMessage);
                cmd.Parameters.AddWithValue("@Timestamp", DateTime.Now);
                cmd.ExecuteNonQuery();
            }
            // Execute the SqlCommand to insert the error message into the database
          
        }

        catch (Exception ex)
        {
            // If logging the error to the database fails, you might want to log this error to a file or another location
            // Alternatively, you could rethrow the exception to indicate the problem with logging itself
        }
    }

}