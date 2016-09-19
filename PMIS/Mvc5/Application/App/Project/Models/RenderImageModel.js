var RenderImageModel = Backbone.Model.extend({
    urlRoot: "/Project/Files/IndexProjectImage",
    defaults: {
        TaskId:0
    }

});

var RenderImageCollection = Backbone.Collection.extend({
    model: new RenderImageModel()

});
new RenderImageModel();
new RenderImageCollection();
