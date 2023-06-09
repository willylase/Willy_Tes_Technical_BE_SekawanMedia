using Microsoft.AspNetCore.Mvc;
using System;
using System.Net;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.Enum;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.Transaction;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Controllers
{
    //[Authorize]
    [ApiKeyAuthServices]
    public class TransactionController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;

        public TransactionController(IUnitOfWork _unitOfWork)
        {
            this.unitOfWork = _unitOfWork;
        }

        [HttpPost("getDocTransactionPemesananKendaraan")]
        [ProducesResponseType(typeof(GenericResponseData<ResponseDocumentPemesananKendaraan>),200)]
        public IActionResult getDocTransactionPemesananKendaraan([FromBody] RequestDocumentPemesananKendaraan req_DPK)
        {
            int total = 0;
            GenericResponseData<ResponseDocumentPemesananKendaraan> _responseData = new GenericResponseData<ResponseDocumentPemesananKendaraan>();
            _responseData.Total = total;

            try 
            { 
                if(req_DPK == null)
                {
                    _responseData.Code = (int)HttpStatusCode.MethodNotAllowed;
                    _responseData.Status = HttpStatusCode.MethodNotAllowed.ToString();
                    _responseData.Message = EnumSettings.messageBodyNull;
                    return BadRequest(_responseData);
                }

                var data = unitOfWork.UnitOfWorkTransactionRepositories().GetDocTransaksiPemesananKendaraan(req_DPK);
                if (data != null && data.detailPemesananKendaraan != null)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Get Doc Transaksi Pemesanan Kendaraan";
                    _responseData.Data = data;
                    _responseData.Total = 3;
                    return Ok(_responseData);
                }
                else
                {
                    _responseData.Code = (int)HttpStatusCode.BadRequest;
                    _responseData.Status = HttpStatusCode.BadRequest.ToString();
                    _responseData.Message = EnumSettings.messageDataNotFound;
                    _responseData.Data = data;
                    return NotFound(_responseData);
                }
            }
            catch(Exception ex)
            {
                int exCode = ex.HResult;
                _responseData.Status = HttpStatusCode.InternalServerError.ToString();
                _responseData.Message = ex.Message;
                if (exCode == -2147467259)
                {
                    _responseData.Code = (int)HttpStatusCode.BadRequest;
                    return BadRequest(_responseData);
                }
                else
                {
                    _responseData.Code = (int)HttpStatusCode.UnprocessableEntity;
                    return UnprocessableEntity(_responseData);
                }
            }
        }

        [HttpPost("addTransactionPemesananKendaraan")]
        [ProducesResponseType(typeof(GenericResponseData<ResponseDB>), 200)]
        public IActionResult addTransactionPemesananKendaraan([FromBody] RequestAddPemesananKendaraan req_EPK)
        {
            int total = 0;
            GenericResponseData<ResponseDB> _responseData = new GenericResponseData<ResponseDB>();
            _responseData.Total = total;

            try
            {
                if (req_EPK == null)
                {
                    _responseData.Code = (int)HttpStatusCode.MethodNotAllowed;
                    _responseData.Status = HttpStatusCode.MethodNotAllowed.ToString();
                    _responseData.Message = EnumSettings.messageBodyNull;
                    return BadRequest(_responseData);
                }

                var data = unitOfWork.UnitOfWorkTransactionRepositories().AddTransaksiPemesananKendaraan(req_EPK);
                if (data != null && data.Is_Success_Activity)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Submited Transaksi Pemesanan Kendaraan";
                    _responseData.Data = data;
                    _responseData.Total = 1;
                    return Ok(_responseData);
                }
                else
                {
                    _responseData.Code = (int)HttpStatusCode.BadRequest;
                    _responseData.Status = HttpStatusCode.BadRequest.ToString();
                    _responseData.Message = EnumSettings.messageDataNotFound;
                    _responseData.Data = data;
                    return NotFound(_responseData);
                }
            }
            catch (Exception ex)
            {
                int exCode = ex.HResult;
                _responseData.Status = HttpStatusCode.InternalServerError.ToString();
                _responseData.Message = ex.Message;
                if (exCode == -2147467259)
                {
                    _responseData.Code = (int)HttpStatusCode.BadRequest;
                    return BadRequest(_responseData);
                }
                else
                {
                    _responseData.Code = (int)HttpStatusCode.UnprocessableEntity;
                    return UnprocessableEntity(_responseData);
                }
            }
        }

        [HttpPost("editTransactionPemesananKendaraan")]
        [ProducesResponseType(typeof(GenericResponseData<ResponseDB>), 200)]
        public IActionResult editTransactionPemesananKendaraan([FromBody] RequestEditPemesananKendaraan req_EPK)
        {
            int total = 0;
            GenericResponseData<ResponseDB> _responseData = new GenericResponseData<ResponseDB>();
            _responseData.Total = total;

            try
            {
                if (req_EPK == null)
                {
                    _responseData.Code = (int)HttpStatusCode.MethodNotAllowed;
                    _responseData.Status = HttpStatusCode.MethodNotAllowed.ToString();
                    _responseData.Message = EnumSettings.messageBodyNull;
                    return BadRequest(_responseData);
                }

                var data = unitOfWork.UnitOfWorkTransactionRepositories().EditTransaksiPemesananKendaraan(req_EPK);
                if (data != null && data.Is_Success_Activity)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Edited Transaksi Pemesanan Kendaraan";
                    _responseData.Data = data;
                    _responseData.Total = 1;
                    return Ok(_responseData);
                }
                else
                {
                    _responseData.Code = (int)HttpStatusCode.BadRequest;
                    _responseData.Status = HttpStatusCode.BadRequest.ToString();
                    _responseData.Message = EnumSettings.messageDataNotFound;
                    _responseData.Data = data;
                    return NotFound(_responseData);
                }
            }
            catch (Exception ex)
            {
                int exCode = ex.HResult;
                _responseData.Status = HttpStatusCode.InternalServerError.ToString();
                _responseData.Message = ex.Message;
                if (exCode == -2147467259)
                {
                    _responseData.Code = (int)HttpStatusCode.BadRequest;
                    return BadRequest(_responseData);
                }
                else
                {
                    _responseData.Code = (int)HttpStatusCode.UnprocessableEntity;
                    return UnprocessableEntity(_responseData);
                }
            }
        }
    }
}
