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
            return ex.Message;
        }
        catch (Exception ex)
        {
            return ex.Message;
        }
        
    }
}