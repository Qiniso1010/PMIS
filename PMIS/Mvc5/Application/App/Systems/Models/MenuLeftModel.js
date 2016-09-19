var MenuLeftModel = Backbone.Model.extend({
    urlRoot: "../Auth/Menus/ListingMenuAdmin/",
    defaults: {
        term:""
    }

});

var MenuLeftCollection = Backbone.Collection.extend({
    initialize: function(){
        this.model = new MenuLeftModel();
    },
    model: this.model,

});
new MenuLeftModel();
new MenuLeftCollection();