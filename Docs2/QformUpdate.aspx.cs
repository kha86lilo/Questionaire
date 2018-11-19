using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
            int Year = int.Parse(Request.QueryString["year"]);
            Guid GUID = new Guid(Membership.GetUser(User.Identity.Name).ProviderUserKey.ToString());
            AnswersForm answfrm = context.AnswersForm.FirstOrDefault(frm => frm.QuestionFormID == FormID && frm.Year == Year && frm.UserID == GUID);
            if (answfrm == null)
            { 
                QuestionsForms qfrm = context.QuestionsForms.First(frm => frm.ID == FormID);
                txtformName.Text = qfrm.FormName;

                grdQuestion.DataSource = context.Questions.Where(qs => qs.FormID == FormID && (qs.IsDeleted != true || qs.IsDeleted == null)).ToList();
                grdQuestion.DataBind();
                grdAnswers.Visible = false ;
                grdQuestion.Visible = true;
            }
            else
            {
                 txtAuditor.Text = answfrm.AuditorName ;
                 txtAuditorOn.Text = answfrm.AuditorOnName;
                txtDate.Text = answfrm.HijriDate ;
                txtOpsCode.Text = answfrm.OpsCode ;
                txtOpsName.Text = answfrm.OpsName;
                txtReviewer.Text = answfrm.ReviewerName;
                txtReviewerOn.Text = answfrm.ReviewerOnName ;
                txtAuditSign.Text = answfrm.Sign1 ;
                txtAuditonSign.Text = answfrm.Sign2 ;
                foreach (Questions row in context.Questions.Where(que =>que.FormID == FormID ).ToList())
                {
                    if (!context.Answers.Any(ans => ans.AnswerFormID == answfrm.ID && ans.QuestionID ==row.ID))
                    {
                        Answers ans = new Answers(); 
                        ans.AnswerFormID = answfrm.ID;
                        ans.QuestionID = row.ID ;
                        context.Answers.Add(ans);
                        context.SaveChanges();
                    }
                }
                grdAnswers.DataSource  = context.Answers.Where(ans => ans.AnswerFormID == answfrm.ID).Select(ans => new { Id = ans.ID, QuestionText = ans.Questions.QuestionText, Answer = ans.AnswerBody }).ToList();
                grdAnswers.DataBind();
                grdAnswers.Visible = true;
                grdQuestion.Visible = false;
            }
        }
    }
    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        int FormID = int.Parse(Request.QueryString["frmID"]);
        int Year = int.Parse(Request.QueryString["year"]);
        Guid GUID = new Guid(Membership.GetUser(User.Identity.Name).ProviderUserKey.ToString());
        CultureInfo arSA = new CultureInfo("ar-SA");
        arSA.DateTimeFormat.Calendar = new HijriCalendar();

        var day = Int32.Parse(string.Join("",
                        txtDate.Text.Split('/')[2].Select(c => char.GetNumericValue(c)))); // 30
        var month = Int32.Parse(string.Join("",
                                txtDate.Text.Split('/')[1].Select(c => char.GetNumericValue(c)))); // 12
        var year = Int32.Parse(string.Join("",
                                txtDate.Text.Split('/')[0].Select(c => char.GetNumericValue(c))));


        using (QuestionaireEntities context = new QuestionaireEntities())
        {
            AnswersForm answfrm =  context.AnswersForm.FirstOrDefault(frm => frm.QuestionFormID == FormID && frm.Year == Year && frm.UserID == GUID);
            if(answfrm ==null)
            {
                answfrm = new AnswersForm();
                answfrm.AuditorName = txtAuditor.Text;
                answfrm.AuditorOnName = txtAuditorOn.Text;
                answfrm.CreateDate = DateTime.ParseExact(day.ToString() +"/" + month.ToString() +"/" + year.ToString(), "d/M/yyyy", arSA); 
                answfrm.HijriDate = txtDate.Text;
                answfrm.OpsCode = txtOpsCode.Text;
                answfrm.OpsName = txtOpsName.Text;
                answfrm.QuestionFormID = FormID;
                answfrm.ReviewerName = txtReviewer.Text;
                answfrm.ReviewerOnName = txtReviewerOn.Text;
                answfrm.UserID = GUID;
                answfrm.Year = Year;
                answfrm.Sign1 = txtAuditSign.Text;
                answfrm.Sign2 = txtAuditonSign.Text;
                context.AnswersForm.Add(answfrm);
                context.SaveChanges();

                foreach (GridViewRow row in grdQuestion.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        Answers ans = new Answers();
                        ans.AnswerBody = ((RadioButton)row.FindControl("rdyes")).Checked;
                        ans.AnswerFormID = answfrm.ID;
                        ans.QuestionID = (int)grdQuestion.DataKeys[row.RowIndex].Value;
                        context.Answers.Add(ans);
                        context.SaveChanges();
                    }
                }
            }
            else
            { 
                answfrm.AuditorName = txtAuditor.Text;
                answfrm.AuditorOnName = txtAuditorOn.Text;

                answfrm.CreateDate = DateTime.ParseExact(day.ToString() + "/" + month.ToString() + "/" + year.ToString(), "d/M/yyyy", arSA);
                answfrm.HijriDate = txtDate.Text;
                answfrm.OpsCode = txtOpsCode.Text;
                answfrm.OpsName = txtOpsName.Text;
                answfrm.QuestionFormID = FormID;
                answfrm.ReviewerName = txtReviewer.Text;
                answfrm.ReviewerOnName = txtReviewerOn.Text;
                answfrm.UserID = GUID;
                answfrm.Year = Year;
                answfrm.Sign1 = txtAuditSign.Text;
                answfrm.Sign2 = txtAuditonSign.Text;
                context.SaveChanges();
                foreach (GridViewRow row in grdAnswers.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        int ansID = (int)grdAnswers.DataKeys[row.RowIndex].Value;
                        Answers ans = context.Answers.First(answ => answ.ID == ansID);

                        ans.AnswerBody = ((RadioButton)row.FindControl("rdyes")).Checked;
                        ans.AnswerFormID = answfrm.ID;  
                        context.SaveChanges();
                    }
                }
            }

          //  Response.Redirect("Qformslist");
            
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Qformslist");
    } 


    protected void btnprint_Click(object sender, EventArgs e)
    {
        int FormID = int.Parse(Request.QueryString["frmID"]);
        int Year = int.Parse(Request.QueryString["year"]);
        Guid GUID = new Guid(Membership.GetUser(User.Identity.Name).ProviderUserKey.ToString());

        RegisterUser_CreatedUser(null, null);
        using (QuestionaireEntities context = new QuestionaireEntities())
        {
            AnswersForm answfrm = context.AnswersForm.FirstOrDefault(frm => frm.QuestionFormID == FormID && frm.Year == Year && frm.UserID == GUID);
             
            ReportDocument cryRpt = new ReportDocument();
            cryRpt.Load(Server.MapPath("CrystalReport.rpt"));
           /* setDbInfo(cryRpt, ConfigurationManager.AppSettings["server"],
                ConfigurationManager.AppSettings["Db"],
                ConfigurationManager.AppSettings["UserID"],
                ConfigurationManager.AppSettings["Password"]);*/
            cryRpt.Refresh();
            cryRpt.SetParameterValue("frmid", answfrm.ID);
            this.Response.Charset = "UTF-8";
            this.Response.ContentEncoding = System.Text.Encoding.UTF8;
            this.Response.BinaryWrite(System.Text.Encoding.UTF8.GetPreamble());
             cryRpt.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText , this.Response, true, "Report");
        }

    }
    protected void setDbInfo(ReportDocument rpt, string ServerName, string DatabaseName, string UserName, string Password)
    {
        TableLogOnInfo logoninfo = new TableLogOnInfo();
        foreach (CrystalDecisions.CrystalReports.Engine.Table t in rpt.Database.Tables)
        {
            logoninfo = t.LogOnInfo;
            logoninfo.ReportName = rpt.Name;
            logoninfo.ConnectionInfo.ServerName = ServerName;
            logoninfo.ConnectionInfo.IntegratedSecurity = false;
            logoninfo.ConnectionInfo.DatabaseName = DatabaseName;
            logoninfo.ConnectionInfo.UserID = UserName;
            logoninfo.ConnectionInfo.Password = Password;
            logoninfo.TableName = t.Name;
            t.ApplyLogOnInfo(logoninfo);
            t.Location = t.Name;
        }
    }


}