var DeleteFilesModel = Backbone.Model.extend({
    urlRoot: "/Project/Files/Delete",
    defaults: {
        id:"",
        __RequestVerificationToken:""
    }

});

var DeleteFilesCollection = Backbone.Collection.extend({
    initialize: function(){
        this.model = new DeleteFilesModel();
    },
    model: this.model,

});
new DeleteFilesModel();
new DeleteFilesCollection();