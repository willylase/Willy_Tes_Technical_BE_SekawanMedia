using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Xml.Linq;
using System.Linq;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;
using Willy_Tes_Techincal_BE_SekawanMedia.Repositories.IRepositories;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using System.Collections.Generic;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Repositories
{
    public class TransGeneralRepositories : DatabaseConfig, ITransGeneralRepositories
    {
        public TransGeneralRepositories() : base() { }
        public TransGeneralRepositories(DatabaseContext context) : base(context) { }
        public ResponseDB ActionTicketFlow(RequestTicketFlow req_TK)
        {
            DataSet ds = new DataSet();
            ResponseDB responseDB = new ResponseDB();

            string xmlTicketFlow = ConvertTicketFlowToXML(req_TK.validateTicketFlow);
            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Ticket_Flow";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("Users_Id", req_TK.Users_Id));
                    cmd.Parameters.Add(new SqlParameter("Username", req_TK.Username));
                    cmd.Parameters.Add(new SqlParameter("Validate_Ticket_Flow", xmlTicketFlow));

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }

                    responseDB = (from DataRow dr in ds.Tables[0].Rows
                                  select new ResponseDB()
                                  {
                                      Is_Success_Activity = bool.Parse(dr["Is_Success_Activity"].ToString()),
                                      Response_DB_Message = dr["Response_DB_Message"].ToString()
                                  }).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responseDB;
        }
        public List<WorklistInbox> GetWorklistInbox(RequestWorklistInbox req_WI)
        {
            DataSet ds = new DataSet();
            List<WorklistInbox> responseDB = new List<WorklistInbox>();
            
            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Get_Worklist_Inbox";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("Users_Id", req_WI.Users_Id));
                    cmd.Parameters.Add(new SqlParameter("DateFrom", req_WI.DateFrom));
                    cmd.Parameters.Add(new SqlParameter("DateTo", req_WI.DateTo));
                    cmd.Parameters.Add(new SqlParameter("Transaction_Document_Type_Id", req_WI.Transaction_Document_Type_Id));
                    cmd.Parameters.Add(new SqlParameter("Is_Inbox", req_WI.Is_Inbox));
                    cmd.Parameters.Add(new SqlParameter("Search", req_WI.Search));

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }

                    responseDB = (from DataRow dr in ds.Tables[0].Rows
                                  select new WorklistInbox()
                                  {
                                      Document_Transaction_Id = Guid.Parse(dr["Document_Transaction_Id"].ToString()),
                                      Document_Transaction_Name  = dr["Document_Transaction_Name"].ToString(),
                                      Document_Transaction_Date = DateTime.Parse(dr["Document_Transaction_Date"].ToString()),
                                      Transaction_Document_Type_Id = Guid.Parse(dr["Transaction_Document_Type_Id"].ToString()),
                                      Transaction_Document_Type_Name = dr["Transaction_Document_Type_Name"].ToString(),
                                      Submit_By_Name = dr["Submit_By_Name"].ToString(),
                                      Submit_By_User_Id = Guid.Parse(dr["Submit_By_User_Id"].ToString()),
                                      Submit_By_Roles_Id  = Guid.Parse(dr["Submit_By_Roles_Id"].ToString()),
                                      Kendaraan_Id = Guid.Parse(dr["Kendaraan_Id"].ToString()),
                                      Merk  = dr["Merk"].ToString(),
                                      Used_By_Drived_Id = Guid.Parse(dr["Used_By_Driver_Id"].ToString()),
                                      Used_By_Driver_Name = dr["Used_By_Driver_Name"].ToString(),
                                      Document_Status_Id = Int16.Parse(dr["Document_Status_Id"].ToString()),
                                      Document_Status_Description  = dr["Document_Status_Description"].ToString()
                                  }).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responseDB;

        }

        public static string ConvertTicketFlowToXML(ValidateTicketFlow data)
        {
            XDocument doc = new XDocument(new XDeclaration("1.0", "UTF-8", "yes"),
                new XElement("root",
                    new XElement("row",
                        new XAttribute("Document_Transaction_Id", data.Document_Transaction_Id),
                        new XAttribute("Submit_By_User_Id", data.Submit_By_User_Id),
                        new XAttribute("Remarks", data.Remarks),
                        new XAttribute("Is_Approved", data.Is_Approved),
                        new XAttribute("Is_Reject", data.Is_Reject)
                  )
               ));
            return doc.ToString();
        }
    }
}
