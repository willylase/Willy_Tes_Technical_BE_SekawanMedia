using System;
using Willy_Tes_Techincal_BE_SekawanMedia.Repositories;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Services
{
    public class UnitOfWork : IUnitOfWork
    {
        internal DatabaseContext Context;
        private MasterDataRepositories masterDataRepositories;
        private TransactionRepositories transactionRepositories;
        private TransGeneralRepositories transGeneralRepositories;
        private UsersManagementRepositories usersManagementRepositories;
        
        public MasterDataRepositories UnitOfWorkMasterDataRepositories()
        {
            if (masterDataRepositories == null)
            {
                masterDataRepositories = new MasterDataRepositories(Context);
            }
            return masterDataRepositories;
        }

        public TransactionRepositories UnitOfWorkTransactionRepositories()
        {
            if(transactionRepositories == null)
            {
                transactionRepositories = new TransactionRepositories(Context);
            }
            return transactionRepositories;
        }

        public TransGeneralRepositories UnitOfWorkTransGeneralRepositories()
        {
            if (transGeneralRepositories == null)
            {
                transGeneralRepositories = new TransGeneralRepositories(Context);
            }
            return transGeneralRepositories;
        }

        public UsersManagementRepositories UnitOfWorkUsersManagementRepositories()
        {
            if (usersManagementRepositories == null)
            {
                usersManagementRepositories = new UsersManagementRepositories(Context);
            }
            return usersManagementRepositories;
        }

        public UnitOfWork(DatabaseContext _context)
        {

            Context = _context;

        }

        public bool Disposing;

        private void DisposingProperties()
        {

            if (Context != null)
            {

                Context.Dispose();

            }

        }

        protected virtual void Disposed(bool _disposing)
        {

            if (!Disposing)
            {

                if (_disposing)
                {

                    DisposingProperties();

                }

            }

            Disposing = true;

        }

        public void Dispose()
        {

            Disposed(true);
            GC.SuppressFinalize(this);

        }
    }
}
