using System;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.UsersManagement;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Repositories.IRepositories
{
    public interface IUsersManagementRepositories
    {
        ResponseUsersLogin Login(RequestUsersLogin req_UL);
        ResponseDB LogOut(Guid Users_Id, string Username);
    }
}
