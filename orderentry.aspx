<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    MaintainScrollPositionOnPostback="false" CodeBehind="orderentry.aspx.cs" Inherits="mulch.orderentry" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <!-- Add jQuery library -->
    <script type="text/javascript" src="lib/jquery-1.10.1.min.js"></script>
    <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="lib/jquery.mousewheel-3.0.6.pack.js"></script>
    <!-- Add fancyBox main JS and CSS files -->
    <script type="text/javascript" src="source/jquery.fancybox.js?v=2.1.5"></script>
    <link rel="stylesheet" type="text/css" href="source/jquery.fancybox.css?v=2.1.5"
        media="screen" />
    <!-- Add Button helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="source/helpers/jquery.fancybox-buttons.css?v=1.0.5" />
    <script type="text/javascript" src="source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
    <!-- Add Thumbnail helper (this is optional) -->
    <link rel="stylesheet" type="text/css" href="source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" />
    <script type="text/javascript" src="source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
    <!-- Add Media helper (this is optional) -->
    <script type="text/javascript" src="source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.fancybox-media').fancybox({
                openEffect: 'none',
                closeEffect: 'none',
                helpers: {
                    media: {}
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="pagetitle">
        <asp:Label ID="lblTitle" CssClass="pagetitle" runat="server" Text="Label"></asp:Label>
    </div>
    <div class="message">
        <asp:Panel ID="pnlMessage" Visible="true" runat="server">
            <table>
                <tr>
                    <td align="left">
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
    <asp:Panel ID="pnlOrder" Visible="true" runat="server">
        <table width="80%" cellpadding="2" cellspacing="2" align="center" border="0">
            <tr>
                <td class="requiredfield" align="left">
                    * Required Field
                </td>
            </tr>
            <tr>
                <td class="requiredfield" align="center">
                    <asp:Label ID="lblErrorMsg" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="requiredfield" align="left">
                    <asp:ValidationSummary ID="vsOrderEntry" DisplayMode="BulletList" HeaderText="The following should be corrected:"
                        runat="server" />
                </td>
            </tr>
            <tr>
                <td class="pagelabel" width="100%">
                    <fieldset>
                        <legend class="legendlabel">Delivery Address:</legend>
                        <table cellpadding="2" cellspacing="2" align="center" border="0">
                            <tr>
                                <td class="pagelabel">
                                    <font class="requiredfield">*</font>Address:
                                </td>
                                <td colspan="3" class="pagetext">
                                    <asp:TextBox ID="txtAddress" CssClass="pagetext" runat="server" Width="350px" OnTextChanged="txtAddress_TextChanged"
                                        AutoPostBack="true"></asp:TextBox><br />
                                    <asp:PlaceHolder ID="phAddressSearch" Visible="false" runat="server">
                                        <asp:ListBox ID="lstAddresses" CssClass="pagetext" runat="server" OnTextChanged="lstAddresses_TextChanged"
                                            AutoPostBack="True"></asp:ListBox>
                                    </asp:PlaceHolder>
                                </td>
                                <td class="pagelabel">
                                    <asp:CheckBox ID="chkResetBlock" Text="Reset Block" ToolTip="Resets Delivery Block to 0"
                                        Visible="false" Checked="false" runat="server" />
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Street Address is Required."
                                ControlToValidate="txtAddress" InitialValue="" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                            <tr>
                                <td class="pagelabel">
                                    <font class="requiredfield">*</font>City:
                                </td>
                                <td class="pagetext">
                                    <asp:TextBox ID="txtCity" CssClass="pagetext" runat="server" OnTextChanged="txtAddress_TextChanged"
                                        AutoPostBack="true"></asp:TextBox>
                                </td>
                                <td class="pagelabel">
                                    <font class="requiredfield">*</font>State:
                                </td>
                                <td class="pagetext" colspan="2">
                                    <asp:DropDownList ID="lstState" CssClass="pagetext" runat="server">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="City is Required."
                                ControlToValidate="txtCity" InitialValue="" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="State is Required."
                                ControlToValidate="lstState" InitialValue="0" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                            <tr>
                                <td class="pagelabel">
                                    <font class="requiredfield">*</font>Zip Code:
                                </td>
                                <td class="pagetext">
                                    <asp:TextBox ID="txtZipCode" CssClass="pagetext" runat="server" OnTextChanged="txtAddress_TextChanged"
                                        AutoPostBack="true" Width="112px"></asp:TextBox>
                                </td>
                                <td class="pagelabel">
                                    Latitude / Longitude:
                                </td>
                                <td class="requiredfield" align="left" colspan="2">
                                    <%=Page.Session["mapUrl"]%>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="Zip Code is Required."
                                ControlToValidate="txtZipCode" InitialValue="" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td class="pagelabel" width="35%">
                    <fieldset>
                        <legend class="legendlabel">Customer Information:</legend>
                        <table cellpadding="2" cellspacing="2" align="left" border="0" style="width: 94%">
                            <tr>
                                <td class="pagelabel">
                                    Scout Parent:
                                </td>
                                <td class="pagetext" colspan="3">
                                    <asp:CheckBox ID="chkParent" runat="server" />
                                </td>
                            </tr>

                            <tr>
                                <td class="pagelabel" nowrap>
                                    <font class="requiredfield">*</font>First Name:
                                </td>
                                <td class="pagetext">
                                    <asp:TextBox ID="txtFirstName" CssClass="pagetext" runat="server" Width="150px"></asp:TextBox>
                                </td>
                                <td class="pagelabel" nowrap>
                                    <font class="requiredfield">*</font>Last Name:
                                </td>
                                <td class="pagetext">
                                    <asp:TextBox ID="txtLastName" CssClass="pagetext" runat="server" Width="250px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="pagelabel">
                                    Phone:
                                </td>
                                <td class="pagetext">
                                    <asp:TextBox ID="txtPhone" CssClass="pagetext" runat="server" Width="125px"></asp:TextBox>
                                </td>
                                <td class="pagelabel">
                                    Email:
                                </td>
                                <td class="pagetext">
                                    <asp:TextBox ID="txtEmail" CssClass="pagetext" runat="server" Width="250px"></asp:TextBox>
                                    <asp:CustomValidator ID="cvEmail" ControlToValidate="txtEmail" OnServerValidate="ValidateEmail"
                                        ValidateEmptyText="false" Display="None" EnableClientScript="False" runat="server"
                                        ErrorMessage="Email address is invalid."></asp:CustomValidator>
                                </td>
                            </tr>
                            <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="First Name is Required."
                                ControlToValidate="txtFirstName" InitialValue="" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="Last Name is Required."
                                ControlToValidate="txtLastName" InitialValue="" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                        </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td class="pagelabel" colspan="2">
                    <fieldset>
                        <legend class="legendlabel">Order Information:</legend>
                        <table cellpadding="2" cellspacing="2" align="center" border="0">
                            <tr>
                                <td align="left">
                                    <asp:CheckBox ID="chkSplit" Text="Split Order" CausesValidation="false" AutoPostBack="true"
                                        runat="server" OnCheckedChanged="chkSplit_CheckedChanged" />
                                </td>
                                <td nowrap class="pagelabel" colspan="5" id="splitLabel" visible="false" runat="server">
                                    <asp:Label ID="lblSplit" runat="server" Text="Select # of Scouts (1 to 5)"></asp:Label>
                                    <asp:DropDownList ID="lstSplitScouts" CausesValidation="false" AutoPostBack="true"
                                        runat="server" OnSelectedIndexChanged="lstSplitScouts_SelectedIndexChanged">
                                        <asp:ListItem># of Scouts</asp:ListItem>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <asp:PlaceHolder ID="phSingle" Visible="false" runat="server">
                                <tr>
                                    <td>
                                        <font class="requiredfield">*</font>Scout Name:
                                    </td>
                                    <td class="pagetext">
                                        <asp:DropDownList ID="lstScout" CssClass="pagetext" runat="server">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <font class="requiredfield">*</font>Check Number:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCheckNumber" CssClass="pagetext" runat="server" Width="56px"></asp:TextBox>
                                    </td>
                                    <td>
                                        <font class="requiredfield">*</font>Check Amount:
                                    </td>
                                    <td>
                                        <asp:TextBox ID="txtCheckAmount" CssClass="pagetext" runat="server" Width="64px"></asp:TextBox>
                                    </td>
                                </tr>
                            </asp:PlaceHolder>
                            <asp:PlaceHolder ID="phMultiple" Visible="false" runat="server">
                                <tr>
                                    <td colspan="4">
                                        <table align="center" cellpadding="2" cellspacing="2">
                                            <tr id="splitHeader" visible="false" runat="server">
                                                <td align="left">
                                                    <font class="requiredfield">*</font>Scout
                                                </td>
                                                <td align="left">
                                                    <font class="requiredfield">*</font>Bags
                                                </td>
                                                <td align="left">
                                                    <font class="requiredfield">*</font>Check #
                                                </td>
                                                <td align="left">
                                                    <font class="requiredfield">*</font>Amount
                                                </td>
                                            </tr>
                                            <tr id="split1" visible="false" runat="server">
                                                <td class="pageText">
                                                    <asp:DropDownList ID="lstScout1" CssClass="pagetext" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="lstBags1" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCheckNumber1" Width="56px" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAmount1" Width="64px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="split2" visible="false" runat="server">
                                                <td class="pageText">
                                                    <asp:DropDownList ID="lstScout2" CssClass="pagetext" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="lstBags2" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCheckNumber2" Width="56px" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAmount2" Width="64px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="split3" visible="false" runat="server">
                                                <td class="pageText">
                                                    <asp:DropDownList ID="lstScout3" CssClass="pagetext" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="lstBags3" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCheckNumber3" Width="56px" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAmount3" Width="64px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="split4" visible="false" runat="server">
                                                <td class="pageText">
                                                    <asp:DropDownList ID="lstScout4" CssClass="pagetext" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="lstBags4" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCheckNumber4" Width="56px" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAmount4" Width="64px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr id="split5" visible="false" runat="server">
                                                <td class="pageText">
                                                    <asp:DropDownList ID="lstScout5" CssClass="pagetext" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="lstBags5" runat="server">
                                                    </asp:DropDownList>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtCheckNumber5" Width="56px" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="txtAmount5" Width="64px" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </asp:PlaceHolder>
                            <asp:RequiredFieldValidator ID="rfvScout" runat="server" ErrorMessage="Scout is Required."
                                ControlToValidate="lstScout" InitialValue="0" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvCheckNumber" runat="server" ErrorMessage="Check Number is Required."
                                ControlToValidate="txtCheckNumber" InitialValue="" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="rfvCheckAmount" runat="server" ErrorMessage="Check Amount is Required."
                                ControlToValidate="txtCheckAmount" InitialValue="" Display="None" EnableClientScript="False"></asp:RequiredFieldValidator>
                            <tr>
                                <td colspan="6">
                                    <fieldset>
                                        <legend class="legendlabel"><font class="requiredfield">*</font>Order Detail:</legend>
                                        <table width="100%" border="0">
                                            <tr>
                                                <td align="left" valign="top">
                                                    <img src="images/2_shop_submast.gif" width="262px" height="27" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">
                                                    <asp:GridView ID="gvOrder" AutoGenerateColumns="false" HeaderStyle-CssClass="pagelabel"
                                                        RowStyle-BackColor="LightGray" AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000"
                                                        CellPadding="2" Width="100%" DataKeyField="Quantity" ItemStyle-HorizontalAlign="Left"
                                                        Visible="true" AlternatingItemStyle-BackColor="White" OnRowDataBound="gvOrder_RowDataBound"
                                                        runat="server">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="Select Item" ItemStyle-CssClass="pagetextright" ItemStyle-BackColor="White">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="chkSelect" Checked='<%# Bind("Selected") %>' OnCheckedChanged="gvOrder_chkSelect_onCheckChanged"
                                                                        AutoPostBack="true" runat="server" />
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Right" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Id" ReadOnly="True" DataField="Product_Id" ItemStyle-CssClass="pagetextright"
                                                                ItemStyle-BackColor="White"></asp:BoundField>
                                                            <asp:BoundField HeaderText="Product Name" ReadOnly="True" DataField="Product_Description"
                                                                ItemStyle-BackColor="White" HeaderStyle-CssClass="pagelabelleft" ItemStyle-CssClass="pagetext">
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="pagetextright"
                                                                ItemStyle-BackColor="White">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("sPrice") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Quantity" ItemStyle-CssClass="pagetextright" ItemStyle-BackColor="White">
                                                                <ItemTemplate>
                                                                    <asp:DropDownList ID="lstQty" AutoPostBack="true" EnableViewState="true" runat="server"
                                                                        OnSelectedIndexChanged="CalculateTotal" Visible="false" CssClass="pagetextright"
                                                                        DataTextField="qtyText" DataValueField="qtyValue">
                                                                    </asp:DropDownList>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="pagetextright"
                                                                ItemStyle-BackColor="White">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblTotal" runat="server" Text='<%# Bind("sTotal") %>'></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField HeaderText="Quantity" Visible="false" DataField="Quantity" ItemStyle-CssClass="pagetextright"
                                                                ItemStyle-BackColor="White"></asp:BoundField>
                                                        </Columns>
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </fieldset>
                                </td>
                            </tr>
                            <tr>
                                <td class="pagelabelleft" colspan="6">
                                    Delivery Instructions:<br />
                                    <asp:TextBox ID="txtDeliveryInstructions" TextMode="MultiLine" Rows="2" Width="100%"
                                        runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="pagelabelleft" colspan="6">
                                    Internal Notes:<br />
                                    <asp:TextBox ID="txtNotes" TextMode="MultiLine" Rows="2" Width="100%" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" align="center" valign="middle">
                                    <asp:Button ID="btnSubmit" Text="Submit" runat="server" OnClick="btnSubmit_Click" />&nbsp;<asp:Button
                                        ID="btnReset" CausesValidation="false" Text="Reset" runat="server" OnClick="btnReset_Click" />&nbsp;<asp:Button
                                            ID="btnCancel" CausesValidation="false" Text="Cancel" runat="server" OnClick="btnCancel_Click" />&nbsp;
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" align="center">
                                    <hr color="grey" />
                                </td>
                            </tr>
                            <tr>
                                <td class="pageLabel" align="center" colspan="6">
                                    <asp:PlaceHolder ID="phSearch" Visible="true" runat="server">
                                        <asp:Label ID="lblSearchError" CssClass="requiredfield" Visible="false" runat="server"
                                            Text="Please enter a Search Term!"></asp:Label><br />
                                        <asp:Label ID="lblSearch" runat="server" Text="Search: "></asp:Label>&nbsp;
                                        <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>&nbsp;
                                        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" CausesValidation="false"
                                            Text="Go" />&nbsp;
                                        <asp:Button ID="btnClearSearch" runat="server" OnClick="btnClear_Click" CausesValidation="false"
                                            Text="Clear" />
                                    </asp:PlaceHolder>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="3">
                                    <asp:Label ID="lblOrders" runat="server" Text=""></asp:Label>
                                </td>
                                <td align="right" colspan="3">
                                    Export to Excel&nbsp;&nbsp;<asp:ImageButton ID="iexpExcel" AlternateText="Export orders to Excel"
                                        ImageUrl="images/excel.gif" Height="25px" Width="25px" CausesValidation="false"
                                        runat="server" OnClick="iexpExcel_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" align="left">
                                    <asp:GridView ID="gvOrders" HeaderStyle-CssClass="gridheader" RowStyle-BackColor="lightgray"
                                        AlternatingRowStyle-BackColor="White" AlternatingRowStyle-ForeColor="#000" RowStyle-ForeColor="#000"
                                        runat="server" AutoGenerateColumns="false" AllowPaging="true" AllowSorting="true"
                                        OnPageIndexChanging="OnRequestPageIndexChanging" OnSorting="gvOrders_Sorting"
                                        OnRowCommand="gvOrders_RowCommand" HeaderStyle-HorizontalAlign="Center" DataKeyField="Order_Id"
                                        CellPadding="3" OnRowDataBound="gvOrders_RowDataBound" CellSpacing="3" Width="100%"
                                        GridLines="None" PageSize="200" RowHeaderColumn="Order_Id" DataKeyNames="Order_Id"
                                        OnSelectedIndexChanged="gvOrders_SelectedIndexChanged" EmptyDataRowStyle-HorizontalAlign="Center"
                                        EmptyDataText="No orders for this event" BorderColor="#33CCFF" BorderStyle="Outset">
                                        <AlternatingRowStyle BackColor="White" ForeColor="Black" />
                                        <Columns>
                                            <asp:BoundField DataField="Order_Id" HeaderText="Id" ItemStyle-CssClass="gridrow"
                                                SortExpression="Order_Id" Visible="true">
                                                <ItemStyle CssClass="gridrow" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Order_No" HeaderText="Order #" ItemStyle-CssClass="pagetext"
                                                SortExpression="Order_No" Visible="true">
                                                <ItemStyle CssClass="gridrow" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Parent" HeaderText="Parent" ItemStyle-CssClass="gridrow"
                                                ItemStyle-HorizontalAlign="Right" SortExpression="Parent">
                                                <ItemStyle CssClass="gridrow" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Name" HeaderText="Customer" ItemStyle-CssClass="gridrow"
                                                SortExpression="Name">
                                                <ItemStyle CssClass="gridrow" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-CssClass="gridrow"
                                                SortExpression="Street,StreetNumber">
                                                <ItemStyle CssClass="gridrow" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Scout_Name" HeaderText="Scout" ItemStyle-CssClass="gridrow"
                                                SortExpression="Scout_Name">
                                                <ItemStyle CssClass="gridrow" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Bags" HeaderText="Mulch" ItemStyle-CssClass="gridrow"
                                                ItemStyle-HorizontalAlign="Right" SortExpression="Bags">
                                                <ItemStyle CssClass="gridrow" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="Edit" ItemStyle-CssClass="gridrow" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgEdit" CausesValidation="false" AlternateText="Edit Order"
                                                        ToolTip="Edit Order" ImageUrl="images/edit.png" Height="15px" Width="15px" CommandName="EditRow"
                                                        CommandArgument='<%# Bind("Order_Id") %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="gridrow" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Remove" ItemStyle-CssClass="gridrow" ItemStyle-HorizontalAlign="Center">
                                                <ItemTemplate>
                                                    <asp:ImageButton ID="imgDelete" CausesValidation="false" AlternateText="Remove Order"
                                                        ToolTip="Remove Order" ImageUrl="images/Remove.png" Height="15px" Width="15px"
                                                        CommandName="RemoveRow" CommandArgument='<%# Bind("Order_Id") %>' runat="server" />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="gridrow" HorizontalAlign="Center" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                                        <HeaderStyle Font-Bold="True" ForeColor="#FFFFCC" />
                                        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Left" />
                                        <RowStyle BackColor="LightGray" ForeColor="Black" />
                                    </asp:GridView>
                                    <asp:GridView ID="gvExport" Visible="false" AllowPaging="false" AllowSorting="false"
                                        runat="server">
                                        <Columns>
                                            <asp:BoundField DataField="Order_No" HeaderText="Order_No" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Customer_Name" HeaderText="Customer_Name" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Cust_Last_Name" HeaderText="Cust_Last_Name" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Scout" HeaderText="Scout" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Address" HeaderText="Address" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="City" HeaderText="City" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Zip" HeaderText="Zip" ItemStyle-CssClass="pagenote" Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Phone" HeaderText="Phone" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Email" HeaderText="Email" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Bags" HeaderText="Bags" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Block" HeaderText="Block" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Status" HeaderText="Status" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Driver" HeaderText="Driver" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Location" HeaderText="Location" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Latitude" HeaderText="Latitude" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Longitude" HeaderText="Longitude" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Dir-Distance" HeaderText="Dir-Distance" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Patrol" HeaderText="Patrol" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Cross_Street" HeaderText="Cross_Street" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Delivery_Instructions" HeaderText="Delivery_Instructions"
                                                ItemStyle-CssClass="pagenote" Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Distance" HeaderText="Distance" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="BlockDistance" HeaderText="BlockDistance" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Addresses_To_GeoCode" HeaderText="Addresses_To_GeoCode"
                                                ItemStyle-CssClass="pagenote" Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Street_Number" HeaderText="Street_Number" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Street" HeaderText="Street" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="From_Order" HeaderText="From_Order" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Calculated" HeaderText="Calculated" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Paid" HeaderText="Paid" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Collected" HeaderText="Collected" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Check_No" HeaderText="Check_No" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Scout_Owes" HeaderText="Scout_Owes" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="AddressId" HeaderText="AddressId" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="Comments" HeaderText="Comments" ItemStyle-CssClass="pagenote"
                                                Visible="true">
                                                <ItemStyle CssClass="pagenote" />
                                            </asp:BoundField>
                                        </Columns>
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </fieldset>
                    <asp:HiddenField ID="hfCustomerId" runat="server" />
                    <asp:HiddenField ID="hfOrderId" runat="server" />
                </td>
            </tr>
        </table>
    </asp:Panel>
</asp:Content>
