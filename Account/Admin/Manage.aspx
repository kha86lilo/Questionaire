<%@ Page Title="Manage Account" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Manage.aspx.cs" Inherits="Account_Manage" culture="auto" meta:resourcekey="PageResource2" uiculture="auto" %>
 <%@ Import Namespace="Microsoft.AspNet.Membership.OpenAuth" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <hgroup class="title">
        <h1><%: Title %>.</h1>
    </hgroup>

    <section id="passwordForm">
        <asp:PlaceHolder runat="server" ID="successMessage" Visible="False" ViewStateMode="Disabled">
            <p class="message-success"><%: SuccessMessage %></p>
        </asp:PlaceHolder>

        <p><asp:Localize ID="loctitle" runat="server" Text="Changing Password for" meta:resourcekey="Labelloctitle"></asp:Localize> 
            <strong><%: Request.QueryString["usrName"] %></strong>
            <asp:Localize ID="loctitle2" runat="server" Text="Changing Password for" meta:resourcekey="Labelloctitle2"></asp:Localize>  .</p>

        <asp:PlaceHolder runat="server" ID="setPassword" Visible="False">
            <p>
                You do not have a local password for this site. Add a local
                password so you can log in without an external login.
            </p>
            <fieldset>
                <legend>Set Password Form</legend>
                <ol>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="password" meta:resourcekey="LabelResource2">Password</asp:Label>
                        <asp:TextBox runat="server" ID="password" TextMode="Password" meta:resourcekey="passwordResource1" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="password"
                            CssClass="field-validation-error" ErrorMessage="The password field is required."
                            Display="Dynamic" ValidationGroup="SetPassword" meta:resourcekey="RequiredFieldValidatorResource4" />
                        
                        <asp:Label runat="server" ID="newPasswordMessage" CssClass="field-validation-error"
                            AssociatedControlID="password" meta:resourcekey="newPasswordMessageResource1" />
                        
                    </li>
                    <li>
                        <asp:Label runat="server" AssociatedControlID="confirmPassword" meta:resourcekey="LabelResource3">Confirm password</asp:Label>
                        <asp:TextBox runat="server" ID="confirmPassword" TextMode="Password" meta:resourcekey="confirmPasswordResource1" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="confirmPassword"
                            CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required."
                            ValidationGroup="SetPassword" meta:resourcekey="RequiredFieldValidatorResource5" />
                        <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="confirmPassword"
                            CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match."
                            ValidationGroup="SetPassword" meta:resourcekey="CompareValidatorResource2" />
                    </li>
                </ol>
                <asp:Button runat="server" Text="Set Password" ValidationGroup="SetPassword" OnClick="setPassword_Click" meta:resourcekey="ButtonResource2" />
            </fieldset>
        </asp:PlaceHolder>

        <asp:PlaceHolder runat="server" ID="changePassword" Visible="False">
            
                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="FailureText" meta:resourcekey="FailureTextResource2" />
                    </p>
                    <fieldset class="changePassword">
                        <legend>Change password details</legend>
                        <ol> 
                            <li>
                                <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword" meta:resourcekey="NewPasswordLabelResource2">New password</asp:Label>
                                <asp:TextBox runat="server" ID="NewPassword" CssClass="passwordEntry" TextMode="Password" meta:resourcekey="NewPasswordResource2" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                    CssClass="field-validation-error" ErrorMessage="The new password is required." meta:resourcekey="RequiredFieldValidatorResource6" />
                            </li>
                            <li>
                                <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword" meta:resourcekey="ConfirmNewPasswordLabelResource2">Confirm new password</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmNewPassword" CssClass="passwordEntry" TextMode="Password" meta:resourcekey="ConfirmNewPasswordResource2" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="Confirm new password is required." meta:resourcekey="RequiredFieldValidatorResource7" />
                                <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                    CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The new password and confirmation password do not match." meta:resourcekey="CompareValidatorResource3" />
                            </li>
                        </ol>
                        <asp:Button runat="server" CommandName="ChangePassword" Text="Change password" OnClick="setPassword_Click" meta:resourcekey="ButtonResource3" />
                        <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="false" meta:resourcekey="btnCancelResource1" />
                    </fieldset> 
        </asp:PlaceHolder>
    </section>

 </asp:Content>
