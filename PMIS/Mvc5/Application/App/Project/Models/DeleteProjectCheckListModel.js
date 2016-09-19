var DeleteProjectCheckListModel = Backbone.Model.extend({
    urlRoot: "/Project/Tasks/CheckListDelete/",
    defaults: {
        id:"",
        __RequestVerificationToken:""
    }

});

var DeleteProjectCheckListCollection = Backbone.Collection.extend({
    initialize: function(){
        this.model = new DeleteProjectCheckListModel();
    },
    model: this.model,

});
new DeleteProjectCheckListModel();
new DeleteProjectCheckListCollection();