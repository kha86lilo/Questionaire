using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls; 

public partial class DeptAdd : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void RegisterUser_CreatedUser(object sender, EventArgs e)
    {
        using (QuestionaireEntities context = new QuestionaireEntities())
        {
            DateTimeFormatInfo DTFormat = new DateTimeFormatInfo();


            DTFormat = new System.Globalization.CultureInfo("ar-sa", false).DateTimeFormat;
            DTFormat.FullDateTimePattern = "dd/MM/yyyy";
                QuestionsForms dept = new QuestionsForms();
            dept.CreatedDate = DateTime.Now;
            string x = DateTime.Now.ToString("dd/MM/yyyy", DTFormat);
            dept.FormName = txtformName.Text;
            dept.Clarification = txtClarification.Text;
            dept.idDeleted = false;
                context.QuestionsForms.Add(dept);
                context.SaveChanges();
                Response.Redirect("QformUpdate?frmID=" + dept.ID );
            
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("Qformslist");
    }

    
     
}