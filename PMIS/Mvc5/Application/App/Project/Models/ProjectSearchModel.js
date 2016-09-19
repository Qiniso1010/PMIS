var ProjectSearchModel = Backbone.Model.extend({
    urlRoot: "Tasks/SearchProjects/",
    defaults: {
        id:"",
        __RequestVerificationToken:""
    }

});

var ProjectSearchCollection = Backbone.Collection.extend({
    initialize: function(){
        this.model = new ProjectSearchModel();
    },
    model: this.model,

});
new ProjectSearchModel();
new ProjectSearchCollection();
