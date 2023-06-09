using System;
using System.Collections.Generic;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.Transaction
{
    public class DetailPemesananKendaraan
    {
        public Guid Document_Transaction_Id { get; set; }
        public string Document_Transaction_Name { get; set; }
        public DateTime Document_Transaction_Date { get; set; }
        public DateTime Period_Date_From { get; set; }
        public DateTime Period_Date_To { get; set; }
        public Guid Transaction_Document_Type_Id { get; set; }
        public Guid Submit_By_User_Id { get; set; }
        public string Submit_By_Name { get; set; }
        public Guid Submit_By_Roles_Id { get; set; }
        public Guid Used_By_Driver_Id { get; set; }
        public string Used_By_Driver_Name { get; set; }
        public string Driver_Email { get; set; }
        public Guid Kendaraan_Id { get; set; }
    }
    public class ResponseDetailPemesananKendaraan
    {
        public Guid Document_Transaction_Id { get; set; }
        public string Document_Transaction_Name { get; set; }
        public DateTime Document_Transaction_Date { get; set; }
        public DateTime Period_Date_From { get; set; }
        public DateTime Period_Date_To { get; set; }
        public Guid Submit_By_User_Id { get; set; }
        public string Submit_By_Name { get; set; }
        public Guid Submit_By_Roles_Id { get; set; }
        public Guid Used_By_Driver_Id { get; set; }
        public string Used_By_Driver_Name { get; set; }
        public string Driver_Email { get; set; }
        public Guid Kendaraan_Id { get; set; }
        public string Nama_Pemilik { get; set; }
        public string Nomor_STNK { get; set; }
        public string Nomor_BPKB { get; set; }
        public string Warna { get; set; }
        public string Jenis { get; set; }
        public string Model { get; set; }
        public string Bahan_Bakar { get; set; }
        public string Merk { get; set; }
    }
    public class RequestAddPemesananKendaraan
    {
        public Guid Users_Id { get; set; }
        public string Username { get; set; }
        public DetailPemesananKendaraan detailsPemesanan { get; set; }
    }

    public class RequestEditPemesananKendaraan
    {
        public Guid Users_Id { get; set; }
        public string Username { get; set; }
        public Guid Document_Transaction_Id { get; set; }
        public DetailPemesananKendaraan detailsPemesanan { get; set; }
    }

    public class RequestDocumentPemesananKendaraan
    {
        public Guid Users_Id { get; set; }
        public Guid Document_Transaction_Id { get; set; }
        public Guid Submit_By_User_Id { get; set; }
        public Guid Transaction_Document_Type_Id { get; set; }

    }
    public class ResponseDocumentPemesananKendaraan
    {
        public ResponseDetailPemesananKendaraan detailPemesananKendaraan { get; set; }
        public List<InformationRoadMaps> listInformationRoadMaps { get; set; }
        public List<HistoryRoadMaps> listHistoryRoadMaps { get; set; }
    }
}
