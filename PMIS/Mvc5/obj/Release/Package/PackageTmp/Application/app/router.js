// window.App = {
//   Models: {},
//   Collections: {},
//   Views: {},
//   Router: {}
// };

var $content = $("#content"),
  $sidebar = $(".main-sidebar");

var AppRouter = Backbone.Router.extend({
  routes: {
    "": 'ApplicationIndex',
    "apps/index": "ApplicationIndex",
    "apps/edit/:id": "ProjectEdit",
    "checklist/edit/:id": "ProjectCheckListEdit",
    "apps/view/:id": "ProjectViews",
    "apps/view/:id/?*params": "ProjectViews",
    "change_password/index": "ChangePassword",
    "apps/search/:q/?*params": "ProjectSearch",
  },
  initialize: function() {
    IsLoading("#loading", "hide");
    NProgress.start();

    // console.log(moment.locale("id"));
    var IsViewer = $('input[name="IsSupervisor"]').val();

    //load menu
    $sidebar.html(new MenuLeftView().render().el);


  },
  ChangePassword: function() {
    NProgress.start();
    var views = new ChangePasswordView();
    $content.html(views.render().el);

    new Logout();
  },
  ApplicationIndex: function(id) {
    var views = new ApplicationIndexView();
    $content.html(views.render().el);

    new Logout();

  },
  ProjectSearch: function(q,params) {
    var param = new parseQueryString(params);
    var cari = q.q;
    if (cari === undefined || cari === null) {
      var SetCari = q;
    } else {
      var SetCari = cari;
    }

    var views = new ProjectSearchView({
      cari: SetCari
    });

    $content.html(views.render(param.search).el);

    new Logout();

  },
  ProjectEdit: function(id) {
    var Id = id.id;
    if (Id === undefined || Id === null) {
      var SetId = id;
    } else {
      var SetId = Id;
    }

    var m = new ProjectDetailsModel({
      id: SetId
    });

    m.fetch({
      success: function(data) {
        $content.html(new ProjectEditView({
          model: data
        }).render().el);
      }
    });

    new Logout();
  },
  ProjectCheckListEdit: function(id) {
    var Id = id.id;
    if (Id === undefined || Id === null) {
      var SetId = id;
    } else {
      var SetId = Id;
    }

    var m = new ProjectCheckListEditModel({
      id: SetId
    });

    m.fetch({
      success: function(data) {
        $content.html(new ProjectCheckListEditView({
          model: data
        }).render().el);
      }
    });

    new Logout();
  },
  ProjectViews: function(id) {
    // var param = new parseQueryString(params);

    var Id = id.id;
    if (Id === undefined || Id === null) {
      var SetId = id;
    } else {
      var SetId = Id;
    }

    // var router = new AppRouter();
    // router.navigate("apps/index", {trigger: true});

    var m = new ProjectDetailsModel();

    m.fetch({
      data: $.param({
        id: SetId
      }),
      success: function(data) {
        $content.html(new ProjectView({
          model: data
        }).render().el);
        // var sys = new App.Router();
        // sys.navigate('ProjectViews',{trigger: true});
      }
    });
    new Logout();
  }


});

//  new AppRouter();
var app = new AppRouter();

$(document).ready(function() {
  // Backbone.history.start();

  Backbone.history.start();
  // Backbone.history.start("apps/index", {
  //   pushState: true
  // });

  // Backbone.history.start({pushState: true});
  Backbone.Router.namedParameters = true;

  // try {
  //   // $("img").attr("src","/Content/Assets/Images/loading.gif");
  //   $("img").unveil();
  //
  // } catch (err) {
  //   alert(err);
  // }

});
