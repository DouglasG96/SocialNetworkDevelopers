using APISND.Interface;
using APISND.Mapper;
using APISND.Models;
using APISND.Services;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using SNDAPI.Interface;
using SNDAPI.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using APISND.Hubs;

namespace APISND
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

            //agregar dependencia automapper
            services.AddAutoMapper(typeof(AutoMapping).Assembly);

            services.AddCors();
            services.AddControllers();

            // Registro del Contexto de datos como Servicio Cadena conexion
            services.AddDbContext<SocialNetworkDeveloperContext>(options =>
               //options.UseSqlServer(Configuration.GetConnectionString("AppConnection2")).EnableSensitiveDataLogging());
               options.UseSqlServer(Configuration.GetConnectionString("AppConnectionProduccion")).EnableSensitiveDataLogging());
               //options.UseSqlServer(Configuration.GetConnectionString("AppConnection2")).EnableSensitiveDataLogging());

            services.AddTransient<IAuth, AuthServices>();
            services.AddTransient<IUser, UserServices>();
            services.AddTransient<ICategories, CategoriesServices>();
            services.AddTransient<IPublication, PublicationServices>();
            services.AddTransient<IEmail, EmailServices>();
            services.AddTransient<ISaleOrder, SaleOrderServices>();
            services.AddTransient<ICategories, CategoriesServices>();
            services.AddTransient<ISubCategory, SubCategoryServices>();
            services.AddTransient<IBuyOrder, BuyOrderServices>();
            services.AddTransient<IAdress, AdressServices>();
            services.AddTransient<IWishList, WishlistServices>();
            services.AddTransient<IStatistics, StatisticsServices>();
            services.AddTransient<ITwilio, TwilioServices>();


            services.AddSignalR();//A�adimos servicio para SignalR


            //swagger
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "SNDAPI", Version = "v1" });

                // Habilitar autorizacion swagger (JWT)    
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme()
                {
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                    In = ParameterLocation.Header,
                    Description = "Copia y pega el Token en el campo 'Value:' asi: Bearer {Token JWT}.",
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                          new OpenApiSecurityScheme
                            {
                                Reference = new OpenApiReference
                                {
                                    Type = ReferenceType.SecurityScheme,
                                    Id = "Bearer"
                                }
                            },
                            new string[] {}

                    }
                });
            });

            //Servicio Autenticacion JWT
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {
                options.RequireHttpsMetadata = false;
                options.SaveToken = true;
                options.TokenValidationParameters = new TokenValidationParameters()
                {
                    ValidateIssuer = true,
                    ValidateAudience = false,
                    ValidAudience = Configuration["Jwt:Audience"],
                    ValidIssuer = Configuration["Jwt:Issuer"],
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]))
                };
            });

            ////var key = Configuration.GetValue<string>("Jwt:Key");
            //services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            //{
            //    options.TokenValidationParameters = new TokenValidationParameters
            //    {
            //        ValidateIssuer = true,
            //        ValidateAudience = true,
            //        ValidateLifetime = true,
            //        ValidateIssuerSigningKey = true,
            //        ValidIssuer = "SNDAuthenticationServer",
            //        ValidAudience = "SND",
            //        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(Configuration["Jwt:Key"]))
            //    };
            //});

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            //if (env.IsDevelopment())
            //{
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "SNDAPI v1"));
            //}

            app.UseRouting();

            // global cors policy
            app.UseCors(x => x
                .AllowAnyMethod()
                .AllowAnyHeader()
                .SetIsOriginAllowed(origin => true) // allow any origin
                .AllowCredentials()); // allow credentials

            app.UseAuthentication();
            app.UseAuthorization();
            //agregar punto de acceso disponible al hub signalR
            app.UseEndpoints(endpoints => endpoints.MapHub<PublicationHub>("/publication-hub"));
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
