using System;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral
{
    public class WorklistInbox
    {
        public Guid Document_Transaction_Id { get; set; }
        public string Document_Transaction_Name { get; set; }
        public DateTime Document_Transaction_Date { get; set; }
        public Guid Transaction_Document_Type_Id { get; set; }
        public string Transaction_Document_Type_Name { get; set; }
        public string Submit_By_Name { get; set; }
        public Guid Submit_By_User_Id { get; set; }
        public Guid Submit_By_Roles_Id { get; set; }
        public Guid Kendaraan_Id { get; set; }
        public string Merk { get; set; }
        public Guid Used_By_Drived_Id { get; set; }
        public string Used_By_Driver_Name { get; set; }
        public Int16 Document_Status_Id { get; set; }
        public string Document_Status_Description { get; set; }
    }

    public class RequestWorklistInbox
    {
        public Guid Users_Id { get; set; }
        public DateTime DateFrom { get; set; }
        public DateTime DateTo { get; set; }
        public Guid Transaction_Document_Type_Id { get; set; }
        public bool Is_Inbox { get; set; }
        public string Search { get; set; }
    }

}
