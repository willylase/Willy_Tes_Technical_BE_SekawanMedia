using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Net;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.Enum;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Controllers
{
    [ApiKeyAuthServices]
    public class TransGeneralController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        public TransGeneralController(IUnitOfWork _unitOfWork)
        {
            this.unitOfWork = _unitOfWork;
        }

        [HttpPost("getWorklistInbox")]
        [ProducesResponseType(typeof(GenericResponseData<List<WorklistInbox>>), 200)]
        public IActionResult getWorklistInbox([FromBody] RequestWorklistInbox req_WI)
        {
            int total = 0;
            GenericResponseData<List<WorklistInbox>> _responseData = new GenericResponseData<List<WorklistInbox>>();
            _responseData.Total = total;

            try
            {
                if (req_WI == null)
                {
                    _responseData.Code = (int)HttpStatusCode.MethodNotAllowed;
                    _responseData.Status = HttpStatusCode.MethodNotAllowed.ToString();
                    _responseData.Message = EnumSettings.messageBodyNull;
                    return BadRequest(_responseData);
                }

                var data = unitOfWork.UnitOfWorkTransGeneralRepositories().GetWorklistInbox(req_WI);
                if (data != null && data.Count>0)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Get Worklist Inbox";
                    _responseData.Data = data;
                    _responseData.Total = data.Count;
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

        [HttpPost("actionTicketFlow")]
        [ProducesResponseType(typeof(GenericResponseData<ResponseDB>), 200)]
        public IActionResult actionTicketFlow([FromBody] RequestTicketFlow req_TF)
        {
            int total = 0;
            GenericResponseData<ResponseDB> _responseData = new GenericResponseData<ResponseDB>();
            _responseData.Total = total;

            try
            {
                if (req_TF == null)
                {
                    _responseData.Code = (int)HttpStatusCode.MethodNotAllowed;
                    _responseData.Status = HttpStatusCode.MethodNotAllowed.ToString();
                    _responseData.Message = EnumSettings.messageBodyNull;
                    return BadRequest(_responseData);
                }

                var data = unitOfWork.UnitOfWorkTransGeneralRepositories().ActionTicketFlow(req_TF);
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



    }
}
