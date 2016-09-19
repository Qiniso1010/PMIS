var ModalUploadImage = Backbone.ModalView.extend({
  title: "<h4>Upload Images.</h4>",
  backdrop: false,
  events: {
    "change #file": "Upload",
    "click #btnDeleteImage":"DeleteImage"
  },
  postRender: function() {
    var template = Template('Project/_modal/ModalUploadImage');
    var id = this.id;
    this.$body.html(template({
      TasksId: id
    }));

    // Set Id
    this.$('#CheckListId').val(0);

    // Render Image Available
    this.RenderImage(id);

    return this;
  },
  DeleteImage:function(e) {
    e.preventDefault();
    var id = $(e.currentTarget).data('id');

    var token = $('input[name="__RequestVerificationToken"]').val();
    var id = $(e.currentTarget).data("id");
    var TasksId = $('#TasksId').val();

    NProgress.start();

    var m = new DeleteFilesModel();

    m.fetch({
        data: $.param({ __RequestVerificationToken: token,id:id }),
        type: 'POST',
        dataType: 'json',
        cache:false,
        success : function(d) {
            if (d.get("Attr") == "Ok!") {
                new AlertV2("check", d.get("Message"), "success");

                var $modal = new ModalUploadImage();
                $modal.RenderImage(TasksId);

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

    var percent = $('#progress-bar');
    var fileUpload = $('#FormUpload').get(0);

    var id = $('#TasksId').val();

    var fileExtension = ['jpeg', 'jpg', 'png', 'gif', 'bmp'];

    if ($.inArray($("#file").val().split('.').pop().toLowerCase(), fileExtension) == -1) {
      swal("Warning!", "Only '.jpeg','.jpg', '.png', '.gif', '.bmp' formats are allowed.", "error");
    } else {
      if (fileUpload.files != '') {
        new IsLoading("#loading", "show");

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
          url: '/Project/Files/UploadImage/',
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

              var $modal = new ModalUploadImage();
              $modal.RenderImage(id);

              new IsLoading("#loading", "hide");
              new AlertV2("check", data.Message, "success");

            } else {
              Utility.AlertV2("exclamation-triangle", data.Message, "error");
            }

          },
          error: function(xhr, ajaxOptions, thrownError) {
            console.log(xhr.responseText);
            alert(xhr.responseText);

            new IsLoading("#loading", "hide");
          }
        });
      }
    }


    return this;
  },
  RenderImage: function(id) {
    NProgress.start();
    var template = Template('Project/_render/RenderImage');
    var m = new RenderImageModel();

    m.fetch({
      data: $.param({
        TasksId: id
      }),
      type: 'GET',
      dataType: 'json',
      cache: true,
      success: function(data) {
        NProgress.done();
        $('#image-list').html(template(data.attributes));
      },
      error: function(err) {
        console.log(err.responseText);
        NProgress.done();
      }
    });
    return this;
  }
});

new ModalUploadImage;
