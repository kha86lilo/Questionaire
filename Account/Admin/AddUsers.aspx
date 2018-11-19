<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="AddUsers.aspx.cs" Inherits="AddUsers" culture="auto" meta:resourcekey="PageResource1" uiculture="auto" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Title %>.</h1> 
    </hgroup>
    <style type="text/css">
          .ddl{
            height:22px;width: 311px;direction:rtl;margin-top: 5px;height: 30px;margin-bottom: 7px;font-size: 17px;padding-right:3px
        }
    </style>
    <asp:CreateUserWizard runat="server" ID="RegisterUser" ViewStateMode="Disabled" OnCreatedUser="RegisterUser_CreatedUser" LoginCreatedUser="False" meta:resourcekey="RegisterUserResource1">
        <LayoutTemplate>
            <asp:PlaceHolder runat="server" ID="wizardStepPlaceholder" />
            <asp:PlaceHolder runat="server" ID="navigationPlaceholder" />
        </LayoutTemplate>
        <WizardSteps>
            <asp:CreateUserWizardStep runat="server" ID="RegisterUserWizardStep" meta:resourcekey="RegisterUserWizardStepResource1">
                <ContentTemplate>
                    <p class="message-info">
                         <asp:localize runat="server"  meta:resourcekey="LabelRe11" Text="Passwords are required to be a minimum of characters in length.">
                             
                         </asp:localize>                        
                    </p>

                    <p class="validation-summary-errors">
                        <asp:Literal runat="server" ID="ErrorMessage" meta:resourcekey="ErrorMessageResource1" />
                    </p>

                    <fieldset>
                        <legend>Registration Form</legend>
                        <ol>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="UserName" meta:resourcekey="LabelResource1">User name</asp:Label>
                                <asp:TextBox runat="server" ID="UserName" meta:resourcekey="UserNameResource1" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="UserName"
                                    CssClass="field-validation-error" ErrorMessage="The user name field is required." meta:resourcekey="RequiredFieldValidatorResource1" />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="Email" meta:resourcekey="LabelResource2">Email address</asp:Label>
                                <asp:TextBox runat="server" ID="Email" meta:resourcekey="EmailResource1" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                    CssClass="field-validation-error" ErrorMessage="The email address field is required." meta:resourcekey="RequiredFieldValidatorResource2" />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="Password" meta:resourcekey="LabelResource3">Password</asp:Label>
                                <asp:TextBox runat="server" ID="Password" TextMode="Password" meta:resourcekey="PasswordResource1" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                                    CssClass="field-validation-error" ErrorMessage="The password field is required." meta:resourcekey="RequiredFieldValidatorResource3" />
                            </li>
                            <li>
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" meta:resourcekey="LabelResource4">Confirm password</asp:Label>
                                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" meta:resourcekey="ConfirmPasswordResource1" />
                                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The confirm password field is required." meta:resourcekey="RequiredFieldValidatorResource4" />
                                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                     CssClass="field-validation-error" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." meta:resourcekey="CompareValidatorResource1" />
                            </li>
                             <li>
                                <asp:Label runat="server" AssociatedControlID="ConfirmPassword">الصلاحية</asp:Label>
                                <asp:DropDownList ID="ddlRoles" runat ="server" CssClass="ddl" >
                            <asp:ListItem Text="إداري" Value ="admin"></asp:ListItem>
                            <asp:ListItem Text="مستخدم" Value ="user"></asp:ListItem>
                        </asp:DropDownList>
                          </li>
                        </ol>

                        <asp:Button runat="server" CommandName="MoveNext" Text="Register" meta:resourcekey="ButtonResource1" />
                        <asp:Button runat="server" ID="btnCancel" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" meta:resourcekey="btnCancelResource1" />
                    </fieldset>
                </ContentTemplate>
                <CustomNavigationTemplate />
            </asp:CreateUserWizardStep> 
        </WizardSteps>
    </asp:CreateUserWizard>
</asp:Content>