var ProjectView = Backbone.View.extend({
  template: Template('Project/ProjectView'),
  initialize: function() {
    NProgress.done();
    // this.render;
    // this.listenTo('add', this.render);

    _.bindAll(this, 'render');
    this.render;
    // this.model.on('change', this.render, this);
  },
  events: {
    "click #btnSave": "SaveProject",
    "keyup #name": "SaveOnEnter",
    "click #btnDelete": "DeleteProject",
    "click #btnComplete": "SaveClickComplete",
    "change #file": "Upload",
    "click #btnRemoveFile": "RemoveFile",
    "click #btnSaveComment": "AddComment",
    "keyup #comment": "AddCommentOnEnter",
    "click #btnImageDetail": "OpenModalImage",
    "click #hide_keterangan": "HideKeterangan",
    "click #AddingNewImage": "OpenModalUploadImage",
    "click #btnDetail": "OpenModalDetail",
    "keyup input#search_file": "SearchFiles"
  },
  render: function() {
    this.$el.html(this.template(this.model.attributes));
    var value = this.model.attributes;
    // Init
    this.Nav();
    this.Title(value.Rows.Name, value.Rows.IsComplete, value.Rows.Id);
    this.Table(value.Rows.Id);

    var IsViewer = $('input[name="IsSupervisor"]').val();

    if (IsViewer === "0") {
      this.$('#NewProject').show();
    } else {
      this.$('#NewProject').hide();
    }

    this.RenderFiles(value.Rows.Id);

    this.RenderComments(value.Rows.Id);

    this.$('.search').addClass('w-100');

    var awayCallback = function() {
      // console.log("away");
    };
    var awayBackCallback = function() {
      // console.log("welcome back");
      var self = new ProjectView;
      self.RenderComments(value.Rows.Id);
      self.Table(value.Rows.Id);
    };
    var hiddenCallback = function() {
      console.log('Away page');
    };
    var visibleCallback = function() {
      // console.log("User started looking at page again");
      var self = new ProjectView;
      self.RenderComments(value.Rows.Id);
      self.Table(value.Rows.Id);
    };

    var idle = new Idle({
      onHidden: hiddenCallback,
      onVisible: visibleCallback,
      onAway: awayCallback,
      onAwayBack: awayBackCallback,
      awayTimeout: 2000 //away with default value of the textbox
    });

    var timeout = 2000;
    idle.setAwayTimeout(timeout);

    this.$('#name').focus();

    // Image slide
    this.RenderImageSlide();

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
    new ModalUploadCheckListImage({
      id: id
    }).render();
    return this;
  },
  OpenModalDetail: function(e) {
    var id = $(e.currentTarget).data('id');
    new ModalDetailCheckList({
      id: id
    }).render();
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
  OpenModalImage: function(e) {
    var id = $(e.currentTarget).data('id');
    new ModalViewImage({
      id: id
    }).render();
    return this;
  },
  Title: function(name, done, id) {
    var template = Template('Project/_partial/ProjectViewTitle');
    var appname = "Project : Check List";
    $("#title-header").html(appname);

    // menu
    new SelectedMenuItem("projects");
    new SelectedToogleItem("manage"); // parent

    $("#content-header").html(template({
      name: name,
      done: done,
      id: id
    }));
    $("#header-page").html(appname);

    $('#btnIsCompleteProject').click(function(e) {
      var id = $(e.currentTarget).data('id');
      var token = $('input[name="__RequestVerificationToken"]').val();

      NProgress.start();
      var m = new ProjectIsCompleteModel();

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
            // location.reload();
            window.location.href = "#/apps/index";

          } else {
            alert(d.get("Message"));
          }
        },
        error: function(err) {
          alert(err.responseText);
        }
      });
    });

    return this;
  },
  Nav: function() {
    var template = Template('Project/_partial/ProjectViewNav');
    $('#navigasi').html(template());

    $('#btnBack').click(function() {
      window.location.href = "#/apps/index";
    });

    return this;

  },
  RenderComments: function(id) {
    var template = Template('Project/_render/RenderComments');
    NProgress.start();
    var m = new RenderCommentsModel();

    m.fetch({
      data: $.param({
        TasksId: id
      }),
      type: 'GET',
      dataType: 'json',
      cache: false,
      success: function(data) {
        NProgress.done();
        $('.comment-list').html(template(data.attributes));
        var height = 0;

        var container = $('.direct-chat-messages')
        container.each(function(i, value) {
          height += parseInt($(this).height());
        });
        height += '';
        container.animate({
          scrollTop: height + container.scrollTop()
        });

      }
    });
    return this;
  },
  RenderImageSlide: function(id) {
    var template = Template('Project/_render/RenderImageSlide');
    this.$('#image-slide').html(template());

    return this;
  },
  SearchFiles: function() {
    var IsViewer = $('input[name="IsSupervisor"]').val();
    if (IsViewer === "0") {
      var template = Template('Project/_render/RenderFiles');
    } else {
      var template = Template('Project/_render/RenderFilesIsSuper');
    }
    NProgress.start();

    var key = $('#search_file').val();
    var TasksId = $('#TasksId').val();

    var m = new RenderFilesModel();
    var IsViewer = $('input[name="IsSupervisor"]').val();

    m.fetch({
      data: $.param({
        TasksId: TasksId,
        Key: key
      }),
      type: 'GET',
      dataType: 'json',
      cache: false,
      success: function(data) {
        NProgress.done();
        $('#search_file').focus();
        $('#file-list').html(template(data.attributes));

        if (IsViewer === "0") {
          $('#btnRemoveFileSet').show();
        } else {
          $('#btnRemoveFileSet').hide();
        }
      }
    });
    return this;
  },
  RenderFiles: function(id) {
    var IsViewer = $('input[name="IsSupervisor"]').val();
    if (IsViewer === "0") {
      var templatex = Template('Project/_render/RenderFiles');
    } else {
      var templatex = Template('Project/_render/RenderFilesIsSuper');
    }

    NProgress.start();
    var m = new RenderFilesModel();
    m.fetch({
      data: $.param({
        TasksId: id,
        Key: ''
      }),
      type: 'GET',
      dataType: 'json',
      cache: false,
      success: function(data) {
        NProgress.done();
        $('#file-list').html(templatex(data.attributes));

      }
    });
    return this;
  },
  RemoveFile: function(e) {
    e.preventDefault();
    var token = $('input[name="__RequestVerificationToken"]').val();
    var id = $(e.currentTarget).data("id");
    var task_id = $('#TasksId').val();

    NProgress.start();

    var m = new DeleteFilesModel();

    m.fetch({
      data: $.param({
        __RequestVerificationToken: token,
        id: id
      }),
      type: 'POST',
      dataType: 'json',
      cache: false,
      success: function(d) {

        if (d.get("Attr") == "Ok!") {
          new AlertV2("check", d.get("Message"), "success");

          var self = new ProjectView;
          self.RenderFiles(task_id);
          NProgress.done();
        } else {
          new AlertV2("exclamation-triangle", d.get("Message"), "error");

        }
      },
      error: function(err) {
        alert(err.responseText);
      }
    });

    return this;
  },
  Upload: function() {
    var id = $('#TasksId').val();

    new IsLoading("#loading", "show");
    new prosesLoad("Y");

    var percent = $('#progress-bar');
    var fileUpload = $('#FormUpload').get(0);

    if (fileUpload.files != '') {
      var form = $('#FormUpload')[0];
      var form_data = new FormData(form);
      $.ajax({
        xhr: function() {
          var xhr = new window.XMLHttpRequest();
          //Upload progress
          xhr.upload.addEventListener("progress", function(evt) {
            if (evt.lengthComputable) {
              var percentComplete = evt.loaded / evt.total * 100;
              percent.html(Math.round(percentComplete) + '%');
            }
          }, false);
          //Download progress
          xhr.addEventListener("progress", function(evt) {
            if (evt.lengthComputable) {
              var percentComplete = evt.loaded / evt.total * 100;
              percent.html(Math.round(percentComplete) + '%');
            }
          }, false);
          return xhr;
        },
        url: '/Project/Files/Uploads/',
        dataType: 'json',
        cache: false,
        contentType: false,
        processData: false,
        data: form_data,
        type: 'post',
        success: function(data) {
          if (data.Attr == "Ok!") {
            var percentValue = '100%';
            percent.html(percentValue);
            new IsLoading("#loading", "hide");
            new prosesLoad("N");
            new AlertV2("check", data.Message, "success");

            var self = new ProjectView;
            self.RenderFiles(id);
          } else {
            new AlertV2("exclamation-triangle", data.Message, "error");
          }

        },
        error: function(xhr, ajaxOptions, thrownError) {
          console.log(xhr.responseText);
          alert(xhr.responseText);

          new IsLoading("#loading", "hide");
          new prosesLoad("N");
        }
      });
    }
    return this;
  },
  AddComment: function(e) {

    NProgress.start();
    new IsLoading("#loading", "show");

    new prosesLoad("Y");
    var token = $('input[name="__RequestVerificationToken"]').val();


    var $options = {};
    var param = {
      CommentText: $("#comment").val(),
      __RequestVerificationToken: token,
      TasksId: $("#TasksId").val()
    };


    $options.url = "/Project/Comments/Create/";
    $options.type = "POST";
    $options.cache = false;
    $options.data = param;
    $options.dataType = "json";
    $options.success = function(d) {
      new IsLoading("#loading", "hide");
      if (d.Attr == "Ok!") {
        NProgress.done();

        var self = new ProjectView;
        self.RenderComments(param.TasksId);
      } else {
        alert(d.Message);
        new IsLoading("#loading", "hide");
      }
      $("#comment").focus();
      $('#comment').val('');
    };
    $options.error = function(err) {
      alert(err.responseText);
      new prosesLoad("N");
      new IsLoading("#loading", "hide");
    };
    $.ajax($options);

    return this;
  },
  AddCommentOnEnter: function(e) {
    if (e.keyCode == 13) {
      this.AddComment();
    }

    return this;
  },
  SaveClickComplete: function(e) {
    var id = $(e.currentTarget).data('id');
    var token = $('input[name="__RequestVerificationToken"]').val();

    NProgress.start();
    var m = new ProjectCheckListIsCompleteModel();

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
      __RequestVerificationToken: token,
      TasksId: $("#TasksId").val(),
      Keterangan: $('#keterangan').code()
    };


    $options.url = "/Project/Tasks/CheckListCreate/";
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
    var m = new DeleteProjectCheckListModel();

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
  Table: function(id) {

    NProgress.start();

    this.$('#listing-grid').bootstrapTable({
      method: 'GET',
      url: '/Project/Tasks/CheckListIndex/?id=' + id,
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
        valign: 'middle',
        sortable: true,
        formatter: this.NameAndId
      }, {
        field: 'CreatedBy',
        align: 'right',
        valign: 'middle',
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

    if (IsComplete == "True") {
      var Complete = "<i class='icon ion-ios-checkmark text-green size-18 check-list'></i>";
      var IsDone = "style='text-decoration:line-through;'";
    } else {
      var Complete = "<i class='icon ion-ios-circle-outline text-gray size-18 check-list'></i>";
      var IsDone = "";
    }

    if (Images !== "") {
      var img = "<img src='/Uploads/" + Images + "' class='images-thumb'/>";
    } else {
      var img = "";
    }

    var result = "";
    result += "<a href='javascript:;' id='btnComplete' title='Set Task Complete' data-id='" + id + "'>" + Complete + "</a>";
    result += "&nbsp;&nbsp;";
    //  result += img;
    result += "<a href='javascript:;' id='btnDetail' title='Click for detail.' " + IsDone + " data-id='" + id + "''>" + img + "<span style='vertical-align: middle; padding-left:5px;'>" + name + "</span></a>";

    return result;
  },
  CreatedByInfo: function(value) {
    var id = value.split("|")[0];
    var IsComplete = value.split("|")[1];
    var CreatedBy = value.split("|")[2];
    var CreatedAt = value.split("|")[3];
    var CheckList = value.split("|")[4];

    if (CheckList != 0) {
      var HitungCheckList = "<small class='label bg-green r-50'>" + CheckList + "</small>";
    } else {
      var HitungCheckList = "<small class='label bg-gray r-50'>" + CheckList + "</small>";
    }
    var image = "<a href='javascript:;' data-id='" + id + "' id='AddingNewImage'><i class='icon ion-image'></i></a>";

    var edit = "<a href='#/checklist/edit/" + id + "'><span class='lnr lnr-pencil'></span></a>";
    var hapus = "<a href='javascript:;' id='btnDelete' data-id='" + id + "'><span class='lnr lnr-cross'></span></a>";

    var IsViewer = $('input[name="IsSupervisor"]').val();

    var result = "";
    result += "<span class='pull-right text-gray'>";
    result += CreatedAt;
    result += "&nbsp; - &nbsp;";
    result += CreatedBy;

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

new ProjectView;
