using System;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.UsersManagement
{
    
    public class RequestUsersLogin
    {
        public string email { get; set; }
        public string password { get; set; }
    }
    public class ResponseUsersLogin
    {
        public ResponseDB responseDB { get; set; }
        public UsersLogins userLogins { get; set; }
    }
    public class UsersLogins
    {
        public Guid Users_Id { get; set; }
        public string User_Full_Name { get; set; }
        public string Username { get; set; }
        public string User_Email { get; set; }
        public string User_Phone_Number { get; set; }
        public DateTime User_Birthday { get; set; }
        public Guid Roles_Id { get; set; }
        public string Roles_Description { get; set; }
    }
}
