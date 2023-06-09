using System.Collections.Generic;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.MasterData;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Repositories.IRepositories
{
    public interface IMasterDataRepositories
    {
        List<Kendaraan> GetKendaraan();
        List<Roles> GetRoles();
        List<RoadMapingTransaction> GetRoadMapingTransaction();
        List<TransactionDocumentType> GetTransactionDocumentType();
    }
}
