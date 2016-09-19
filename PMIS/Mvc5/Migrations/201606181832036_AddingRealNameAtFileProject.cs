namespace Mvc5.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddingRealNameAtFileProject : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.File", "RealName", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.File", "RealName");
        }
    }
}
