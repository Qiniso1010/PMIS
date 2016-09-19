 var ProjectSearchView = Backbone.View.extend({
   template: Template('Project/ProjectSearchIndex'),
   initialize: function() {
     NProgress.done();

     this.render;
     // Backbone.history.start();
   },
   events: {
     "click #btnDetail": "OpenModalDetail",
   },
   render: function(param) {
     this.$el.html(this.template());


     // Init
     this.Nav();
     this.Title();

     var IsViewer = $('input[name="IsSupervisor"]').val();

     this.$('#search_content').keyup(function() {
       var value = $(this).val();
       this.SearchContent(value);
     });

     if (IsViewer === "0") {
       this.$('#NewProject').show();
     } else {
       this.$('#NewProject').hide();
     }

     return this;
   },
   OpenModalDetail:function(e) {
       var id = $(e.currentTarget).data('id');
       new ModalDetailCheckList({id:id}).render();
       return this;
   },
   Title: function() {
     var template = Template('Project/_partial/ProjectSearchIndexTitle');
     var appname = "Projects - Search";
     $("#title-header").html(appname);

     // menu
     new SelectedMenuItem("projects");
     new SelectedToogleItem("manage"); // parent

     $("#content-header").html(template());
     $("#header-page").html(appname);

     return this;
   },
   Nav: function() {
     var template = Template('Project/_partial/SearchViewIndexNav');
     $('#navigasi').html(template());

     $('input#search_content').focus();
     $("input#search_content").keyup(function() {
       var value = $(this).val();
       var view = new ProjectSearchView();
       view.SearchContent(value);
       //  window.location.href = "#/apps/search/?search="+value;
     });

     $('#btnRefresh').click(function() {
       $('#listing-grid').bootstrapTable('refresh');
     });

     return this;

   },
   SearchContent: function(key) {
     //  window.location.href = "#/apps/index/?search=test";
     var template = Template('Project/_render/RenderSearchResult');
     NProgress.start();


     var m = new ProjectSearchModel();
     var IsViewer = $('input[name="IsSupervisor"]').val();

     m.fetch({
       data: $.param({
         Key: key
       }),
       type: 'GET',
       dataType: 'json',
       cache: false,
       success: function(data) {
         NProgress.done();
         $('#search_result').html(template(data.attributes));

       }
     });
     return this;
   },

   SaveOnEnter: function(e) {
     if (e.keyCode == 13) {
       if (this.BeforeSave())
         this.SaveProject();
     }

     return this;
   },


 });

 new ProjectSearchView();
