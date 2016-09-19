var ModalDetailCheckList = Backbone.ModalView.extend({
  title: "<h4 id='title_detail'></h4>",
  backdrop: false,
  events: {
    "change #file_checklist": "Upload",
    "click #btnDeleteImage": "DeleteImage"
  },
  postRender: function() {
    var template = Template('Project/_modal/ModalDetailCheckList');
    this.$body.html(template());

    var id = this.id;

    // Render Image Available
    this.RenderImage(id);

    // Render Data
    this.RenderData(id);


    return this;
  },
  RenderData:function(id) {
    var template = Template('Project/_render/RenderCheckListDetail');
    NProgress.start();
    var m = new ProjectCheckListEditModel({
      id: id
    });
    m.fetch({
      type: 'GET',
      dataType: 'json',
      cache: true,
      success: function(data) {
        NProgress.done();
        $('#data-list').html(template(data.attributes));
        var value = data.attributes;
        this.$('#title_detail').html(value.Rows.Name);
      },
      error:function(err) {
        console.log(err.responseText);
      }
    });

    return this;
  },
  RenderImage: function(id) {
    NProgress.start();
    var template = Template('Project/_render/RenderDetailCheckListImage');
    var m = new RenderCheckListImageModel();

    m.fetch({
      data: $.param({
        CheckListId: id
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

new ModalDetailCheckList;
