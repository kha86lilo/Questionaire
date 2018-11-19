﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Answers
{
    public int ID { get; set; }
    public int QuestionID { get; set; }
    public int AnswerFormID { get; set; }
    public bool AnswerBody { get; set; }

    public virtual AnswersForm AnswersForm { get; set; }
    public virtual Questions Questions { get; set; }
}

public partial class AnswersForm
{
    public AnswersForm()
    {
        this.Answers = new HashSet<Answers>();
    }

    public int ID { get; set; }
    public int QuestionFormID { get; set; }
    public System.DateTime CreateDate { get; set; }
    public string ReviewerName { get; set; }
    public string ReviewerOnName { get; set; }
    public string AuditorName { get; set; }
    public string AuditorOnName { get; set; }
    public Nullable<System.Guid> UserID { get; set; }
    public int Year { get; set; }
    public string OpsCode { get; set; }
    public string OpsName { get; set; }
    public string HijriDate { get; set; }
    public string Sign1 { get; set; }
    public string Sign2 { get; set; }

    public virtual ICollection<Answers> Answers { get; set; }
    public virtual QuestionsForms QuestionsForms { get; set; }
    public virtual Users Users { get; set; }
}

public partial class Questions
{
    public Questions()
    {
        this.Answers = new HashSet<Answers>();
    }

    public int ID { get; set; }
    public int FormID { get; set; }
    public string QuestionText { get; set; }
    public Nullable<bool> IsDeleted { get; set; }
    public Nullable<bool> Answer { get; set; }

    public virtual ICollection<Answers> Answers { get; set; }
    public virtual QuestionsForms QuestionsForms { get; set; }
}

public partial class QuestionsForms
{
    public QuestionsForms()
    {
        this.AnswersForm = new HashSet<AnswersForm>();
        this.Questions = new HashSet<Questions>();
    }

    public int ID { get; set; }
    public string FormName { get; set; }
    public string Clarification { get; set; }
    public Nullable<bool> idDeleted { get; set; }
    public System.DateTime CreatedDate { get; set; }

    public virtual ICollection<AnswersForm> AnswersForm { get; set; }
    public virtual ICollection<Questions> Questions { get; set; }
}

public partial class Users
{
    public Users()
    {
        this.AnswersForm = new HashSet<AnswersForm>();
    }

    public System.Guid UserId { get; set; }
    public System.Guid ApplicationId { get; set; }
    public string UserName { get; set; }
    public bool IsAnonymous { get; set; }
    public System.DateTime LastActivityDate { get; set; }

    public virtual ICollection<AnswersForm> AnswersForm { get; set; }
}
