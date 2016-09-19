var RenderCommentsModel = Backbone.Model.extend({
    urlRoot: "/Project/Comments/",
    defaults: {
        id:null
    }

});

var RenderCommentsCollection = Backbone.Collection.extend({
    model: new RenderCommentsModel()

});
new RenderCommentsModel();
new RenderCommentsCollection();