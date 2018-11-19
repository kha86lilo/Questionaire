<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Culture="auto" meta:resourcekey="PageResource1" UICulture="auto" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
    <section class="featured">
        <div class="content-wrapper">
            <hgroup class="title">
                <h1><%: Title %>.</h1>
                <h2>
                    <asp:Localize ID="Title2" runat="server" meta:resourcekey="Title2Resource1" Text="Modify this template to jump-start your ASP.NET application."></asp:Localize></h2>
            </hgroup>
            <p style="font-weight: bold">
                <asp:Localize ID="ParagraphIntro" runat="server" meta:resourcekey="ParagraphIntroResource1" Text="
                To learn more about ASP.NET, visit &lt;a href=&quot;https://asp.net&quot; title=&quot;ASP.NET Website&quot;&gt;https://asp.net&lt;/a&gt;. 
                The page features &lt;mark&gt;videos, tutorials, and samples&lt;/mark&gt; to help you get the most from 
                ASP.NET. If you have any questions about ASP.NET visit 
                &lt;a href=&quot;https://forums.asp.net/18.aspx&quot; title=&quot;ASP.NET Forum&quot;&gt;our forums&lt;/a&gt;.
                "></asp:Localize>
            </p>
        </div>
    </section>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h3>
        <asp:Localize ID="Features" runat="server" meta:resourcekey="FeaturesResource1" Text="We suggest the following:"></asp:Localize></h3>
    <ol class="round">



        <asp:LoginView runat="server" ID="loginviewControl1">
            <RoleGroups>

                <asp:RoleGroup Roles="Admin">
                    <ContentTemplate>
                        <li class="one">
                            <h5>
                                <asp:Localize ID="addDocTitle" runat="server" meta:resourcekey="addDocTitleResource1" Text="Getting Started"></asp:Localize></h5>
                            <asp:Localize ID="AddDocDetails" runat="server" meta:resourcekey="AddDocDetailsResource1" Text="
            ASP.NET Web Forms lets you build dynamic websites using a familiar drag-and-drop, event-driven model.
            A design surface and hundreds of controls and components let you rapidly build sophisticated, powerful UI-driven sites with data access.
           "></asp:Localize>
                            <a href="Docs\QformAdd">
                                <asp:Localize ID="clickHere1" runat="server" meta:resourcekey="clickHere"></asp:Localize>
                            </a>

                        </li>
                        <li class="two">
                            <h5>
                                <asp:Localize ID="SearchBookTitle" runat="server" meta:resourcekey="SearchBookTitleResource1" Text="Add NuGet packages and jump-start your coding"></asp:Localize></h5>
                            <asp:Localize ID="SearchBookDetails" runat="server" meta:resourcekey="SearchBookDetailsResource1" Text="
            NuGet makes it easy to install and update free libraries and tools.
            "></asp:Localize>
                            <a href="Docs\Qformslist">
                                <asp:Localize ID="clickhere2" runat="server" meta:resourcekey="clickHere"></asp:Localize>
                            </a>
                        </li>
                        <li class="three">
                            <h5>
                                <asp:Localize ID="myLogTitle" runat="server" meta:resourcekey="myLogTitleResource4" Text="Find Web Hosting"></asp:Localize></h5>
                            <asp:Localize ID="myLogDetails" runat="server" meta:resourcekey="myLogDetailsResource4" Text="
            You can easily find a web hosting company that offers the right mix of features and price for your applications.
                 "></asp:Localize>
                            <a href="account\admin\listusers">
                                <asp:Localize ID="clickhere4" runat="server" meta:resourcekey="clickHere"> </asp:Localize>
                            </a>
                        </li>
                        <li class="four">
                            <h5>
                                 بدء نموذج</h5>
                              للمشاهدة قائمة النماذج و بدء نموذج جديد
                            <a href="Docs2\Qformslist">
                                <asp:Localize ID="Localize1" runat="server" meta:resourcekey="clickHere"></asp:Localize>
                            </a>

                        </li>
                    </ContentTemplate>
                </asp:RoleGroup>

                <asp:RoleGroup Roles="User">
                    <ContentTemplate>
                        <li class="one">
                            <h5>
                                 بدء النماذج</h5>
                              للمشاهدة قائمة النماذج و بدء نموذج جديد
                            <a href="Docs2\Qformslist">
                                <asp:Localize ID="clickHere1" runat="server" meta:resourcekey="clickHere"></asp:Localize>
                            </a>

                        </li>
                         
                        
                    </ContentTemplate>
                </asp:RoleGroup>

            </RoleGroups>
            <AnonymousTemplate>
                <a id="loginLink" runat="server" href="~/Account/Login" style="width: 0px; height: 0px; display: inline-block;">
                    <input type="button" value="تسجيل الدخول" /></a>
            </AnonymousTemplate>
        </asp:LoginView>




    </ol>

</asp:Content>
