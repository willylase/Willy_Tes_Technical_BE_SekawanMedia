using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.MasterData;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using Willy_Tes_Techincal_BE_SekawanMedia.Repositories.IRepositories;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Repositories
{
    public class MasterDataRepositories : DatabaseConfig, IMasterDataRepositories
    {
        public MasterDataRepositories() : base() { }
        public MasterDataRepositories(DatabaseContext context) : base(context) { }

        public List<Kendaraan> GetKendaraan()
        {
            DataSet ds = new DataSet();
            List<Kendaraan> responseDB = new List<Kendaraan>();

            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Get_Kendaraan";
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                    responseDB = (from DataRow dr in ds.Tables[0].Rows
                                  select new Kendaraan()
                                  {
                                      Kendaraan_Id = Guid.Parse(dr["Kendaraan_Id"].ToString()),
                                      Nama_Pemilik = dr["Nama_Pemilik"].ToString(),
                                      Nomor_Registrasi = dr["Nomor_Registrasi"].ToString(),
                                      Merk = dr["Merk"].ToString(),
                                      Type = dr["Type"].ToString(),
                                      Jenis = dr["Jenis"].ToString(),
                                      Model = dr["Model"].ToString(),
                                      Tahun_Pembuatan = dr["Tahun_Pembuatan"].ToString(),
                                      Isi_Silinder = dr["Isi_Silinder"].ToString(),
                                      Nomor_Rangka = dr["Nomor_Rangka"].ToString(),
                                      Nomor_Mesin = dr["Nomor_Mesin"].ToString(),
                                      Warna = dr["Warna"].ToString(),
                                      Bahan_Bakar = dr["Bahan_Bakar"].ToString(),
                                      Tahun_Registrasi = dr["Tahun_Registrasi"].ToString(),
                                      Nomor_BPKB = dr["Nomor_BPKB"].ToString(),
                                      Nomor_STNK = dr["Nomor_STNK"].ToString()
                                  }).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responseDB;
        }

        public List<Roles> GetRoles()
        {
            DataSet ds = new DataSet();
            List<Roles> responseDB = new List<Roles>();

            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Get_Roles";
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                    responseDB = (from DataRow dr in ds.Tables[0].Rows
                                  select new Roles()
                                  {
                                      Roles_Id = Guid.Parse(dr["Roles_Id"].ToString()),
                                      Roles_Code = dr["Roles_Code"].ToString(),
                                      Roles_Description = dr["Roles_Description"].ToString()
                                  }).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responseDB;
        }

        public List<RoadMapingTransaction> GetRoadMapingTransaction()
        {
            DataSet ds = new DataSet();
            List<RoadMapingTransaction> responseDB = new List<RoadMapingTransaction>();

            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Get_Road_Maping_Transaction";
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                    responseDB = (from DataRow dr in ds.Tables[0].Rows
                                  select new RoadMapingTransaction()
                                  {
                                      Road_Maping_Transaction_Id = Guid.Parse(dr["Road_Maping_Transaction_Id"].ToString()),
                                      Road_Maping_Transaction_Name = dr["Road_Maping_Transaction_Name"].ToString(),
                                      Steps_Numbers = Int16.Parse(dr["Steps_Numbers"].ToString()),
                                      Steps_Approval_Roles_Id = Guid.Parse(dr["Steps_Approval_Roles_Id"].ToString())
                                  }).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responseDB;
        }

        public List<TransactionDocumentType> GetTransactionDocumentType()
        {
            DataSet ds = new DataSet();
            List<TransactionDocumentType> responseDB = new List<TransactionDocumentType>();

            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Get_Transaction_Document_Type";
                    cmd.CommandType = CommandType.StoredProcedure;

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                    responseDB = (from DataRow dr in ds.Tables[0].Rows
                                  select new TransactionDocumentType()
                                  {
                                      Transaction_Document_Type_Id = Guid.Parse(dr["Transaction_Document_Type_Id"].ToString()),
                                      Transaction_Document_Type_Name = dr["Transaction_Document_Type_Name"].ToString()
                                  }).ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responseDB;
        }


    }
}
