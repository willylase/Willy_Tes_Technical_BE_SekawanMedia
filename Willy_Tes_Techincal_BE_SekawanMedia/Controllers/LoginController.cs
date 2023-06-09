using Microsoft.AspNetCore.Mvc;
using System;
using System.Net;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.Enum;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.TransGeneral;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.UsersManagement;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Controllers
{
    [ApiKeyAuthServices]
    public class LoginController : ControllerBase
    {
        private readonly IUnitOfWork unitOfWork;
        public LoginController(IUnitOfWork _unitOfWork)
        {
            this.unitOfWork = _unitOfWork;
        }

        [HttpPost("login")]
        [ProducesResponseType(typeof(GenericResponseData<ResponseUsersLogin>), 200)]
        public IActionResult login([FromBody] RequestUsersLogin req_UL)
        {
            int total = 0;
            GenericResponseData<ResponseUsersLogin> _responseData = new GenericResponseData<ResponseUsersLogin>();
            _responseData.Total = total;

            try
            {
                var data = unitOfWork.UnitOfWorkUsersManagementRepositories().Login(req_UL);
                if (data != null && data.responseDB.Is_Success_Activity)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Login";
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

        [HttpPost("logout/{Users_Id}/{Username}")]
        [ProducesResponseType(typeof(GenericResponseData<ResponseUsersLogin>), 200)]
        public IActionResult logout(Guid Users_Id, string Username)
        {
            int total = 0;
            GenericResponseData<ResponseDB> _responseData = new GenericResponseData<ResponseDB>();
            _responseData.Total = total;

            try
            {
                var data = unitOfWork.UnitOfWorkUsersManagementRepositories().LogOut(Users_Id, Username);
                if (data != null && data.Is_Success_Activity)
                {
                    _responseData.Code = (int)HttpStatusCode.OK;
                    _responseData.Status = HttpStatusCode.OK.ToString();
                    _responseData.Message = "Logout";
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
