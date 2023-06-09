using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Net;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.Enum;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.MasterData;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Controllers
{
    [ApiKeyAuthServices]
    public class MasterDataController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        public MasterDataController(IUnitOfWork _unitOfWork)
        {
            this.unitOfWork = _unitOfWork;
        }

        [HttpGet("getKendaraan")]
        [ProducesResponseType(typeof(GenericResponseData<List<Kendaraan>>), 200)]
        public IActionResult getKendaraan()
        {
            int total = 0;
            GenericResponseData<List<Kendaraan>> _responseData = new GenericResponseData<List<Kendaraan>>();
            _responseData.Total = total;

            try
            {
                var data = unitOfWork.UnitOfWorkMasterDataRepositories().GetKendaraan();
                if (data != null && data.Count > 0)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Get List Kendaraan";
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

        [HttpGet("getRoles")]
        [ProducesResponseType(typeof(GenericResponseData<List<Roles>>), 200)]
        public IActionResult getRoles()
        {
            int total = 0;
            GenericResponseData<List<Roles>> _responseData = new GenericResponseData<List<Roles>>();
            _responseData.Total = total;

            try
            {
                var data = unitOfWork.UnitOfWorkMasterDataRepositories().GetRoles();
                if (data != null && data.Count > 0)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Get List Roles";
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

        [HttpGet("getRoadMapingTransaction")]
        [ProducesResponseType(typeof(GenericResponseData<List<RoadMapingTransaction>>), 200)]
        public IActionResult getRoadMapingTransaction()
        {
            int total = 0;
            GenericResponseData<List<RoadMapingTransaction>> _responseData = new GenericResponseData<List<RoadMapingTransaction>>();
            _responseData.Total = total;

            try
            {
                var data = unitOfWork.UnitOfWorkMasterDataRepositories().GetRoadMapingTransaction();
                if (data != null && data.Count > 0)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Get List Road Maping Transaction";
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

        [HttpGet("getTransactionDocumentType")]
        [ProducesResponseType(typeof(GenericResponseData<List<TransactionDocumentType>>), 200)]
        public IActionResult getTransactionDocumentType()
        {
            int total = 0;
            GenericResponseData<List<TransactionDocumentType>> _responseData = new GenericResponseData<List<TransactionDocumentType>>();
            _responseData.Total = total;

            try
            {
                var data = unitOfWork.UnitOfWorkMasterDataRepositories().GetTransactionDocumentType();
                if (data != null && data.Count > 0)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Get List Transaction Document Type";
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

    }
}
