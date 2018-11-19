<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="QformUpdate.aspx.cs" Inherits="DeptAddUpd" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
          <h1>تعديل نموذج</h1>
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
    
      <asp:Button runat="server"  OnClick="RegisterUser_CreatedUser" Text="حفظ" meta:resourcekey="ButtonResource1" />
    <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" Text="رجوع" CausesValidation="False" meta:resourcekey="btnCancelResource1" />


         <asp:GridView ID="grdQuestion" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" Width="100%" DataKeyNames="Id" EmptyDataText="لم يتم إضافة أسئلة لهذا النموذج بعد" >
        
             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right">
                <HeaderTemplate>
                    &nbsp;<asp:Label ID="usrName" runat="server" Text="السؤال" meta:resourcekey="usrNameResource1"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    &nbsp; <%# Eval("QuestionText") %>
                </ItemTemplate> 
            </asp:TemplateField>
            
        
             <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px">

                <ItemTemplate>
                    &nbsp;
                    <asp:LinkButton OnClick="Unnamed_Click" OnClientClick="return confirm('هل أنت متأكد من حذف هذا السؤال');" runat="server" Text="حذف">
                    </asp:LinkButton>
                </ItemTemplate>


            </asp:TemplateField>
        </Columns>
        <EditRowStyle BackColor="#999999"></EditRowStyle>

        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></FooterStyle>

        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White"></HeaderStyle>

        <PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

        <RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>

        <SortedAscendingCellStyle BackColor="#E9E7E2"></SortedAscendingCellStyle>

        <SortedAscendingHeaderStyle BackColor="#506C8C"></SortedAscendingHeaderStyle>

        <SortedDescendingCellStyle BackColor="#FFFDF8"></SortedDescendingCellStyle>

        <SortedDescendingHeaderStyle BackColor="#6F8DAE"></SortedDescendingHeaderStyle>
    </asp:GridView>
    <asp:TextBox ID="txtQuestion" runat="server"  ValidationGroup="vlg2" TextMode="MultiLine"  Columns="80" Rows="3" ></asp:TextBox>
       <asp:RequiredFieldValidator runat="server" ControlToValidate="txtQuestion"
                CssClass="field-validation-error" ErrorMessage="الرجاء إدخال السؤال" meta:resourcekey="RequiredFieldValidatorResource1" ValidationGroup="vlg2" />
      <br />
    <asp:Button runat="server" ID="btnAddQst"  OnClick="btnAddQst_Click" Text="إضافة سؤال" meta:resourcekey="ButtonResource1" ValidationGroup="vlg2" />

    
</asp:Content>
