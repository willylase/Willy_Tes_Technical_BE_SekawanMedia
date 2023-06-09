using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Willy_Tes_Techincal_BE_SekawanMedia.Services.IServices;

namespace Willy_Tes_Techincal_BE_SekawanMedia.Services
{
    public abstract class DatabaseConfig
    {


        protected readonly DatabaseContext Context;


        protected readonly DbContextOptions<DatabaseContext> ContextOption;


        protected DatabaseConfig() { }


        protected DatabaseConfig(DatabaseContext _context)
        {
            Context = _context;
            ContextOption = Context.options;
        }
        private bool Disposed;


        protected virtual void Disposing(bool _disposing)
        {
            if (!Disposed)
            {
                if (_disposing)
                {
                    Context?.Dispose();
                }
            }
            Disposed = true;

        }


        public void Dispose()
        {

            Disposing(true);
            GC.SuppressFinalize(this);

        }

    }
}
