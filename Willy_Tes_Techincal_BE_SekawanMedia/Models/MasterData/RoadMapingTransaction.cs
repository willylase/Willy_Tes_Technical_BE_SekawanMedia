using System;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.MasterData
{
    public class RoadMapingTransaction
    {
        public Guid Road_Maping_Transaction_Id { get; set; }
        public string Road_Maping_Transaction_Name { get; set; }
        public Int16 Steps_Numbers { get; set; }
        public Guid Steps_Approval_Roles_Id { get; set; }
    }
}
