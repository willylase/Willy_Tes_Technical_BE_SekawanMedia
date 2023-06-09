using System;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral
{
    public class ValidateTicketFlow
    {
        public Guid Document_Transaction_Id { get; set; }
        public Guid Submit_By_User_Id { get; set; }
        public string Remarks { get; set; }
        public bool Is_Approved { get; set; }
        public bool Is_Reject { get; set; }
    }
    public class RequestTicketFlow
    {
        public Guid Users_Id { get; set; }
        public string Username { get; set; }
        public ValidateTicketFlow validateTicketFlow { get; set; }
    }
}
