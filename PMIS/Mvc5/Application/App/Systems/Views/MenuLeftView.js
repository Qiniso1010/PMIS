var MenuLeftView = Backbone.View.extend({
    template: Template('Systems/_partial/MenuLeftSearch'),
    initialize : function() {
        this.render;
    },
    events : {
        "click .sidebar-menu li a": "master",
        "keyup input#search": "search"
    },
    master: function (e) {
        var id = $(e.currentTarget).data("id");
        new SelectedToogleItem(id);
        new SelectedMenuItem(id);
    },
    clicked: function(e){
        e.preventDefault();
    },
    render: function () {
        this.$el.html(this.template());
        this.listing('');
        
        

        this.$(".sidebar").slimscroll({
            height: "600px",
            alwaysVisible: false,
            size: "3px"
        }).css("width", "100%");
        return this;
    },
    listing: function (src) {
        var templatex = Template('Systems/_partial/MenuLeft');
        var token = $('input[name="__RequestVerificationToken"]').val()

        $('#MenuList').html('<span style="padding-left:10px;">Loading....</span>');
        NProgress.start();
        
        
        var m = new MenuLeftModel({ src: src, __RequestVerificationToken: token });
        m.fetch({
            data: $.param({ src: src, __RequestVerificationToken: token }),
            type: 'POST',
            cache: true,
            dataType: 'json',
            success: function (d) {
                NProgress.done();
                $('#MenuList').html(templatex(d.attributes));
            },
            error: function (xhr, ajaxOptions, thrownError) {
                alert(xhr.responseText);
                $('#MenuList').html(xhr.responseText);
            }
        });
        
        
        new Logout();

    },
    search: function () {
        var src = $('#search');

        if (src != '') {
            this.$('.treeview').addClass('menu-open active');
            this.$('.treeview-menu').attr('style', 'display:block;');

            this.listing(src.val());
        }
        return this;
    }

});

new MenuLeftView;
