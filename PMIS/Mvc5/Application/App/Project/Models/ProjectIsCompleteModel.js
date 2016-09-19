var ProjectIsCompleteModel = Backbone.Model.extend({
    urlRoot: "Tasks/IsCompleteTask/",
    defaults: {
        id:"",
        __RequestVerificationToken:""
    }

});

var ProjectIsCompleteCollection = Backbone.Collection.extend({
    initialize: function(){
        this.model = new ProjectIsCompleteModel();
    },
    model: this.model,

});
new ProjectIsCompleteModel();
new ProjectIsCompleteCollection();