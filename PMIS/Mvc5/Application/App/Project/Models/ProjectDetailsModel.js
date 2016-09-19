var ProjectDetailsModel = Backbone.Model.extend({
    urlRoot: "Tasks/Details/",
    defaults: {
        id:null
    }

});

var ProjectDetailsCollection = Backbone.Collection.extend({
    model: new ProjectDetailsModel(),
    url:"Tasks/Details/"

});
new ProjectDetailsModel();
new ProjectDetailsCollection();