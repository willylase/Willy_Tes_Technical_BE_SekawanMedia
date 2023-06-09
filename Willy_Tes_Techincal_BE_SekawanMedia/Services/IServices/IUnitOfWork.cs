using System;
using Willy_Tes_Techincal_BE_SekawanMedia.Repositories;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices
{
    public interface IUnitOfWork : IDisposable
    {
        MasterDataRepositories UnitOfWorkMasterDataRepositories();
        TransactionRepositories UnitOfWorkTransactionRepositories();
        TransGeneralRepositories UnitOfWorkTransGeneralRepositories();
        UsersManagementRepositories UnitOfWorkUsersManagementRepositories();
    }
}
