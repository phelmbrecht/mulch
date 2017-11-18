<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="login.aspx.cs" Inherits="mulch.login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="pagetitle">
        Mulch System Login
    </div>
    <div class="message" align="center">
        <asp:Panel ID="pnlMessage" Visible="false" HorizontalAlign="Center" runat="server">
            <table align="center" border="0" width="100%">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblMessage" runat="server" Text="Message Here"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:Button ID="btnMsgOK" runat="server" CausesValidation="false" Text="OK" OnClick="btnMsgOK_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <br />
    <br />
    <table align="center" cellpadding="3" cellspacing="3">
        <tr>
            <td class="requiredfield">
                * Required Field
            </td>
        </tr>
        <tr>
            <td class="requiredfield" colspan="2">
                <asp:Label ID="lblErrorMsg" runat="server" Text="" Visible="false"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="requiredfield">
                <asp:ValidationSummary ID="vsLogin" DisplayMode="BulletList" HeaderText="The following should be corrected:"
                    runat="server" />
            </td>
        </tr>
        <tr>
            <td class="pagelabel">
                <font class="requiredfield">*</font>User Name:
            </td>
            <td class="pagetext">
                <asp:TextBox ID="txtUserName" AutoCompleteType="None" CssClass="pagetext" Width="200px"
                    runat="server"></asp:TextBox>
            </td>
        </tr>
        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="User Name is Required."
            ControlToValidate="txtUserName" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
        <asp:PlaceHolder ID="phcPwd" Visible="true" runat="server">
            <tr>
                <td class="pagelabel">
                    <font class="requiredfield">*</font>Password:
                </td>
                <td class="pagetext">
                    <asp:TextBox ID="txtPassword" TextMode="Password" AutoCompleteType="None" CssClass="pagetext"
                        Width="200px" runat="server"></asp:TextBox>
                </td>
            </tr>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is Required."
                ControlToValidate="txtPassword" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
        </asp:PlaceHolder>
        <asp:PlaceHolder ID="phPwd" Visible="false" runat="server">
            <tr>
                <td class="pagelabel" valign="bottom">
                    
                   <font class="requiredfield">*</font>New Password:
                </td>
                <td class="pagetext">
                <div class="pagenote" align="center"><b>Please change your password<br />before proceeding.</b></div>
                    <asp:TextBox ID="txtNewPwd" TextMode="Password" Width="200px" MaxLength="20" runat="server"></asp:TextBox>
                </td>
                <asp:RequiredFieldValidator ID="rfvNewPassword" runat="server" ErrorMessage="New Password is Required."
                    ControlToValidate="txtNewPwd" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
            </tr>
            <asp:CompareValidator ID="cvPwd" Display="None" EnableClientScript="False" ControlToCompare="txtConfirmNewPassword"
                ControlToValidate="txtNewPwd" runat="server" ErrorMessage="New Password and Confirm New Password must match."></asp:CompareValidator>
            <tr>
                <td class="pagelabel" valign="bottom">
                    <font class="requiredfield">*</font>Confirm New Password:
                </td>
                <td class="pagetext">
                    <asp:TextBox ID="txtConfirmNewPassword" TextMode="Password" Width="200px" MaxLength="20"
                        runat="server"></asp:TextBox>
                </td>
                <asp:CompareValidator ID="cvConfPwd" Display="None" EnableClientScript="False" ControlToCompare="txtNewPwd"
                    ControlToValidate="txtConfirmNewPassword" runat="server" ErrorMessage="Confirm New Password and New Password must match."></asp:CompareValidator>
            </tr>
        </asp:PlaceHolder>
        <tr>
            <td class="pagelabel" colspan="2">
                <asp:Button ID="btnLogin" Text="Login" runat="server" OnClick="btnLogin_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
