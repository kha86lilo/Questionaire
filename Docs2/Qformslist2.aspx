<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Qformslist2.aspx.cs" Inherits="FormsList2" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        td {
            padding: 5px 1px;
        }
    </style>
    <asp:PlaceHolder runat="server" ID="successMessage" Visible="False" ViewStateMode="Disabled">
        <p class="message-success"><%: SuccessMessage %></p>
    </asp:PlaceHolder>
    <h1>السنوات السابقة.</h1>
    <br />
    <div class="float-left">
        
    </div>
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" Width="100%" DataKeyNames="Id" OnPageIndexChanging="GridView1_PageIndexChanging"  >
        <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
        <Columns>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right">
                <HeaderTemplate>
                    &nbsp;<asp:Label ID="usrName" runat="server" Text="اسم النموذج" meta:resourcekey="usrNameResource1"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    &nbsp; <a href='#' style="cursor: pointer; text-decoration: none; color: darkblue; font-size: large">
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("FormName") %>' meta:resourcekey="Label1Resource1"></asp:Label>
                    </a>
                </ItemTemplate>


            </asp:TemplateField>
             <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="150px">
                  <HeaderTemplate>
                    &nbsp;<asp:Label ID="lblyear" runat="server" Text="السنة" ></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                     <asp:Label ID="Label2" runat="server" Text='<%# Bind("year") %>' meta:resourcekey="Label1Resource1"></asp:Label>
                  </ItemTemplate>


            </asp:TemplateField>
            <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="left" HeaderStyle-Width="150px">

                <ItemTemplate>
                    &nbsp; <asp:Button ID="btnDirectToForm" runat="server" OnClick="btnDirectToForm_Click" Text="البدء" />
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


</asp:Content>
