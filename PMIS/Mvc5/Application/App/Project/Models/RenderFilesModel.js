var RenderFilesModel = Backbone.Model.extend({
    urlRoot: "/Project/Files/",
    defaults: {
        id:null
    }

});

var RenderFilesCollection = Backbone.Collection.extend({
    model: new RenderFilesModel()

});
new RenderFilesModel();
new RenderFilesCollection();