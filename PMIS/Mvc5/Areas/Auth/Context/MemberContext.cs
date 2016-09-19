using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using Mvc5.Areas.Auth.Models;

namespace Mvc5.Areas.Auth.Context
{
    public class MemberContext : DbContext
    {
        public MemberContext()
            : base("ConnExtMember")
        {
            Database.SetInitializer<MemberContext>(null);
        }
        public DbSet<User> Users { get; set; }
        //public DbSet<UserMysql> UserMysqls { get; set; }
        //public DbSet<UnitMysql> UnitMysqls { get; set; }

        public DbSet<Unit> Units { get; set; }
        public DbSet<UserPlt> UserPlts { get; set; }
        public DbSet<UserKa> UserKas { get; set; }
        public DbSet<UserToUnit> UserToUnits { get; set; }
        public DbSet<Privilege> Privileges { get; set; }
        public DbSet<UserToken> UserTokens { get; set; }
        public DbSet<UserModule> UserModules { get; set; }
        public DbSet<Module> Modules { get; set; }
        public DbSet<Menu> Menus { get; set; }
        public DbSet<MenuModule> MenuModules { get; set; }
        public DbSet<GuidGenerate> GuidId { get; set; }

        //public DbSet<Log> Logs { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().ToTable("app_users");
            modelBuilder.Entity<Unit>().ToTable("app_unit");
            modelBuilder.Entity<UserPlt>().ToTable("m_user_set_plt");
            modelBuilder.Entity<UserKa>().ToTable("m_unit_set_ka");
            modelBuilder.Entity<UserToUnit>().ToTable("o_surat_to_unit");
            modelBuilder.Entity<Privilege>().ToTable("app_privileges");
            modelBuilder.Entity<UserToken>().ToTable("app_users_token_login");
            modelBuilder.Entity<Module>().ToTable("app_modules");
            modelBuilder.Entity<UserModule>().ToTable("app_users_modul_connect");
            modelBuilder.Entity<Menu>().ToTable("app_menu");
            modelBuilder.Entity<MenuModule>().ToTable("app_menu_modules");
            //modelBuilder.Entity<Log>().ToTable("app_logs");
        }
    }
}