using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using Mvc5.Areas.Project.Models;

namespace Mvc5.Areas.Project.Context
{
    public class ProjectContext : DbContext
    {
        public ProjectContext()
            : base("ProjectConn")
        {
            Database.SetInitializer(new DropCreateDatabaseIfModelChanges<ProjectContext>());
            
            //Database.SetInitializer(new DropCreateDatabaseAlways<NaskahContext>());
            //Database.SetInitializer<NaskahContext>(null);
            //Database.SetInitializer(new MigrateDatabaseToLatestVersion<NaskahContext, Mvc5.Migrations.Configuration>("postConnNaskah"));
        }
        public DbSet<Tasks> Taskss { get; set; }
        public DbSet<CheckList> CheckLists { get; set; }
        public DbSet<Comment> Comments { get; set; }
        public DbSet<File> Files { get; set; }
        public DbSet<MySetting> MySettings { get; set; }
        public DbSet<TasksFollow> TaskFollows { get; set; }
        //public DbSet<File> Files { get; set; }
        //public DbSet<Category> Categorys { get; set; }
        //public DbSet<Sharing> Sharings { get; set; }
        //public DbSet<Download> Downloads { get; set; }
        //public DbSet<LaporanDoc> LaporanDocs { get; set; }
        //public DbSet<Comment> Comments { get; set; }
        //public DbSet<Keterangan> Keterangans { get; set; }
        //public DbSet<TemplateDoc> TemplateDocs { get; set; }
        //public DbSet<LaporanDocLog> LaporanDocLogs { get; set; }
        //public DbSet<Room> Rooms { get; set; }
        //public DbSet<Profile> Profiles { get; set; }
        //public DbSet<Schedule> Schedules { get; set; }
        //public DbSet<ConfigurationUser> ConfigurationUsers { get; set; }
        //public DbSet<Permintaan> Permintaans { get; set; }
        //public DbSet<SharingReason> SharingReasons { get; set; }
        //public DbSet<InviteExternal> InviteExternals { get; set; }
        //public DbSet<ProfileUser> ProfileUsers { get; set; }
        //public DbSet<Jabatan> Jabatans { get; set; }
        //public DbSet<Golongan> Golongans { get; set; }
        //public DbSet<Pangkat> Pangkats { get; set; }
        //public DbSet<SignatureProfile> SignatureProfiles { get; set; }
        //public DbSet<SignatureToNaskah> SignatureToNaskahs { get; set; }
        //public DbSet<AppConfig> AppConfigs { get; set; }


        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<Profile>().ToTable("Profile");
            modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            //base.OnModelCreating(modelBuilder);
        }
    }
}