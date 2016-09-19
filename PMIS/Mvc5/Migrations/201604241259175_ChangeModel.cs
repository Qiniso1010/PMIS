namespace Mvc5.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class ChangeModel : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CheckList",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TasksId = c.Int(nullable: false),
                        Name = c.String(),
                        IsComplete = c.Boolean(nullable: false),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        CheckList_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.CheckList", t => t.CheckList_Id)
                .Index(t => t.CheckList_Id);
            
            CreateTable(
                "dbo.Comment",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TasksId = c.Int(nullable: false),
                        CommentText = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        UserId = c.Int(nullable: false),
                        CreatedBy = c.String(),
                        Comment_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Comment", t => t.Comment_Id)
                .Index(t => t.Comment_Id);
            
            CreateTable(
                "dbo.File",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        TasksId = c.Int(nullable: false),
                        Name = c.String(),
                        FullPath = c.String(),
                        ext = c.String(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        File_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.File", t => t.File_Id)
                .Index(t => t.File_Id);
            
            CreateTable(
                "dbo.MySetting",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        Email = c.String(),
                        IsSendingEmail = c.Boolean(nullable: false),
                        FullName = c.String(),
                        MySetting_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.MySetting", t => t.MySetting_Id)
                .Index(t => t.MySetting_Id);
            
            CreateTable(
                "dbo.TasksFollow",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        UserId = c.Int(nullable: false),
                        TasksId = c.Int(nullable: false),
                        TasksFollow_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.TasksFollow", t => t.TasksFollow_Id)
                .Index(t => t.TasksFollow_Id);
            
            CreateTable(
                "dbo.Tasks",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(),
                        SharedId = c.String(),
                        IsActive = c.Boolean(),
                        CreatedAt = c.DateTime(nullable: false),
                        CreatedBy = c.String(),
                        CreatedUnitBy = c.String(),
                        UserId = c.Int(nullable: false),
                        IsComplete = c.Boolean(),
                        Status = c.String(),
                        Tasks_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Tasks", t => t.Tasks_Id)
                .Index(t => t.Tasks_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Tasks", "Tasks_Id", "dbo.Tasks");
            DropForeignKey("dbo.TasksFollow", "TasksFollow_Id", "dbo.TasksFollow");
            DropForeignKey("dbo.MySetting", "MySetting_Id", "dbo.MySetting");
            DropForeignKey("dbo.File", "File_Id", "dbo.File");
            DropForeignKey("dbo.Comment", "Comment_Id", "dbo.Comment");
            DropForeignKey("dbo.CheckList", "CheckList_Id", "dbo.CheckList");
            DropIndex("dbo.Tasks", new[] { "Tasks_Id" });
            DropIndex("dbo.TasksFollow", new[] { "TasksFollow_Id" });
            DropIndex("dbo.MySetting", new[] { "MySetting_Id" });
            DropIndex("dbo.File", new[] { "File_Id" });
            DropIndex("dbo.Comment", new[] { "Comment_Id" });
            DropIndex("dbo.CheckList", new[] { "CheckList_Id" });
            DropTable("dbo.Tasks");
            DropTable("dbo.TasksFollow");
            DropTable("dbo.MySetting");
            DropTable("dbo.File");
            DropTable("dbo.Comment");
            DropTable("dbo.CheckList");
        }
    }
}
