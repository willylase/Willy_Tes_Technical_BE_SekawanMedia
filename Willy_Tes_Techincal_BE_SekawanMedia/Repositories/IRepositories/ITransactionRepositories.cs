using Willy_Tes_Techincal_BE_SekawanMedia.Models.Transaction;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Repositories.IRepositories
{
    public interface ITransactionRepositories
    {
        ResponseDB AddTransaksiPemesananKendaraan(RequestAddPemesananKendaraan req_APK);
        ResponseDB EditTransaksiPemesananKendaraan(RequestEditPemesananKendaraan req_EPK);
        ResponseDocumentPemesananKendaraan GetDocTransaksiPemesananKendaraan(RequestDocumentPemesananKendaraan req_DPK);
    }
}
