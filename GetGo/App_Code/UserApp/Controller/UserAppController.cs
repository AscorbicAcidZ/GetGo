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
using System.Diagnostics;

/// <summary>
/// Summary description for UserAppController
/// </summary>
public class UserAppController
{
    string sqlconn = ConfigurationManager.AppSettings["GetGoConnectionString"];
    public DataTable QueryGetOrPopulate(string query, object parameters = null)
    {
        SqlTransaction transaction = null;
        {
            try
            {
                var dataTable = new DataTable();
                using (SqlConnection conn = new SqlConnection(sqlconn))
                {

                    conn.Open();
                    transaction = conn.BeginTransaction();
                    var result = conn.ExecuteReader(query, parameters,transaction, commandType: CommandType.StoredProcedure);
                    dataTable.Load(result);
                    transaction.Commit();
                }
                return dataTable;
            }
            catch (SqlException ex)
            {
                transaction.Rollback();
                LogErrorMessageToDatabase(ex.Message + query);
                throw ex;


            }
            catch (Exception ex)
            {
             

                transaction.Rollback();
                LogErrorMessageToDatabase(ex.Message + query);
                throw ex;
            }
        }
    }
    public DataTable QueryGetOrPopulate2(string query, SqlParameter[] parameters)
    {
        using (SqlConnection conn = new SqlConnection(sqlconn))
        {
            DataTable dataTable = new DataTable();
            SqlTransaction transaction = null;

            try
            {
                conn.Open();
                transaction = conn.BeginTransaction();
                using (SqlCommand cmd = new SqlCommand(query, conn, transaction))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddRange(parameters);

                    using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                    {
                        adapter.Fill(dataTable);
                    }
                }
                transaction.Commit();
            }
            catch (SqlException ex)
            {
                if (transaction != null) transaction.Rollback();
                LogErrorMessageToDatabase(ex.Message + query);
                throw ex;
            }
            catch (Exception ex)
            {
                if (transaction != null) transaction.Rollback();
                LogErrorMessageToDatabase(ex.Message + query);
                throw ex;
            }

            return dataTable;
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
    public string QueryInsertOrUpdateAdoNet(string query, SqlParameter[] parameters)
    {
        using (SqlConnection conn = new SqlConnection(sqlconn))
        {
            SqlTransaction trans = null;
            try
            {
                conn.Open();
                trans = conn.BeginTransaction();

                using (SqlCommand cmd = new SqlCommand(query, conn, trans))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddRange(parameters);

                    cmd.ExecuteNonQuery();
                }

                trans.Commit();
                return "Success";
            }
            catch (SqlException ex)
            {
                if (trans != null) trans.Rollback();
                LogErrorMessageToDatabase(ex.Message);
                return ex.Message;
            }
            catch (Exception ex)
            {
                if (trans != null) trans.Rollback();
                LogErrorMessageToDatabase(ex.Message);
                return ex.Message;
            }
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
    public string QueryGetLoanInformation(string query, object parameters = null)
    {
        using (SqlConnection conn = new SqlConnection(sqlconn))
        {
            conn.Open();

            using (var multi = conn.QueryMultiple(query, parameters))
            {
                var data = new LoanInformation
                {
                    LoanRecords = multi.Read<LoanRecord>().ToList(),
                    LoanDetailsRecords = multi.Read<LoanDetailsRecord>().ToList(),
                };
                var json = JsonConvert.SerializeObject(data);

                return json;
            }
        }
    }
    public string QueryGetCreditLimitInformation(string query, object parameters = null)
    {
        using (SqlConnection conn = new SqlConnection(sqlconn))
        {
            conn.Open();

            using (var multi = conn.QueryMultiple(query, parameters))
            {
                var data = new CreditLimitInformation
                {
                    CreditLimits = multi.Read<CreditLimit>().ToList(),
                };
                var json = JsonConvert.SerializeObject(data);

                return json;
            }
        }
    }
    public string QueryGetNotification(string query, object parameters = null)
    {
        using (SqlConnection conn = new SqlConnection(sqlconn))
        {
            conn.Open();

            using (var multi = conn.QueryMultiple(query, parameters))
            {
                var data = new NotificationInformation
                {
                    Notifications = multi.Read<Notification>().ToList(),
                };
                var json = JsonConvert.SerializeObject(data);

                return json;
            }
        }
    }
    public void LogErrorMessageToDatabase(string errorMessage)
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