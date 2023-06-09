using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Threading.Tasks;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Services
{
    public class ApiKeyAuthServices : Attribute, IAsyncActionFilter
    {
        private const string ApiKeyHeaderName = "ApiKey";
        public async Task OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next)
        {
            if (!context.HttpContext.Request.Headers.TryGetValue(ApiKeyHeaderName, out var potentialApiKey))
            {
                context.Result = new UnauthorizedResult();
                return;
            }

            //var configuration = context.HttpContext.RequestServices.GetRequiredService<I>()
            var apiKey = ValueSystem.System_ApiKey;
            if (!apiKey.Equals(potentialApiKey))
            {
                context.Result = new UnauthorizedResult();
                return;
            }
            await next();
        }
    }
}
