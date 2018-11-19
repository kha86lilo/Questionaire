<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Account_Manage" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>
 <%@ Import Namespace="Microsoft.AspNet.Membership.OpenAuth" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>

    <section id="passwordForm">
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="False" ViewStateMode="Disabled">
            <p class="message-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>

        <p><asp:Localize ID="title1" runat="server" meta:resourcekey="title1Resource1" Text="You're logged in as"></asp:Localize>  <strong><%: User.Identity.Name %></strong>.</p>

   
        <asp:PlaceHolder runat="server" ID="changePassword" Visible="False"> 
            <asp:ChangePassword runat="server" CancelDestinationPageUrl="~/" ViewStateMode="Disabled" RenderOuterTable="false" SuccessPageUrl="Manage?m=ChangePwdSuccess" meta:resourcekey="ChangePasswordResource1">
                <ChangePasswordTemplate>
                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="FailureText" meta:resourcekey="FailureTextResource1" />
                    </p>
                    <fieldset class="changePassword">
                        <legend>Change password details</legend>
                        <ol>
                            <li>
                                <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword" meta:resourcekey="CurrentPasswordLabelResource1">Current password</asp:Label>
                                <asp:TextBox runat="server" ID="CurrentPassword" CssClass="passwordEntry" TextMode="Password" meta:resourcekey="CurrentPasswordResource1" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                    CssClass="field-validation-error" ErrorMessage="The current password field is required." meta:resourcekey="RequiredFieldValidatorResource1" />
                            </li>
                            <li>
                                <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" meta:resourcekey="NewPasswordLabelResource1">New password</asp:Label>
                                <asp:TextBox runat="server" ID="NewPassword" CssClass="passwordEntry" TextMode="Password" meta:resourcekey="NewPasswordResource1" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="field-validation-error" ErrorMessage="The new password is required." meta:resourcekey="RequiredFieldValidatorResource2" />
                            </li>
                            <li>
                                <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" meta:resourcekey="ConfirmNewPasswordLabelResource1">Confirm new password</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" CssClass="passwordEntry" TextMode="Password" meta:resourcekey="ConfirmNewPasswordResource1" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Confirm new password is required." meta:resourcekey="RequiredFieldValidatorResource3" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match." meta:resourcekey="CompareValidatorResource1" />
                            </li>
                        </ol>
                        <asp:Button runat="server" CommandName="ChangePassword" Text="Change password" meta:resourcekey="ButtonResource1" />
                    </fieldset>
                </ChangePasswordTemplate>
            </asp:ChangePassword>
        </asp:PlaceHolder>
    </section>

 </asp:Content>
