<%@ Page Title="إضافة نموذج" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="QformAdd.aspx.cs" Inherits="DeptAdd" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1>إضافة نموذج</h1>
        <h4>قم بحفظ النموذج حتى تتمكن من إضافة الأسئلة</h4>
    </hgroup>
    <p class="validation-summary-errors">
        <asp:Literal runat="server" ID="ErrorMessage" meta:resourcekey="ErrorMessageResource1" />
    </p>
     
 
            <asp:Label runat="server" AssociatedControlID="txtformName" meta:resourcekey="LabelResource1">إسم النموذج</asp:Label>
            <asp:TextBox runat="server" ID="txtformName" meta:resourcekey="UserNameResource1" />
            <asp:RequiredFieldValidator runat="server" ControlToValidate="txtformName"
                CssClass="field-validation-error" ErrorMessage="قم بإدخال اسم النموذج." meta:resourcekey="RequiredFieldValidatorResource1" />
        <br />
     <asp:Label runat="server" AssociatedControlID="txtClarification" meta:resourcekey="LabelResource1">الإيضاح</asp:Label>
            <asp:TextBox runat="server" ID="txtClarification" meta:resourcekey="UserNameResource1" />
             <br />
     
    
    
    <asp:Button runat="server"  OnClick="RegisterUser_CreatedUser" Text="إضافة" meta:resourcekey="ButtonResource1" />
    <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" Text="رجوع" CausesValidation="False" meta:resourcekey="btnCancelResource1" />

</asp:Content>
