using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Linq;
using System.Xml.Linq;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.Transaction;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;
using Willy_Tes_Techincal_BE_SekawanMedia.Repositories.IRepositories;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Repositories
{
    public class TransactionRepositories : DatabaseConfig, ITransactionRepositories
    {
        public TransactionRepositories() : base() { }
        public TransactionRepositories(DatabaseContext context) : base(context) { }
        public ResponseDB AddTransaksiPemesananKendaraan(RequestAddPemesananKendaraan req_APK)
        {
            DataSet ds = new DataSet();
            ResponseDB responseDB = new ResponseDB();
            string xmlDetailPemesanan = ConvertDetailPemesananKendaraanToXML(req_APK.detailsPemesanan);

            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Add_Transaction";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("Users_Id", req_APK.Users_Id));
                    cmd.Parameters.Add(new SqlParameter("Username", req_APK.Username));
                    cmd.Parameters.Add(new SqlParameter("Document_Transaction", xmlDetailPemesanan));

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

        public ResponseDB EditTransaksiPemesananKendaraan(RequestEditPemesananKendaraan req_EPK)
        {
            DataSet ds = new DataSet();
            ResponseDB responseDB = new ResponseDB();
            string xmlDetailPemesanan = ConvertDetailPemesananKendaraanToXML(req_EPK.detailsPemesanan);

            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Edit_Transaction";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("Users_Id", req_EPK.Users_Id));
                    cmd.Parameters.Add(new SqlParameter("Username", req_EPK.Username));
                    cmd.Parameters.Add(new SqlParameter("Document_Transaction_Id", req_EPK.Username));
                    cmd.Parameters.Add(new SqlParameter("Document_Transaction", xmlDetailPemesanan));

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

        public ResponseDocumentPemesananKendaraan GetDocTransaksiPemesananKendaraan(RequestDocumentPemesananKendaraan req_DPK)
        {
            DataSet ds = new DataSet();
            ResponseDocumentPemesananKendaraan responseDB = new ResponseDocumentPemesananKendaraan();

            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Get_Transaction";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("Users_Id", req_DPK.Users_Id));
                    cmd.Parameters.Add(new SqlParameter("Document_Transaction_Id", req_DPK.Document_Transaction_Id));
                    cmd.Parameters.Add(new SqlParameter("Submit_By_User_Id", req_DPK.Submit_By_User_Id));
                    cmd.Parameters.Add(new SqlParameter("Transaction_Document_Type_Id", req_DPK.Transaction_Document_Type_Id));

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                    responseDB.detailPemesananKendaraan = (from DataRow dr in ds.Tables[0].Rows
                                                           select new ResponseDetailPemesananKendaraan()
                                                           {
                                                               Document_Transaction_Id = Guid.Parse(dr["Document_Transaction_Id"].ToString()),
                                                               Document_Transaction_Name = dr["Document_Transaction_Name"].ToString(),
                                                               Document_Transaction_Date = DateTime.Parse(dr["Document_Transaction_Date"].ToString()),
                                                               Period_Date_From = DateTime.Parse(dr["Period_Date_From"].ToString()),
                                                               Period_Date_To = DateTime.Parse(dr["Period_Date_To"].ToString()),
                                                               Submit_By_User_Id = Guid.Parse(dr["Submit_By_User_Id"].ToString()),
                                                               Submit_By_Name = dr["Submit_By_Name"].ToString(),
                                                               Submit_By_Roles_Id = Guid.Parse(dr["Submit_By_Roles_Id"].ToString()),
                                                               Used_By_Driver_Id = Guid.Parse(dr["Used_By_Driver_Id"].ToString()),
                                                               Used_By_Driver_Name = dr["Used_By_Driver_Name"].ToString(),
                                                               Driver_Email = dr["Driver_Email"].ToString(),
                                                               Kendaraan_Id = Guid.Parse(dr["Kendaraan_Id"].ToString()),
                                                               Nama_Pemilik = dr["Nama_Pemilik"].ToString(),
                                                               Nomor_STNK = dr["Nomor_STNK"].ToString(),
                                                               Nomor_BPKB = dr["Nomor_BPKB"].ToString(),
                                                               Warna = dr["Warna"].ToString(),
                                                               Jenis = dr["Jenis"].ToString(),
                                                               Model = dr["Model"].ToString(),
                                                               Bahan_Bakar = dr["Bahan_Bakar"].ToString(),
                                                               Merk = dr["Merk"].ToString()
                                                           }).FirstOrDefault();

                    responseDB.listInformationRoadMaps = (from DataRow dr in ds.Tables[1].Rows
                                                          select new InformationRoadMaps()
                                                          {
                                                              Steps_Numbers = Int16.Parse(dr["Steps_Numbers"].ToString()),
                                                              User_Full_Name = dr["User_Full_Name"].ToString(),
                                                              Roles_Description = dr["Roles_Description"].ToString(),
                                                              Document_Status_Description = dr["Document_Status_Description"].ToString(),
                                                          }).ToList();

                    responseDB.listHistoryRoadMaps = (from DataRow dr in ds.Tables[2].Rows
                                                      select new HistoryRoadMaps()
                                                      {
                                                          Steps_Numbers = Int16.Parse(dr["Steps_Numbers"].ToString()),
                                                          User_Full_Name = dr["User_Full_Name"].ToString(),
                                                          Roles_Description = dr["Roles_Description"].ToString(),
                                                          Document_Status_Description = dr["Document_Status_Description"].ToString(),
                                                          Action_Date_Time = DateTime.Parse(dr["Action_Date_Time"].ToString()),
                                                          Is_Active_Inbox = bool.Parse(dr["Is_Active_Inbox"].ToString()),
                                                          Is_Reject = bool.Parse(dr["Is_Reject"].ToString()),
                                                          Is_Approved = bool.Parse(dr["Is_Approved"].ToString()),
                                                          Remarks = dr["Remarks"].ToString(),
                                                      }).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responseDB;
        } 

        public static string ConvertDetailPemesananKendaraanToXML(DetailPemesananKendaraan DPK)
        {
            XDocument doc = new XDocument(new XDeclaration("1.0", "UTF-8", "yes"),
                new XElement("root",
                    new XElement("row",
                        new XAttribute("Document_Transaction_Id", DPK.Document_Transaction_Id),
                        new XAttribute("Document_Transaction_Name", DPK.Document_Transaction_Name),
                        new XAttribute("Document_Transaction_Date", DPK.Document_Transaction_Date),
                        new XAttribute("Period_Date_From", DPK.Period_Date_From),
                        new XAttribute("Period_Date_To", DPK.Period_Date_To),
                        new XAttribute("Transaction_Document_Type_Id", DPK.Transaction_Document_Type_Id),
                        new XAttribute("Submit_By_User_Id", DPK.Submit_By_User_Id),
                        new XAttribute("Submit_By_Name", DPK.Submit_By_Name),
                        new XAttribute("Submit_By_Roles_Id", DPK.Submit_By_Roles_Id),
                        new XAttribute("Used_By_Driver_Id", DPK.Used_By_Driver_Id),
                        new XAttribute("Used_By_Driver_Name", DPK.Used_By_Driver_Name),
                        new XAttribute("Driver_Email", DPK.Driver_Email),
                        new XAttribute("Kendaraan_Id", DPK.Kendaraan_Id)
                  )
               ));
            return doc.ToString();
        }

    }
}
