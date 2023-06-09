using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.OpenApi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.Enum;
using Willy_Tes_Techincal_BE_SekawanMedia.Models.System;
using Willy_Tes_Techincal_BE_SekawanMedia.Services;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            // untuk setting default values di static variable
            SetApplicationSettings();

            // untuk setting constring DB context
            services.AddDbContext<DatabaseContext>(options => options.UseSqlServer(ValueSystem.DB_My_Tes_BE));

            //// untuk mendaftarkan Interface dan class service / repository yang bersangkutan
            services.AddTransient<IUnitOfWork, UnitOfWork>();

            //services AddCors & AddPolicy (Configuration); > allow all origin method header and credential
            services.AddCors();

            services.AddControllers();

            services.AddMvc();

            services.AddSwaggerGen(options =>
            {
                options.SwaggerDoc("v2", new Microsoft.OpenApi.Models.OpenApiInfo
                {
                    Title = "API Pemesanan Kendaraan",
                    Version = "v2",
                    Description = "API Pemesanan Kendaraan - Tes Technical BE Developer Sekawan Media - Build by Willy Kurniaman Lase",
                });
                options.OperationFilter<CustomHeaderSwaggerAttributeServices>();

                //options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
                //{
                //    Name = "Authorization",
                //    Type = SecuritySchemeType.ApiKey,
                //    Scheme = "Bearer",
                //    BearerFormat = "JWT",
                //    In = ParameterLocation.Header,
                //    Description = "JWT Authorization header using the Bearer scheme. \r\n\r\n Enter 'Bearer' [space] and then your token in the text input below.\r\n\r\nExample: \"Bearer 12345abcdef\"",
                //});
                //options.AddSecurityRequirement(new OpenApiSecurityRequirement
                //{
                //    {
                //          new OpenApiSecurityScheme
                //            {
                //                Reference = new OpenApiReference
                //                {
                //                    Type = ReferenceType.SecurityScheme,
                //                    Id = "Bearer"
                //                }
                //            },
                //            new string[] {}

                //    }
                //});
            });
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseCors(builder => builder.AllowAnyOrigin().AllowAnyHeader().AllowAnyMethod());

            app.UseHttpsRedirection();

            app.UseRouting();

            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
            app.UseSwagger();
            app.UseSwaggerUI(options => options.SwaggerEndpoint("/swagger/v2/swagger.json", "Tes Technical Backend Developer Sekawan Media"));

        }

        private void SetApplicationSettings()
        {
            EnumSettings.messageBodyNull = "Request Form Body is not valid & Data Cannot Be Empty";
            EnumSettings.messageDataNotFound = "Data Not Found";
            EnumSettings.messageSuccess = "Request Successful";

            ValueSystem.DB_My_Tes_BE = Configuration["Data:DB_My_Tes_BE"].ToString();

            ValueSystem.System_ApiKey = Configuration["AppSettings:ApiKey"].ToString();
        }
    }
}
