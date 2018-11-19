using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls; 

public partial class AddUsers : Page
{
    protected string SuccessMessage
    {
        get;
        private set;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            var message = Request.QueryString["m"];
            if (message != null)
            {
                // Strip the query string from action
                Form.Action = ResolveUrl("~/Account/Manage");

                SuccessMessage =
                    message == "ChangePwdSuccess" ? "تم تغيير كلمة المرور بنجاح."
                    : message == "SetPwdSuccess" ? "تم تغيير كلمة المرور بنجاح."
                    : message == "RemoveLoginSuccess" ? "تم تغيير كلمة المرور بنجاح."
                    : String.Empty;
                successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            }
            BindGrid();
        }
    }

    private void BindGrid()
    {
        List<MembershipUser> lstusers = new List<MembershipUser>();
        foreach (MembershipUser mem in Membership.GetAllUsers())
        {
            if(mem.UserName.ToLower() != "admin")
            lstusers.Add(mem);
        }
        GridView1.DataSource = lstusers;
        GridView1.DataBind();
    }

    protected void chklock_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox chk = (CheckBox)sender;
        GridViewRow gr = (GridViewRow)chk.Parent.Parent;
        string userName  = GridView1.DataKeys[gr.RowIndex].Value.ToString();

        MembershipUser user = Membership.GetUser(userName);
        if (user != null)
        {
            user.IsApproved = chk.Checked;
            Membership.UpdateUser(user);
        }
        BindGrid();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid(); //bindgridview will get the data source and bind it again
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("AddUsers");
    }

}