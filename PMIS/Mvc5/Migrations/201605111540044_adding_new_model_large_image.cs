namespace Mvc5.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class adding_new_model_large_image : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.File", "Thumb", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.File", "Thumb");
        }
    }
}
