<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ListUsers.aspx.cs" Inherits="AddUsers" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <style type="text/css">
        td{
            padding :5px 1px;
        }
    </style>
      <asp:PlaceHolder runat="server" ID="successMessage" Visible="False" ViewStateMode="Disabled">
            <p class="message-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder> 
        <h1><%: Title %>.</h1>
        <br />
            <div class="float-left"> 
                <asp:Button Text="Add a new User" runat="server" ID="btnAdd" OnClick="btnAdd_Click" meta:resourcekey="btnAddResource1"/>
            
            </div> 
        <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None"  AutoGenerateColumns="False" AllowPaging="True" Width="100%" DataKeyNames="UserName"  OnPageIndexChanging="GridView1_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
            <Columns >
                <asp:TemplateField meta:resourcekey="TemplateFieldResource1" ItemStyle-HorizontalAlign="Right">
                    <HeaderTemplate>
                       <asp:Label id="usrName" runat="server" text="User Name" meta:resourcekey="usrNameResource1"  ></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                      <asp:Label ID="Label1" runat="server" 
Text='<%# Bind("UserName") %>' meta:resourcekey="Label1Resource1"></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource2"  ItemStyle-HorizontalAlign="Right">
                    <HeaderTemplate>
                        <asp:Label id="usrEmail" runat="server" text="Email" meta:resourcekey="usrEmailResource1"  ></asp:Label>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" 
Text='<%# Bind("Email") %>' meta:resourcekey="Label2Resource1"></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource3"  ItemStyle-HorizontalAlign="Right">
                    <HeaderTemplate>
                         <asp:Label id="usrLoginDate" runat="server" text="Last Login Date" meta:resourcekey="usrLoginDateResource1"  ></asp:Label>
                   </HeaderTemplate>
                    <ItemTemplate>
                         <asp:Label ID="Label3" runat="server" 
Text='<%# Bind("LastLoginDate") %>' meta:resourcekey="Label3Resource1"></asp:Label>
                        
                    </ItemTemplate>

                </asp:TemplateField>
                <asp:TemplateField meta:resourcekey="TemplateFieldResource4" itemStyle-HorizontalAlign="center">
                    <HeaderTemplate>
                          <asp:Label id="usrActive" runat="server" text="Active" meta:resourcekey="usrActiveResource1"  ></asp:Label>
                   
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chklock" runat="server" Checked='<%# Bind("IsApproved") %>'  AutoPostBack="True" OnCheckedChanged="chklock_CheckedChanged" meta:resourcekey="chklockResource1"/>
                    </ItemTemplate>

                </asp:TemplateField>
                  <asp:TemplateField meta:resourcekey="TemplateFieldResource5"  itemStyle-HorizontalAlign="left">
                    <HeaderTemplate>
                        
                    </HeaderTemplate>
                    <ItemTemplate>
                          <a href="Manage?usrName=<%# Eval("UserName") %>" ><asp:Localize ID="locResetPass" Text="Reset Password" runat="server" meta:resourcekey="locResetPassResource1"></asp:Localize></a>
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