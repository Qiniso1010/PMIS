 var ChangePasswordView = Backbone.View.extend({
   template: Template('Project/ChangePassword'),
   initialize: function() {
     NProgress.done();
     this.render;
   },
   events: {
     "focusout #oldPassword": "checkOldPassword",
     "click #btnSave": "savePassword"
   },
   render: function() {
     this.$el.html(this.template());

     // Init
     this.Nav();
     this.Title();

     // Set Focus
     this.$('#oldPassword').focus();


     return this;
   },
   checkOldPassword: function(e) {
     this.oldPassword = this.$("#oldPassword").val();

     var currentPassword = new ChangePasswordModel();
     var self = this;

     currentPassword.fetch({
       data: $.param({
         password: this.oldPassword
       }),
       success: function(data) {
         if (data.get("Attr") == "Ok!") {
           $("#current-password").removeClass("has-error");
           $("#current-password").addClass("has-success");
           new AlertV2("check", "current password correct!", "info");
           $("#btnSave").attr("disabled", false);
           NProgress.done();
         } else {
           $("#current-password").removeClass("has-success");
           $("#current-password").addClass("has-error");
           $("#oldPassword").focus();
           $("#btnSave").attr("disabled", true);
           new AlertV2("remove", "Invalid current password, please try again", "error");
         }
       }

     });

     return this;
   },
   Title: function() {
     var template = Template('Project/_partial/ChangePasswordTitle');
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
     var template = Template('Project/_partial/ChangePasswordNav');
     $('#navigasi').html(template());

     return this;

   },
   savePassword: function(e) {

     NProgress.start();
     new IsLoading("#loading", "show");

     new prosesLoad("Y");


     var $options = {};

     this.oldPassword = this.$("#oldPassword").val();
     this.newPassword = this.$("#newPassword").val();
     this.confPassword = this.$("#confPassword").val();

     this.id = this.$('#id').val();
     this.token = $('input[name="__RequestVerificationToken"]').val();

     var param = {
       password: this.confPassword,
       __RequestVerificationToken: this.token
     };
     if (this.oldPassword == "" || this.oldPassword == null) {
       $("#current-password").removeClass("has-success");
       $("#current-password").removeClass("has-error");
       $("#current-password").addClass("has-error");
       new AlertV2("remove", "Please enter old password", "error");
       new IsLoading("#loading", "hide");
     } else if (this.newPassword == "" || this.newPassword == null) {
       $("#new-password").removeClass("has-success");
       $("#new-password").removeClass("has-error");
       $("#new-password").addClass("has-error");
       new AlertV2("remove", "Please enter new password", "error");
       new IsLoading("#loading", "hide");
     } else if (this.newPassword.length < 3) {
       new AlertV2("remove", "Minimum of 5 characters required", "error");
       $("#new-password").removeClass("has-success");
       $("#new-password").removeClass("has-error");
       $("#new-password").addClass("has-error");
       $("#newPassword").focus();
       $("#newPassword").addClass("error");
       new IsLoading("#loading", "hide");
     } else if (this.confPassword.length < 3) {
       new AlertV2("remove", "Minimum of 5 characters required", "error");
       new IsLoading("#loading", "hide");
       $("#conf-password").removeClass("has-success");
       $("#conf-password").removeClass("has-error");
       $("#conf-password").addClass("has-error");
       $("#confPassword").focus();
       $("#confPassword").addClass("error");
     } else if (this.newPassword != this.confPassword) {
       new AlertV2("remove", "New password and its confirmation do not match", "error");
       new IsLoading("#loading", "hide");
       $("#conf-password").removeClass("has-success");
       $("#conf-password").removeClass("has-error");
       $("#conf-password").addClass("has-error");
       $("#newPassword").focus();
       $("#confPassword").addClass("error");
       $("#newPassword").addClass("error");
     } else {

       $options.url = "/Auth/Users/Edit";
       $options.type = "POST";
       $options.cache = false;
       $options.data = param;
       $options.dataType = "json";
       $options.success = function(d) {
         new IsLoading("#loading", "hide");
         if (d.Attr == "Ok!") {
           NProgress.done();
           new AlertV2("check","Password success saved","success");
         } else {
           alert(d.Message);
           new IsLoading("#loading", "hide");
         }
       };
       $options.error = function(err) {
         alert(err.responseText);
         new prosesLoad("N");
         new IsLoading("#loading", "hide");
       };


       $.ajax($options);
     }


     return this;
   }

 });

 new ChangePasswordView();
