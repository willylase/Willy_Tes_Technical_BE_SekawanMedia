using System;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.MasterData
{
    public class Driver
    {
        public Guid Users_Id { get; set; }
        public string Driver_Name { get; set; }
        public string Driver_Phone_Number { get; set; }
        public string Driver_Email { get; set; }
        public string Driver_Address { get; set; }
        public DateTime Driver_Birthday { get; set; }
    }
}
