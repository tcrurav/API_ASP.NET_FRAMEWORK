﻿//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MVCCrudAPI.Models
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class bicyclesEntities : DbContext
    {
        public bicyclesEntities()
            : base("name=bicyclesEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Bicycles> Bicycles { get; set; }
        public virtual DbSet<BranchOffices> BranchOffices { get; set; }
        public virtual DbSet<Stocks> Stocks { get; set; }
        public virtual DbSet<sysdiagrams> sysdiagrams { get; set; }
    }
}
