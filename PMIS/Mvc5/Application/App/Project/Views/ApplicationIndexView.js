 var ApplicationIndexView = Backbone.View.extend({
   template: Template('Project/ApplicationIndex'),
   initialize: function() {
     NProgress.done();

     this.render;
     // Backbone.history.start();
   },
   events: {
     "click #btnSave": "SaveProject",
     "keyup #name": "SaveOnEnter",
     "click #btnDelete": "DeleteProject",
     "click #hide_keterangan": "HideKeterangan",
     "click #AddingNewImage": "OpenModalUploadImage",
   },
   render: function() {
     this.$el.html(this.template());

     // Init
     this.Nav();
     //  this.SearchNav();
     this.Title();
     this.Table();
     this.$('.search').addClass('w-100');

     var IsViewer = $('input[name="IsSupervisor"]').val();

     if (IsViewer === "0") {
       this.$('#NewProject').show();
     } else {
       this.$('#NewProject').hide();
     }

     this.$('#name').focus();

     // Keterangan
     this.$('#keterangan').summernote({
       height: 100,
       onImageUpload: function(files, editor, welEditable) {
         this.view = new ApplicationIndexView();
         this.view.sendFile(files[0], editor, welEditable);
       }
     });

     // Default Hide Keterangan
     this.$('#keterangan-id').hide();

     this.$('#hide_keterangan').html('<i class="icon ion-ios-plus-empty size-18"></i>');



     return this;
   },
   OpenModalUploadImage: function(e) {
     var id = $(e.currentTarget).data('id');
     new ModalUploadImage({
       id: id
     }).render();
     return this;
   },
   sendFile: function(file, editor, welEditable) {
     NProgress.start();
     var data = new FormData();
     data.append("file", file); //You can append as many data as you want. Check mozilla docs for this
     var $options = {};

     try {
       $options.data = data;
       $options.type = "POST";
       $options.url = "/Project/Files/UploadSummernote";
       $options.cache = false;
       $options.contentType = false;
       $options.processData = false;
       $options.success = function(data) {
         NProgress.done();
         if (data.Attr === "Ok!") {
           // editor.insertImage(welEditable,data.Message);
           $('#keterangan').summernote("insertImage", data.Message, 'filename');
         } else {
           console.log(data.Message);
         }
       };
       $options.error = function(err) {
         alert(err);
       };
       $.ajax($options);
     } catch (err) {
       alert(err);
     }



     return this;
   },
   HideKeterangan: function(e) {
     var id = this.$('#hide_keterangan').attr("data-id"); //$(e.currentTarget).data('id');

     if (id === 'hide') {
       this.$('#keterangan-id').show();
       this.$('#hide_keterangan').attr("data-id", "unhide");
       this.$('#hide_keterangan').html('<i class="icon ion-ios-minus-empty size-18"></i>');
     } else {
       this.$('#keterangan-id').hide();
       this.$('#hide_keterangan').attr("data-id", "hide");
       this.$('#hide_keterangan').html('<i class="icon ion-ios-plus-empty size-18"></i>');
     }

     return this;
   },
   Title: function() {
     var template = Template('Project/_partial/ApplicationIndexTitle');
     var appname = "Projects - List";
     $("#title-header").html(appname);

     // menu
     new SelectedMenuItem("projects");
     new SelectedToogleItem("manage"); // parent

     $("#content-header").html(template());
     $("#header-page").html(appname);

     return this;
   },
   Nav: function() {
     var template = Template('Project/_partial/ApplicationIndexNav');
     $('#navigasi').html(template());

     $("input#search_content").keyup(function() {
       var value = $(this).val();
       window.location.href = "#/apps/search/"+value+"/?search=" + value;
     });

     $('#btnRefresh').click(function() {
       $('#listing-grid').bootstrapTable('refresh');
     });

     return this;

   },
   BeforeSave: function() {
     var param = {
       name: $('#name').val()
     };
     if (param.name === null || param.name === "") {
       new AlertV2("exclamation-triangle", "Kolom Masih Kosong!", "error");
       new IsLoading("#loading", "hide");
       param.name.focus();
       return false;
     }

     return true;
   },
   SaveOnEnter: function(e) {
     if (e.keyCode == 13) {
       if (this.BeforeSave())
         this.SaveProject();
     }

     return this;
   },
   SaveProject: function(e) {

     NProgress.start();
     new IsLoading("#loading", "show");

     new prosesLoad("Y");
     var token = $('input[name="__RequestVerificationToken"]').val();


     var $options = {};
     var param = {
       Name: $("#name").val(),
       Keterangan: $('#keterangan').code(),
       __RequestVerificationToken: token
     };


     $options.url = "/Project/Tasks/Create/";
     $options.type = "POST";
     $options.cache = false;
     $options.data = param;
     $options.dataType = "json";
     $options.success = function(d) {
       new IsLoading("#loading", "hide");
       if (d.Attr == "Ok!") {
         NProgress.done();
         $('#listing-grid').bootstrapTable('refresh');
       } else {
         alert(d.Message);
         new IsLoading("#loading", "hide");
       }
       $("#name").focus();
       $("#name").select();
     };
     $options.error = function(err) {
       alert(err.responseText);
       new prosesLoad("N");
       new IsLoading("#loading", "hide");
     };
     if (this.BeforeSave())
       $.ajax($options);



     return this;
   },
   DeleteProject: function(e) {
     var id = $(e.currentTarget).data('id');
     var token = $('input[name="__RequestVerificationToken"]').val();

     NProgress.start();
     var m = new DeleteProjectModel();

     m.fetch({
       data: $.param({
         id: id,
         __RequestVerificationToken: token
       }),
       type: 'POST',
       dataType: 'json',
       cache: false,
       success: function(d) {
         if (d.get("Attr") == "Ok!") {
           NProgress.done();
           $('#listing-grid').bootstrapTable('refresh');

         } else {
           alert(d.get("Message"));
         }
       },
       error: function(err) {
         alert(err.responseText);
       }
     });

     return this;
   },
   Table: function() {

     NProgress.start();

     this.$('#listing-grid').bootstrapTable({
       method: 'GET',
       url: '/Project/Tasks/',
       cache: false,
       striped: false,
       pagination: true,
       sidePagination: "server",
       pageSize: 20,
       pageList: [10, 25, 50, 100, 200],
       search: true,
       showColumns: false,
       showRefresh: false,
       cardView: false,
       showToggle: false,
       showExport: false,
       exportTypes: ['json', 'xml', 'csv', 'txt', 'sql', 'excel'],
       minimumCountColumns: 2,
       clickToSelect: true,
       showHeader: false,
       showFooter: false,
       columns: [{
         field: 'stat',
         checkbox: true,
         visible: false
       }, {
         field: 'Id',
         title: 'Item ID',
         align: 'right',
         valign: 'bottom',
         sortable: true,
         visible: false
       }, {
         field: 'NameAndId',
         align: 'left',
         valign: 'top',
         sortable: true,
         formatter: this.NameAndId
       }, {
         field: 'CreatedBy',
         align: 'right',
         valign: 'top',
         sortable: true,
         formatter: this.CreatedByInfo
       }],
       onCheck: function(row) {
         $("#btnReject").show();
       },
       onUncheck: function(row) {
         $("#btnReject").hide();
       },
       onCheckAll: function() {
         $("#btnReject").show();
       },
       onUncheckAll: function() {
         $("#btnReject").hide();
       },
       onLoadSuccess: function() {
         NProgress.done();
       },
       onError: function(err) {
         console.log(err);
       }
     });


     return this;
   },
   NameAndId: function(value) {
     var id = value.split("|")[0];
     var name = value.split("|")[1];
     var IsComplete = value.split("|")[2];
     var Images = value.split("|")[3];
     //
     // if (IsComplete == "True") {
     //     var Complete = "<i class='icon ion-ios-checkmark text-green size-18' style='padding-right:10px !important;'></i>";
     // } else {
     //     var Complete = "<i class='icon ion-ios-circle-outline text-gray size-18' style='padding-right:10px !important;'></i>";
     // }
     if (Images !== "") {
       var img = "<img src='/Uploads/" + Images + "' class='images-thumb'/>";
     } else {
       var img = "";
     }

     // console.log(Images);


     return "<a href='#/apps/view/" + id + "'>" + img + " <strong style='vertical-align: top; padding-left:5px;'>" + name + "</strong></a>";
   },
   CreatedByInfo: function(value) {
     var id = value.split("|")[0];
     var IsComplete = value.split("|")[1];
     var CreatedBy = value.split("|")[2];
     var CreatedAt = value.split("|")[3];
     var CheckList = value.split("|")[4];
     var FileCount = value.split("|")[5];

     if (IsComplete == "True") {
       var Complete = "<i class='icon ion-ios-checkmark text-green size-18'></i>";
     } else {
       var Complete = "<i class='icon ion-ios-circle-outline text-gray size-18'></i>";
     }

     if (CheckList != 0) {
       var HitungCheckList = "<small class='label bg-green r-50 ellipsis'>" + CheckList + "</small>";
     } else {
       var HitungCheckList = "<small class='label bg-gray r-50 ellipsis'>" + CheckList + "</small>";
     }

     if (FileCount != 0) {
       var HitungFile = "<small class='label bg-red r-50 ellipsis'>" + FileCount + "</small>";
     } else {
       var HitungFile = "<small class='label bg-gray r-50 ellipsis'>" + FileCount + "</small>";
     }

     var image = "<a href='javascript:;' data-id='" + id + "' id='AddingNewImage'><i class='icon ion-image'></i></a>";

     var edit = "<a href='#/apps/edit/" + id + "'><span class='lnr lnr-pencil'></span></a>";
     var hapus = "<a href='javascript:;' id='btnDelete' data-id='" + id + "'><span class='lnr lnr-cross '></span></a>";

     var result = "";
     result += "<span class='pull-right text-gray'>";
     result += CreatedAt;
     result += "&nbsp; - &nbsp;";
     result += CreatedBy;
     result += "&nbsp;&nbsp;";
     result += HitungCheckList;
     result += "&nbsp;&nbsp;";
     result += HitungFile;
     // result += "&nbsp;&nbsp;";
     // result += Complete;

     var IsViewer = $('input[name="IsSupervisor"]').val();

     if (IsViewer === "0") {
       result += "&nbsp;&nbsp;";
       result += image;

       result += "&nbsp;&nbsp;";
       result += edit;
       result += "&nbsp;&nbsp;";
       result += hapus;
     }



     result += "</span>";

     return result;

   }


 });

 new ApplicationIndexView();
