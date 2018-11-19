using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls; 

public partial class DeptAddUpd : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        {
            BindGrid();

           

        }
    }
    private void BindGrid()
    {
        using (QuestionaireEntities context = new QuestionaireEntities())
        {
            int FormID = int.Parse(Request.QueryString["frmID"]);
            QuestionsForms qfrm =  context.QuestionsForms.First(frm => frm.ID == FormID);
            txtformName.Text  = qfrm.FormName;
            txtClarification.Text = qfrm.Clarification;
            grdQuestion.DataSource = context.Questions.Where(qs=>qs.FormID == FormID && (qs.IsDeleted != true || qs.IsDeleted == null)).ToList();
            grdQuestion.DataBind();
        }
    }
    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        using (QuestionaireEntities context = new QuestionaireEntities())
        {
            int FormID = int.Parse(Request.QueryString["frmID"]);

            DateTimeFormatInfo DTFormat = new DateTimeFormatInfo();
            QuestionsForms qfrm = context.QuestionsForms.First(frm => frm.ID == FormID);
             qfrm.FormName = txtformName.Text ;
             qfrm.Clarification= txtClarification.Text ;

            context.SaveChanges();
                Response.Redirect("Qformslist");
            
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Qformslist");
    }


    protected void Unnamed_Click(object sender, EventArgs e)
    {
        LinkButton chk = (LinkButton)sender;
        GridViewRow gr = (GridViewRow)chk.Parent.Parent;
        int formid = int.Parse(grdQuestion.DataKeys[gr.RowIndex].Value.ToString());
        using (QuestionaireEntities context = new QuestionaireEntities())
        {
            context.Questions.First(qfrm => qfrm.ID == formid).IsDeleted = true;
            context.SaveChanges();
        }
        BindGrid();
    }
    protected void btnAddQst_Click(object sender, EventArgs e)
    {
        using (QuestionaireEntities context = new QuestionaireEntities())
        {
            DateTimeFormatInfo DTFormat = new DateTimeFormatInfo();


            DTFormat = new System.Globalization.CultureInfo("ar-sa", false).DateTimeFormat;
            DTFormat.FullDateTimePattern = "dd/MM/yyyy";
            Questions dept = new Questions();
             string x = DateTime.Now.ToString("dd/MM/yyyy", DTFormat);
            dept.QuestionText  = txtQuestion.Text ;
            dept.FormID =int.Parse(Request.QueryString["frmID"]);
            dept.IsDeleted = false;
            context.Questions.Add(dept);
            context.SaveChanges(); 
            BindGrid();
        }
    }
}