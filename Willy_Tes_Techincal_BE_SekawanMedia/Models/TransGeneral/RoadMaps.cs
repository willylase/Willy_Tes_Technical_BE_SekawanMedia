using System;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral
{
    public class InformationRoadMaps
    {
        public Int16 Steps_Numbers { get; set; }
        public string User_Full_Name { get; set; }
        public string Roles_Description { get; set; }
        public string Document_Status_Description { get; set; }
    }
    public class HistoryRoadMaps
    {
        public Int16 Steps_Numbers { get; set; }
        public string User_Full_Name { get; set; }
        public string Roles_Description { get; set; }
        public string Document_Status_Description { get; set; }
        public DateTime Action_Date_Time { get; set; }
        public bool Is_Active_Inbox { get; set; }
        public bool Is_Reject { get; set; }
        public bool Is_Approved { get; set; }
        public string Remarks { get; set; }
    }
}
