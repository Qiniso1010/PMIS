namespace Mvc5.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class adding_new_model : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.File", "CheckListId", c => c.Int(nullable: false));
            AddColumn("dbo.File", "Tipe", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.File", "Tipe");
            DropColumn("dbo.File", "CheckListId");
        }
    }
}
