using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls; 

public partial class AddUsers : Page
{
    protected void Page_Load(object sender, EventArgs e)
    { 
    }

    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        //FormsAuthentication.SetAuthCookie(RegisterUser.UserName, createPersistentCookie: false);
        Roles.AddUserToRole(RegisterUser.UserName, ((DropDownList)RegisterUserWizardStep.Controls[0].FindControl("ddlRoles")).SelectedValue);
        Response.Redirect("ListUsers");
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("ListUsers");
    }
}