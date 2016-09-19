var ProjectCheckListEditModel = Backbone.Model.extend({
    urlRoot: "/Project/CheckLists/Details/",
    defaults: {
        id:null
    }

});

var ProjectCheckListEditCollection = Backbone.Collection.extend({
    model: new ProjectCheckListEditModel()

});
new ProjectCheckListEditModel();
new ProjectCheckListEditCollection();
