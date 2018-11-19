<%@ Page Title="بدء نموذج" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="QformUpdate.aspx.cs" Inherits="DeptAddUpd" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        .rdinput input{
            width:40px;
        }
    </style>
    <hgroup class="title">
          <h2>بدء نموذج</h2>
       : <h1><asp:Label  runat="server" ID="txtformName"></asp:Label></h1>
    </hgroup>
    
        <div class="float-right">
         
                                <asp:Label runat="server"   AssociatedControlID="txtReviewer">إسم المراجع:</asp:Label>
                                <asp:TextBox runat="server" ID="txtReviewer"  />
            <asp:Label runat="server"   AssociatedControlID="txtOpsName">إسم العملية:</asp:Label>
                                <asp:TextBox runat="server" ID="txtOpsName"  />
                                 <asp:Label runat="server" AssociatedControlID="txtDate"> التاريخ:</asp:Label>
                                <asp:TextBox runat="server" ID="txtDate" />
                            
                                          
                       <br /> 

    </div>
    <div  class="float-right" style="margin-right:70px" > 
            <asp:Label runat="server"   AssociatedControlID="txtReviewerOn">إسم المراجع عليه:</asp:Label>
                                <asp:TextBox runat="server" ID="txtReviewerOn"/>
                               
            <asp:Label runat="server"   AssociatedControlID="txtOpsCode">رمز العملية:</asp:Label>
                                <asp:TextBox runat="server" ID="txtOpsCode"  />
       
    </div>
     

         <asp:GridView ID="grdQuestion" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="false" Width="100%" DataKeyNames="Id" EmptyDataText="لم يتم إضافة أسئلة لهذا النموذج بعد" >
        
             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="450px">
                <HeaderTemplate>
                    &nbsp;<asp:Label ID="usrName" runat="server" Text="السؤال" meta:resourcekey="usrNameResource1"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    &nbsp; <%# Eval("QuestionText") %>
                </ItemTemplate> 
            </asp:TemplateField>
            
        
             <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                  <HeaderTemplate>
                   &nbsp;&nbsp;&nbsp; <asp:Label ID="lblyes" runat="server" Text="مطابق" meta:resourcekey="usrNameResource1"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:RadioButton ID="rdyes" runat="server" GroupName='<%#  "rd_" + Eval("Id")  %>' CssClass="rdinput" />
                </ItemTemplate>


            </asp:TemplateField>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="50px" HeaderStyle-Width="50px" >
                  <HeaderTemplate>
                   &nbsp;  <asp:Label ID="lblno" runat="server" Text="غير مطابق" meta:resourcekey="usrNameResource1"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:RadioButton ID="rdno" runat="server" GroupName='<%#  "rd_" + Eval("Id")  %>' CssClass="rdinput" />
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
            <asp:GridView ID="grdAnswers" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="false" Width="100%" DataKeyNames="Id" EmptyDataText="لم يتم إضافة أسئلة لهذا النموذج بعد" >
        
             <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="450px">
                <HeaderTemplate>
                    &nbsp;<asp:Label ID="usrName" runat="server" Text="السؤال" meta:resourcekey="usrNameResource1"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    &nbsp; <%# Eval("QuestionText") %>
                </ItemTemplate> 
            </asp:TemplateField>
            
        
             <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="50px" HeaderStyle-Width="50px">
                  <HeaderTemplate>
                   &nbsp;&nbsp;&nbsp; <asp:Label ID="lblyes" runat="server" Text="مطابق" meta:resourcekey="usrNameResource1"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:RadioButton ID="rdyes" runat="server" GroupName='<%#  "rd_" + Eval("Id")  %>' CssClass="rdinput" Checked='<%# ((bool)Eval("Answer"))   %>'/>
                </ItemTemplate>


            </asp:TemplateField>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Left" ItemStyle-Width="50px" HeaderStyle-Width="50px" >
                  <HeaderTemplate>
                   &nbsp;  <asp:Label ID="lblno" runat="server" Text="غير مطابق" meta:resourcekey="usrNameResource1"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:RadioButton ID="rdno" runat="server" GroupName='<%#  "rd_" + Eval("Id")  %>' CssClass="rdinput" Checked='<%#  !((bool)Eval("Answer"))  %>' />
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
 
  <br />
     <div class="float-right">
         
                                <asp:Label runat="server" id="lbltxtAuditor"  AssociatedControlID="txtAuditor">إسم المدقق:</asp:Label>
                                <asp:TextBox runat="server" ID="txtAuditor"  />
         <asp:Label runat="server"  id="lbltxtAuditSign" AssociatedControlID="txtAuditSign">التوقيع:</asp:Label>
                                <asp:TextBox runat="server" ID="txtAuditSign"  />
                                           
                       <br /> 

    </div>
    <div  class="float-right" style="margin-right:70px" > <asp:Label runat="server" id="lbltxtAuditorOn"  AssociatedControlID="txtAuditorOn">إسم المدقق عليه:</asp:Label>
                                <asp:TextBox runat="server" ID="txtAuditorOn"/>
                                  
                                 <asp:Label runat="server" ID="lbltxtAuditonSign" AssociatedControlID="txtAuditonSign"> التوقيع:</asp:Label>
                                <asp:TextBox runat="server" ID="txtAuditonSign" />
                            
       
    </div>
              <br  style="clear:both"/>
     <asp:Button runat="server"  OnClick="RegisterUser_CreatedUser" Text="حفظ" meta:resourcekey="ButtonResource1" />
      <asp:Button runat="server" ID="btnprint"  OnClick="btnprint_Click" Text="طباعة" meta:resourcekey="ButtonResource1" ValidationGroup="vlg2" /> 
    <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" Text="رجوع" CausesValidation="False" meta:resourcekey="btnCancelResource1" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script type="text/javascript" src="../js/jquery.calendars.js"></script> 
    <script src="../js/jquery.calendars.islamic.js"></script>
    <script type="text/javascript"  src="../js/jquery.calendars.islamic-ar.js"></script>
    <script type="text/javascript" src="../js/jquery.calendars.plus.js"></script>
    <link href="../css/smoothness.calendars.picker.css" rel="stylesheet" /> 
<script type="text/javascript" src="../js/jquery.plugin.js"></script> 
<script type="text/javascript"      src="../js/jquery.calendars.picker.js"></script>

 <script type="text/javascript">
  
    calendar2 = $.calendars.instance("ummalqura",'ar'); 
$('#MainContent_txtDate').calendarsPicker($.extend({
    
    prevText: 'السابق',
    nextText: 'التالي',
    todayText: 'اليوم',
    closeText: 'إغلاق',
    clearText: 'مسح', 
      isRTL: true,
    calendar:calendar2, altFormat: 'DD, d MM, yyyy', localNumbers: true}, 
    $.calendarsPicker.regionalOptions['ar']));  
 </script>
</asp:Content>
