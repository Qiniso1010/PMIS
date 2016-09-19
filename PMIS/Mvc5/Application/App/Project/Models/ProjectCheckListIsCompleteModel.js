var ProjectCheckListIsCompleteModel = Backbone.Model.extend({
    urlRoot: "Tasks/IsCompleteCheckList/",
    defaults: {
        id:"",
        __RequestVerificationToken:""
    }

});

var ProjectCheckListIsCompleteCollection = Backbone.Collection.extend({
    initialize: function(){
        this.model = new ProjectCheckListIsCompleteModel();
    },
    model: this.model,

});
new ProjectCheckListIsCompleteModel();
new ProjectCheckListIsCompleteCollection();