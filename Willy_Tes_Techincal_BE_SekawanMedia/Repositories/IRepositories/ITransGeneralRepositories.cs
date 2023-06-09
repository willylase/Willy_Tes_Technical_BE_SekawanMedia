using System.Collections.Generic;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.Transaction;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Repositories.IRepositories
{
    public interface ITransGeneralRepositories
    {
        ResponseDB ActionTicketFlow(RequestTicketFlow req_TK);
        List<WorklistInbox> GetWorklistInbox(RequestWorklistInbox req_WI);
    }
}
