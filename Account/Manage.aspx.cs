using System;
using System.Collections.Generic;
using System.Linq;

using System.Web.UI.WebControls;

using Microsoft.AspNet.Membership.OpenAuth;

public partial class Account_Manage : System.Web.UI.Page
{
    protected string SuccessMessage
    {
        get;
        private set;
    }

    protected bool CanRemoveExternalLogins
    {
        get;
        private set;
    }

    protected void Page_Load()
    {
        if (!IsPostBack)
        {
            // Determine the sections to render
            var hasLocalPassword = OpenAuth.HasLocalPassword(User.Identity.Name);
             changePassword.Visible = hasLocalPassword;

            CanRemoveExternalLogins = hasLocalPassword;

            // Render success message
            var message = Request.QueryString["m"];
            if (message != null)
            {
                // Strip the query string from action
                Form.Action = ResolveUrl("~/Account/Manage");

                SuccessMessage =
                    message == "ChangePwdSuccess" ? "تم تغيير كلمة المرور بنجاح."
                    : message == "SetPwdSuccess" ? "Your password has been set."
                    : message == "RemoveLoginSuccess" ? "The external login was removed."
                    : String.Empty;
                successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            }
        }
        

        // Data-bind the list of external accounts
        var accounts = OpenAuth.GetAccountsForUser(User.Identity.Name);
        CanRemoveExternalLogins = CanRemoveExternalLogins || accounts.Count() > 1; 
        
    }
     
    
    protected void externalLoginsList_ItemDeleting(object sender, ListViewDeleteEventArgs e)
    {
        var providerName = (string)e.Keys["ProviderName"];
        var providerUserId = (string)e.Keys["ProviderUserId"];
        var m = OpenAuth.DeleteAccount(User.Identity.Name, providerName, providerUserId)
            ? "?m=RemoveLoginSuccess"
            : String.Empty;
        Response.Redirect("~/Account/Manage" + m);
    }

    protected T Item<T>() where T : class
    {
        return GetDataItem() as T ?? default(T);
    }
    

    protected static string ConvertToDisplayDateTime(DateTime? utcDateTime)
    {
        // You can change this method to convert the UTC date time into the desired display
        // offset and format. Here we're converting it to the server timezone and formatting
        // as a short date and a long time string, using the current thread culture.
        return utcDateTime.HasValue ? utcDateTime.Value.ToLocalTime().ToString("G") : "[never]";
    }
}