using System;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.MasterData
{
    public class Kendaraan
    {
        public Guid Kendaraan_Id { get; set; }
        public string Nama_Pemilik { get; set; }
        public string Nomor_Registrasi { get; set; }
        public string Merk { get; set; }
        public string Type { get; set; }
        public string Jenis { get; set; }
        public string Model { get; set; }
        public string Tahun_Pembuatan { get; set; }
        public string Isi_Silinder { get; set; }
        public string Nomor_Rangka { get; set; }
        public string Nomor_Mesin { get; set; }
        public string Warna { get; set; }
        public string Bahan_Bakar { get; set; }
        public string Tahun_Registrasi { get; set; }
        public string Nomor_BPKB { get; set; }
        public string Nomor_STNK { get; set; }
    }
}
