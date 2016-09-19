 var ProjectEditView = Backbone.View.extend({
    template: Template('Project/ProjectEditView'),
    initialize: function() {
        NProgress.done();
        _.bindAll(this, 'render');
        this.render;
        // this.model.on('change', this.render, this);
        // this.render;
        // Backbone.history.start();
    },
    events : {
        "click #btnSave":"SaveAction",
        "keyup #name":"SaveOnEnter"
    },
    render: function() {
        this.$el.html(this.template(this.model.attributes));
        var value = this.model.attributes;

        this.$('#keterangan').summernote({
          height:300,
          onImageUpload: function(files,editor,welEditable) {
              this.view = new ProjectEditView();
              this.view.sendFile(files[0],editor,welEditable);
          }
        });
        // Init
        this.Nav();
        this.Title();

        this.$('#name').focus();

        return this;
    },
    sendFile : function (file, editor, welEditable) {
        NProgress.start();
        var data = new FormData();
        data.append("file", file);//You can append as many data as you want. Check mozilla docs for this
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
    Title:function() {
        var template = Template('Project/_partial/ApplicationIndexTitle');
        var appname = "Edit Project";
        $("#title-header").html(appname);

        // menu
        new SelectedMenuItem("projects");
        new SelectedToogleItem("manage"); // parent

        $("#content-header").html(template());
        $("#header-page").html(appname);

        return this;
    },
    Nav:function() {
        var template = Template('Project/_partial/ProjectEditNav');
        $('#navigasi').html(template());

        $('#btnBack').click(function(){
            window.location.href = "#/apps/index";
        });

        return this;

    },
    SaveOnEnter:function(e) {
        if (e.keyCode == 13) {
            if (this.BeforeSave()) {
                this.SaveProject();
            }
        }

        return this;
    },
    BeforeSave:function(e) {
        var param = {
            name:$('#name').val()
        }
        if (param.name == '' || param.name == null) {
            $("#name-id").removeClass("has-success");
            $("#name-id").addClass("has-error");
            $("#name").focus();

            return false;
        }
        return true;
    },
    BeforeSave:function() {
      var param = {
        name:$('#name').val()
      };
      if (param.name === null || param.name === "") {
          new AlertV2("exclamation-triangle", "Kolom Masih Kosong!", "error");
          new IsLoading("#loading","hide");
          param.name.focus();
          return false;
      }

      return true;
    },
    SaveAction:function(e) {
        if (this.BeforeSave()) {
          if (this.BeforeSave())
            this.SaveProject();
        }

        return this;
    },
    SaveProject:function(e) {

        NProgress.start();
        new IsLoading("#loading","show");

        new prosesLoad("Y");
        var token = $('input[name="__RequestVerificationToken"]').val();


        var $options = {};
        var param = {
            Name:$("#name").val(),
            Id:$('#id').val(),
            Keterangan:$('#keterangan').code(),
            __RequestVerificationToken: token
        };


        $options.url = "/Project/Tasks/Edit/";
        $options.type = "POST";
        $options.cache = false;
        $options.data = param;
        $options.dataType = "json";
        $options.success = function(d) {
            new IsLoading("#loading","hide");
            if (d.Attr == "Ok!") {
                NProgress.done();
                new AlertV2("check", d.Message, "success");
            } else {
                alert(d.Message);
                new IsLoading("#loading","hide");
            }
            $("#name").focus();
        };
        $options.error = function(err) {
            alert(err.responseText);
            new prosesLoad("N");
            new IsLoading("#loading","hide");
        };
        if (this.BeforeSave())
          $.ajax($options);



        return this;
    },


});

new ProjectEditView();
