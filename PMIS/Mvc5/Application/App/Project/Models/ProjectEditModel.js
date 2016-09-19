var ProjectEditModel = Backbone.Model.extend({
    urlRoot: "Tasks/Edit/",
    defaults: {
        id:"",
        __RequestVerificationToken:""
    }

});

var ProjectEditCollection = Backbone.Collection.extend({
    initialize: function(){
        this.model = new ProjectEditModel();
    },
    model: this.model,

});
new ProjectEditModel();
new ProjectEditCollection();