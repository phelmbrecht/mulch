<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="mulch._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="pagetitle">Mulch Drive Delivery System </div><br /><br />
    <table width="50%" cellpadding="2" cellspacing="2" align="center" border="0">
    <%=html %>
        <asp:PlaceHolder ID="phOrderEntry" Visible="false" runat="server">
        <tr>
        <td align="center" colspan="2"><asp:Button ID="btnOrderEntry" OnClick="btnOrderEntry_Click" runat="server" Text="Button" />  </td>
        </tr>
        </asp:PlaceHolder>
    </table>

</asp:Content>
