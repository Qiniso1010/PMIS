using BundleTransformer.Core.Bundles;
using BundleTransformer.Core.Orderers;
using BundleTransformer.Core.Transformers;
using System.Web.Optimization;

namespace Mvc5.App_Start
{
    public class BundleConfig
    {
        public static void RegisterBundles(BundleCollection bundles)
        {
            BundleTable.EnableOptimizations = true;

            var cssTransformer = new StyleTransformer();
            var jsTransformer = new ScriptTransformer();
            var nullOrderer = new NullOrderer();

            var cssBackEndBundle = new StyleBundle("~/css");

            cssBackEndBundle.Include("~/Content/css/main.min.css"); 
            cssBackEndBundle.Transforms.Add(cssTransformer);
            cssBackEndBundle.Orderer = nullOrderer;
            bundles.Add(cssBackEndBundle);

           

            // Login Module
            var login_js = new ScriptBundle("~/jsl");
            login_js.Include("~/Content/login_flat/js/jquery.js");
            login_js.Include("~/Content/login_flat/js/bootstrap.min.js");
            login_js.Include("~/Content/login_flat/js/modernizr.js");
            login_js.Include("~/Content/login_flat/js/index.js");
            bundles.Add(login_js);

            var css_login = new StyleBundle("~/cssl");
            css_login.Include("~/Content/login_flat/main.css");
            bundles.Add(css_login);

            //var bootstrapBundle = new ScriptBundle("~/bundles/bootstrap");
            //bootstrapBundle.Include("~/Scripts/bootstrap.js", "~/Scripts/respond.js");
            //bootstrapBundle.Transforms.Add(jsTransformer);
            //bootstrapBundle.Orderer = nullOrderer;
            //bundles.Add(bootstrapBundle);

            // js bundle
            var js = new ScriptBundle("~/bundles/js");
            js.Include("~/Scripts/jquery-2.1.3.js");

            js.Include("~/Scripts/lazy.js");
            js.Include("~/Scripts/store.js");
            js.Include("~/Scripts/sweetalert.min.js");
            js.Include("~/Scripts/JsBarcode.all.min.js");
            js.Include("~/Scripts/ckeditor.js");
            bundles.Add(js);

            // bundle js app
            var app = new ScriptBundle("~/applications");
            app.Include("~/Scripts/jquery-2.1.3.js");
            
            
            app.Include("~/Scripts/jquery-ui.js");

            app.Include("~/Application/lib/underscore.js");
            app.Include("~/Application/lib/backbone.js");
            app.Include("~/Application/lib/handlebars.js");
            app.Include("~/Application/lib/hbtemplate.js");
            app.Include("~/Application/lib/handlebarshelper.js");
            app.Include("~/Application/lib/backbone-modal.js");

            app.Include("~/Scripts/bootstrap.js");

            app.Include("~/Scripts/backbone-form.js");
            app.Include("~/Scripts/backbone-shiftable-collection.js");
            app.Include("~/Scripts/store.min.js");
            app.Include("~/Scripts/moment.js");
            app.Include("~/Scripts/moment-with-locales.js");
            app.Include("~/Scripts/backbone.queryparams.js");
            app.Include("~/Scripts/signature/signature_pad.js");
           
            app.Include("~/Scripts/nprogress.js");
            app.Include("~/Scripts/sweetalert.min.js");
            app.Include("~/Scripts/select2.js");
            app.Include("~/Scripts/idle.js");
            app.Include("~/Scripts/icheck.js");
            app.Include("~/Scripts/jquery.slimscroll.js");

            app.Include("~/Application/lib/alertify.min.js");
            app.Include("~/Application/lib/bootstrap-table/dist/bootstrap-table.min.js");
            app.Include("~/Application/lib/app.min.js");

            app.Include("~/Application/lib/summernote/summernote.min.js");
            app.Include("~/Application/lib/jquery.unveil.js");


            app.Include("~/Application/lib/utility.js");
           

            app.Include("~/Application/app/Systems/Models/MenuLeftModel.js");
            app.Include("~/Application/app/Systems/Views/MenuLeftView.js");

            app.Include("~/Application/app/Project/Models/DeleteProjectModel.js");
            app.Include("~/Application/app/Project/Views/ApplicationIndexView.js");

            app.Include("~/Application/app/Project/Models/ProjectDetailsModel.js");
            app.Include("~/Application/app/Project/Models/ProjectEditModel.js");
            app.Include("~/Application/app/Project/Views/ProjectEditView.js");
            app.Include("~/Application/app/Project/Views/ProjectDetailsView.js");

            app.Include("~/Application/app/Project/Models/DeleteProjectCheckListModel.js");
            app.Include("~/Application/app/Project/Models/DeleteFilesModel.js");

            app.Include("~/Application/app/Project/Models/ProjectCheckListIsCompleteModel.js");
            app.Include("~/Application/app/Project/Models/ProjectIsCompleteModel.js");
           

            app.Include("~/Application/app/Project/Models/RenderFilesModel.js");
            app.Include("~/Application/app/Project/Models/RenderCommentsModel.js");

            app.Include("~/Application/app/Project/Models/RenderImageModel.js");
            app.Include("~/Application/app/Project/Models/RenderCheckListImageModel.js");
            app.Include("~/Application/app/Project/Models/ProjectCheckListEditModel.js");

            app.Include("~/Application/app/Project/Models/ChangePasswordModel.js");
            app.Include("~/Application/app/Project/Views/ChangePasswordView.js");

            app.Include("~/Application/app/Project/Views/ProjectCheckListEditView.js");

            app.Include("~/Application/app/Project/Views/ProjectView.js");
            app.Include("~/Application/app/Project/Views/_modal/ModalUploadImage.js");
            app.Include("~/Application/app/Project/Views/_modal/ModalUploadCheckListImage.js");
            app.Include("~/Application/app/Project/Views/_modal/ModalViewImage.js");
            app.Include("~/Application/app/Project/Views/_modal/ModalDetailCheckList.js");

            // Search Project
            app.Include("~/Application/app/Project/Models/ProjectSearchModel.js");
            app.Include("~/Application/app/Project/Views/ProjectSearchView.js");

            app.Include("~/Application/app/router.js");
            bundles.Add(app);

            var jqueryBundle = new ScriptBundle("~/bundles/jqueryval");
            jqueryBundle.IncludeDirectory("~/Scripts", "*.js", false);
            jqueryBundle.Transforms.Add(jsTransformer);
            jqueryBundle.Orderer = nullOrderer;
            bundles.Add(jqueryBundle);

        }

    }
}