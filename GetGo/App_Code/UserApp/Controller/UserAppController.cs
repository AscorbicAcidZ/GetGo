using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using Dapper;
using System.Runtime.Remoting.Messaging;
using Newtonsoft.Json;

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
        SqlTransaction trans=null;
        try
        {
            using (SqlConnection conn = new SqlConnection(sqlconn))
            {
                conn.Open();
                trans = conn.BeginTransaction();
                conn.Execute(query, parameters, trans, commandType: CommandType.StoredProcedure);
                trans.Commit();
                return "Success";
            }
        }
        catch (SqlException ex)
        {
            trans.Rollback();
            LogErrorMessageToDatabase(ex.Message);
            return ex.Message;
         
        }
        catch (Exception ex)
        {
            return ex.Message;
          
        }

    }
    public List<dynamic> QueryGetOrPopulateText(string commandText, object parameters = null)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(sqlconn))
            {
                conn.Open();
                var result = conn.Query(commandText, parameters);
                return result.ToList();
            }
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
    public string QueryInsertOrUpdateText(string query, object parameters = null)
    {
        SqlTransaction trans = null;
        try
        {
            using (SqlConnection conn = new SqlConnection(sqlconn))
            {
                conn.Open();
                trans = conn.BeginTransaction();
                conn.Execute(query, parameters, trans);

                trans.Commit();
                 //var response = new { message = "success" };
                return "success";
            }
        }
        catch (SqlException ex)
        {
            trans.Rollback();
            LogErrorMessageToDatabase(ex.Message);
            return ex.Message;

        }
        catch (Exception ex)
        {
            return ex.Message;

        }
    }
    public string QueryGetMultipleText(string query, object parameters=null)
    {
        using (SqlConnection conn = new SqlConnection(sqlconn))
        {
            conn.Open();

            using (var multi = conn.QueryMultiple(query, parameters))
            {
                var data = new LoanData
                {
                    InstallmentPlans = multi.Read<InstallmentPlan>().ToList(),
                    TenureOptions = multi.Read<TenureOption>().ToList(),
                    BranchLists = multi.Read<BranchList>().ToList(),
                    LoanLists = multi.Read<LoanList>().ToList(),
                };
                var json = JsonConvert.SerializeObject(data);

                return json;
            }
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