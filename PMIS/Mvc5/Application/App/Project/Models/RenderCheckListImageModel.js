var RenderCheckListImageModel = Backbone.Model.extend({
    urlRoot: "/Project/Files/IndexCheckListImage",
    defaults: {
        CheckListId:0
    }

});

var RenderCheckListImageCollection = Backbone.Collection.extend({
    model: new RenderCheckListImageModel()

});
new RenderCheckListImageModel();
new RenderCheckListImageCollection();
