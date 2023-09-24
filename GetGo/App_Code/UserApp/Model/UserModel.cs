using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserModel
/// </summary>
public class UserModel
{
    public string INPUT { get; set; }
    public int ID { get; set; }
    public string USER_ID { get; set; }
    public string FIRST_NAME { get; set; }
    public string MIDDLE_NAME { get; set; }
    public string LAST_NAME { get; set; }
    public string EXTENSION_NAME { get; set; }
    public int AGE { get; set; }
    public string DATE_OF_BIRTH { get; set; }
    public string SEX { get; set; }
    public string MARITAL_STATUS { get; set; }
    public string SPOUSE_NAME { get; set; }
    public string USERNAME { get; set; }
    public string PASSWORD { get; set; }
    public string EMAIL_ADDRESS { get; set; }
    public string CONTACTNO { get; set; }
    public string COMPANY_NAME { get; set; }
    public string REGION { get; set; }
    public string PROVINCE { get; set; }
    public string CITY { get; set; }
    public string BARANGAY { get; set; }
    public string STREET_NO { get; set; }
    public string ZIPCODE { get; set; }
    public string BUSSINESS_NAME { get; set; }
    public string NATURE_OF_WORK { get; set; }
    public decimal MONTHLY_GROSS { get; set; }
    public string CHARACTER_REFERENCE { get; set; }
    public string CO_GUARANTOR_NAME { get; set; }
    public string CO_GUARANTOR_NUMBER { get; set; }
    public string CREATED_BY { get; set; }
    public DateTime CREATED_DATE { get; set; }
    public string UPDATED_BY { get; set; }
    public DateTime UPDATED_DATE { get; set; }
    public bool DELETE_FLAG { get; set; }
    public bool ACTIVE_FLAG { get; set; }
}

public class UserLoan 
{
    public string USER_ID { get; set; }
    public int LOAN_AMOUNT { get; set; }
    public string INSTALLMENT_ID { get; set; }
    public string TENURE_ID { get; set; }
    public int BRANCH { get; set; }
    public string BUSSINESS { get; set; }
    public string NATURE_OF_WORK { get; set; }
    public int INCOME { get; set; }
    public string CHARACTER_REFERENCE { get; set; }
    public string CO_GUARANTOR { get; set; }
    public int CO_PHONE_NO { get; set; }
    public string NAME_OF_COLLATERAL { get; set; }
    public string DESCRIPTION { get; set; }

}



public class LoanData
{
    public List<InstallmentPlan> InstallmentPlans { get; set; }
    public List<TenureOption> TenureOptions { get; set; }
    public List<BranchList> BranchLists { get; set; }
    public List<LoanList> LoanLists { get; set; }
}

public class InstallmentPlan
{
    public int INSTALLMENT_ID { get; set; }
    public string INSTALLMENT_PLAN { get; set; }
}

public class TenureOption
{
    public int TENURE_ID { get; set; }
    public int INSTALLMENT_PLAN { get; set; }
    public int TENURE { get; set; }
}
public class BranchList
{
    public int ID { get; set; }
    public  string BRANCH { get; set; }
}
public class LoanList
{
    public int LOAN_PLAN_ID { get; set; }
    public int AMOUNT { get; set; }
    public string INTEREST { get; set; }
    public string PROCESS_FEE { get; set; }
}
