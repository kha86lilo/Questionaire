using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls; 

public partial class FormsList2 : Page
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
                    message == "ChangePwdSuccess" ? "Department has been added." 
                    : String.Empty;
                successMessage.Visible = !String.IsNullOrEmpty(SuccessMessage);
            }
            BindGrid();
        }
    }

    private void BindGrid()
    {
         using (QuestionaireEntities context = new QuestionaireEntities())
        {
            int FormID = int.Parse(Request.QueryString["frmID"]);
            Guid GUID = new Guid(Membership.GetUser(User.Identity.Name).ProviderUserKey.ToString());
            GridView1.DataSource = context.AnswersForm.Where(frm => frm.QuestionFormID == FormID  && frm.UserID == GUID)
                .Select(ans => new { Id = ans.QuestionsForms.ID, FormName = ans.QuestionsForms.FormName , Year = ans.Year })
                .ToList();

            
            GridView1.DataBind();
        }
            
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid(); //bindgridview will get the data source and bind it again
    }
      

    protected void btnDirectToForm_Click(object sender, EventArgs e)
    {
        Button chk = (Button)sender;
        GridViewRow gr = (GridViewRow)chk.Parent.Parent;
        string frmID = GridView1.DataKeys[gr.RowIndex].Value.ToString();
        string year = ((Label)chk.Parent.FindControl("Label2")).Text;

        Response.Redirect("QformUpdate?year=" + year + "&frmID=" + frmID);

    }

    
}