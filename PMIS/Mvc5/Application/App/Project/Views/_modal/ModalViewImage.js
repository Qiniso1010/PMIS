var ModalViewImage = Backbone.ModalView.extend({
  title: "<h4>Upload Images.</h4>",
  backdrop: false,
  events: {
    "change #file": "Upload",
    "click #btnDeleteImage":"DeleteImage"
  },
  postRender: function() {
    var template = Template('Project/_modal/ModalViewImage');
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
  RenderImage: function(id) {
    NProgress.start();
    var template = Template('Project/_render/RenderViewImage');
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

new ModalViewImage;
