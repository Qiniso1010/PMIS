var DeleteProjectModel = Backbone.Model.extend({
    urlRoot: "/Project/Tasks/Delete/",
    defaults: {
        id:"",
        __RequestVerificationToken:""
    }

});

var DeleteProjectCollection = Backbone.Collection.extend({
    initialize: function(){
        this.model = new DeleteProjectModel();
    },
    model: this.model,

});
new DeleteProjectModel();
new DeleteProjectCollection();