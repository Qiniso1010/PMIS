var ChangePasswordModel = Backbone.Model.extend({
    urlRoot: "/Auth/Users/CheckCurrentPassword",
    defaults: {
        id:0
    }

});

var ChangePasswordCollection = Backbone.Collection.extend({
    model: new ChangePasswordModel()

});
new ChangePasswordModel();
new ChangePasswordCollection();
