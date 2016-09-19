namespace Mvc5.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddingUnitIdAtFile : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.File", "UnitId", c => c.Int(nullable: false));
        }
        
        public override void Down()
        {
            DropColumn("dbo.File", "UnitId");
        }
    }
}
