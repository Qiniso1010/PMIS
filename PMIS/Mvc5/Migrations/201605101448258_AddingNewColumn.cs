namespace Mvc5.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class AddingNewColumn : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.CheckList", "SharedId", c => c.String());
            AddColumn("dbo.CheckList", "Keterangan", c => c.String());
            AddColumn("dbo.Tasks", "Keterangan", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Tasks", "Keterangan");
            DropColumn("dbo.CheckList", "Keterangan");
            DropColumn("dbo.CheckList", "SharedId");
        }
    }
}
