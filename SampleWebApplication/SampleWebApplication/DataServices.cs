using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace SampleWebApplication
{
    public class DataServices    {

        private string sDBConnectionString = ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString.Trim();
        
        private string sUpdateQuery1 = @"UPDATE tDealerMenu SET Activation_Date = '{0}', eRating = '{1}', eContracting = '{2}'  
                     WHERE Dealer_ID = {3} AND Menu_Code = '{4}'";

        private string sUpdateQuery2 = @"UPDATE tDealerMenu SET Activation_Date = NULL, eRating = 'False', eContracting = 'False'  
                     WHERE Dealer_ID = {0} AND Menu_Code = '{1}'";

        private string sQuery = String.Empty;

        private SqlCommand objCmd = null;

        public DataTable GetGridViewData()
        {
            try
            {
                using (SqlConnection objConn = new SqlConnection(sDBConnectionString))
                {
                    objConn.Open();
                    string query = @"SELECT [Menu_Description]
                                      ,[Activation_Date]
                                      ,ISNULL([eRating],0) as ""eRating""
                                      ,ISNULL([eContracting],0) as ""eContracting""
                                      ,[Dealer_ID]
                                      ,b.[Menu_Code]
                                  FROM [dbo].[tMenuMaster] a INNER JOIN [dbo].[tDealerMenu] b
                                  ON a.TPA_Code = 'TPA01' and a.Menu_Code = b.Menu_Code";
                    SqlCommand objCmd = new SqlCommand(query, objConn);
                    objCmd.CommandType = CommandType.Text;
                    SqlDataAdapter objAdp = new SqlDataAdapter(objCmd);
                    DataSet data = new DataSet();
                    objAdp.Fill(data);
                    return data.Tables[0];
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        
        }


        public void UpdateGridData(DealerMenu dm)
        {

            try
            {
                using (SqlConnection objConn = new SqlConnection(sDBConnectionString))
                {
                    objConn.Open();

                    if (dm.Active == true)
                    {
                        sQuery = String.Format(sUpdateQuery1, dm.ActivationDate.ToString(),
                            dm.eRating.ToString(), dm.eContracting.ToString(),
                            dm.DealerID.ToString(), dm.MenuCode.ToString());
                        objCmd = new SqlCommand(sQuery, objConn);
                    }
                    else
                    {
                        sQuery = String.Format(sUpdateQuery2, dm.DealerID.ToString(), dm.MenuCode.ToString());
                        objCmd = new SqlCommand(sQuery, objConn);
                    }

                    objCmd.CommandType = CommandType.Text;
                    objCmd.ExecuteNonQuery();
                    objCmd = null;
                    sQuery = String.Empty;
                }
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }

    }
}