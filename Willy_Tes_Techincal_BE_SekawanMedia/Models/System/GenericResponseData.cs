namespace Willy_Tes_Techincal_BE_SekawanMedia.Models.System
{
    public class GenericResponseData<T>
    {
        public string Status { get; set; }
        public int Code { get; set; }
        public string Message { get; set; }
        public T Data { get; set; }
        public int Total { get; set; }
    }
}
