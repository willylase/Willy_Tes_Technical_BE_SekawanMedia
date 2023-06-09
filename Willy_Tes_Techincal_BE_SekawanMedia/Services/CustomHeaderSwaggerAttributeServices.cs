using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Services
{
    public class CustomHeaderSwaggerAttributeServices : IOperationFilter
    {
        public void Apply(OpenApiOperation operation, OperationFilterContext context)
        {
            if (operation.Parameters == null)
                operation.Parameters = new List<OpenApiParameter>();

            operation.Parameters.Add(new OpenApiParameter
            {
                Name = "ApiKey",
                In = ParameterLocation.Header,
                Required = true,
                Schema = new OpenApiSchema
                {
                    Type = "string"
                }
            });
            //operation.Parameters.Add(new OpenApiParameter
            //{
            //    Name = "Authorization",
            //    In = ParameterLocation.Header,
            //    Required = true,
            //    Schema = new OpenApiSchema
            //    {
            //        Type = "string"
            //    }
            //});
        }

    }
}
