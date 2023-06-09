using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices
{
    public class DatabaseContext : DbContext
    {

        public DbContextOptions<DatabaseContext> options;
        public DatabaseContext() : base()
        {

        }

        public DatabaseContext(DbContextOptions<DatabaseContext> _options) : base(_options)
        {

            options = _options;

        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
           
        }

    }
}