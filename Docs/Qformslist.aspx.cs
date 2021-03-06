﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls; 

public partial class DeptList : Page
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
            GridView1.DataSource = context.QuestionsForms.Where(qfrm => (qfrm.idDeleted != true || qfrm.idDeleted == null)).ToList();
            GridView1.DataBind();
        }
            
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindGrid(); //bindgridview will get the data source and bind it again
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("QformAdd");
    }


    protected void Unnamed_Click(object sender, EventArgs e)
    {
        LinkButton chk = (LinkButton)sender;
        GridViewRow gr = (GridViewRow)chk.Parent.Parent;
        int formid = int.Parse(GridView1.DataKeys[gr.RowIndex].Value.ToString());
        using (QuestionaireEntities context = new QuestionaireEntities())
        {
             context.QuestionsForms.First(qfrm => qfrm.ID == formid).idDeleted = true;
            context.SaveChanges();
        }
        BindGrid();
    }
}