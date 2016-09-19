namespace Mvc5.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddingNewModel : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CheckList", "UserId", c => c.Int(nullable: false));
            AddColumn("dbo.CheckList", "UnitId", c => c.Int(nullable: false));
            AddColumn("dbo.Comment", "UnitId", c => c.Int(nullable: false));
            AddColumn("dbo.Tasks", "UnitId", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.Tasks", "UnitId");
            DropColumn("dbo.Comment", "UnitId");
            DropColumn("dbo.CheckList", "UnitId");
            DropColumn("dbo.CheckList", "UserId");
        }
    }
}
