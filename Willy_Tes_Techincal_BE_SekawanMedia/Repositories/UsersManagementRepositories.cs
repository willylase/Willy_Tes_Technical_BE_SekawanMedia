
using Microsoft.Data.SqlClient;
using System;
using System.Data;
using System.Linq;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.UsersManagement;
using Willy_Tes_Techincal_BE_SekawanMedia.Repositories.IRepositories;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Repositories
{
    public class UsersManagementRepositories : DatabaseConfig, IUsersManagementRepositories
    {
        public UsersManagementRepositories() : base() { }
        public UsersManagementRepositories(DatabaseContext context) : base(context) { }

        public ResponseUsersLogin Login(RequestUsersLogin req_UL)
        {
            DataSet ds_ResUL = new DataSet();
            ResponseUsersLogin responseUL = new ResponseUsersLogin();

            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_Login";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("Email", req_UL.email));
                    cmd.Parameters.Add(new SqlParameter("Password", req_UL.password));

                    using (var da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds_ResUL);
                    }

                    responseUL.responseDB = (from DataRow dr in ds_ResUL.Tables[0].Rows
                                             select new ResponseDB()
                                             {
                                                 Is_Success_Activity = bool.Parse(dr["Is_Success_Activity"].ToString()),
                                                 Response_DB_Message = dr["Response_DB_Message"].ToString()
                                             }).FirstOrDefault();

                    responseUL.userLogins = (from DataRow dr in ds_ResUL.Tables[1].Rows
                                             select new UsersLogins()
                                             {
                                                 Users_Id = Guid.Parse(dr["Users_Id"].ToString()),
                                                 User_Full_Name = dr["User_Full_Name"].ToString(),
                                                 Username = dr["Username"].ToString(),
                                                 User_Email = dr["User_Email"].ToString(),
                                                 User_Phone_Number = dr["User_Phone_Number"].ToString(),
                                                 User_Birthday = DateTime.Parse(dr["User_Birthday"].ToString()),
                                                 Roles_Id = Guid.Parse(dr["Roles_Id"].ToString()),
                                                 Roles_Description = dr["Roles_Description"].ToString()
                                             }).FirstOrDefault();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            return responseUL;
        }

        public ResponseDB LogOut(Guid Users_Id, string Username)
        {
            DataSet ds = new DataSet();
            ResponseDB responseDB = new ResponseDB();
            try
            {
                using (SqlConnection connsql = new SqlConnection(ValueSystem.DB_My_Tes_BE))
                {
                    connsql.Open();

                    SqlCommand cmd = connsql.CreateCommand();
                    cmd.CommandText = "sp_LogOut";
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add(new SqlParameter("Users_Id", Users_Id));
                    cmd.Parameters.Add(new SqlParameter("Username", Username));

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
    }
}
