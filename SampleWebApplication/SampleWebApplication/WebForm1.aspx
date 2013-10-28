<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="SampleWebApplication.WebForm1" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Supported Menus</title>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scriptManager1" EnablePageMethods="true" runat="server">
    </asp:ScriptManager>
    <div style="top: 15px; left: 10px; position: absolute; height: 19px; width: 927px;
        text-align: center">
        <asp:Label ID="Label1" runat="server" Text="Label" Font-Bold="True" Font-Names="Arial" Font-Size="Large">Supported Menus</asp:Label>
    </div>
    <br /><br />
    <div id="tabs">
        <ajaxToolkit:TabContainer ID="tabContainer" runat="server" Width="60%" ActiveTabIndex="2"
            Height="337px">
            <ajaxToolkit:TabPanel ID="Tab1" runat="server" HeaderText="Main" BorderColor="#6699FF"
                BackColor="#6699FF">
                <ContentTemplate>
                    <asp:Panel ID="Panel1" runat="server" Height="100%" Width="100%">
                        <asp:Button ID="Button1" runat="server" Text="User With No Access To Supported Menus" />
                        <asp:Button ID="Button2" runat="server" Text="User With Read Access To Supported Menus" />
                        <asp:Button ID="Button3" runat="server" Text="User With Edit Access To Supported Menus" />
                    </asp:Panel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="Tab2" runat="server" HeaderText="Tab 2" BorderColor="#6699FF"
                BackColor="#6699FF">
                <ContentTemplate>
                    <asp:Panel ID="Panel2" runat="server" Height="100%" Width="100%">
                    </asp:Panel>
                </ContentTemplate>
            </ajaxToolkit:TabPanel>
            <ajaxToolkit:TabPanel ID="supportedMenus" runat="server" HeaderText="Supported Menus"
                BorderColor="#6699FF" BackColor="#6699FF" ForeColor="#6666FF">
                <ContentTemplate>
                    <asp:Panel ID="Panel3" runat="server" Height="100%" Width="100%">
                        <asp:GridView ID="DealerMenu" runat="server" GridLines="Horizontal" BorderColor="Black"
                            Width="100%" AutoGenerateColumns="False" 
                            OnRowDataBound="DealerMenu_RowDataBound">
                            <AlternatingRowStyle BackColor="#E1E1E1" Height="25px" BorderColor="Black" BorderStyle="Solid"
                                BorderWidth="1px" />
                            <Columns>
                                <asp:TemplateField HeaderText="Active">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="activeCheckBox" runat="server" TextAlign="Left" ViewStateMode="Disabled" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Menu System">
                                    <ItemTemplate>
                                        <asp:Label ID="menuSystem" runat="server" Text='<%#Eval("Menu_Description") %>' ViewStateMode="Disabled"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Activation Date">
                                    <ItemTemplate>
                                        <asp:TextBox ID="activationDateTextbox" runat="server" Text='<%#Eval("Activation_Date", "{0:MM/dd/yyyy}") %>'
                                            BorderStyle="None" Width="80" ViewStateMode="Disabled"></asp:TextBox>
                                    </ItemTemplate>
                                    <ControlStyle BorderStyle="Inset" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Interfaces">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="eRatingCheckBox" runat="server" TextAlign="Left" Checked='<%# bool.Parse(Eval("eRating").ToString()) %>' ViewStateMode="Disabled" />
                                        eRating &nbsp;&nbsp;
                                        <asp:CheckBox ID="eContractingCheckBox" runat="server" TextAlign="Left" Checked='<%# bool.Parse(Eval("eContracting").ToString()) %>' />
                                        eContracting
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="gridColumnBorder" />
                                    <ItemStyle CssClass="gridColumnBorder" HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="dealerID" runat="server" Value='<%# Eval("Dealer_ID") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="menuCode" runat="server" Value='<%# Eval("Menu_Code") %>' />
                                    </ItemTemplate>
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                </asp:TemplateField>
                            </Columns>
                            <HeaderStyle BackColor="#6699FF" Font-Bold="True" HorizontalAlign="Left" BorderColor="Black"
                                Height="25px" />
                            <RowStyle BackColor="White" Height="25px" BorderColor="Black" BorderStyle="Solid"
                                BorderWidth="1px" />
                        </asp:GridView>
                    </asp:Panel>
                    <asp:Panel ID="Panel4" runat="server">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClientClick="if (!validateForm()) {return false;}" OnClick="save_Click" />
                    </asp:Panel>
                    </contenttemplate>
        </ajaxToolkit:TabPanel> 
        </ajaxToolkit:TabContainer>
    </div>
    </form>
</body>
<script language="javascript" type="text/javascript">
<!--
    function validateForm() {

        var gridView = document.getElementById('<%=DealerMenu.ClientID %>');

        for (var i = 1; i < gridView.rows.length; i++) {

            var objCheckbox = gridView.rows[i].cells[0].childNodes[1];

            if (objCheckbox && objCheckbox.checked) {

                var objActivationDate = gridView.rows[i].cells[2].childNodes[1];

                if (objActivationDate && objActivationDate.value == '') {
                    alert("Please enter activation date for active rows.");
                    return false;
                }

                var objERating = gridView.rows[i].cells[3].childNodes[1];
                var objEContracting = gridView.rows[i].cells[3].childNodes[3];

                if (objERating && objEContracting) {
                    if (objERating.checked && objEContracting.checked){
                        alert("Please select either eRating or eContracing interface for active rows. You cannot select both.");
                        return false;
                    }
                    else if (!objERating.checked && !objEContracting.checked){
                        alert("Please select either eRating or eContracing interface for active rows.");
                        return false;
                    }
                }
            }
            else {
                var objActivationDate = gridView.rows[i].cells[2].childNodes[1];

                if (objActivationDate) objActivationDate.Text = '';

                var objERating = gridView.rows[i].cells[3].childNodes[1];
                var objEContracting = gridView.rows[i].cells[3].childNodes[3];

                if (objERating && objEContracting) {
                    objERating.checked = false;
                    objEContracting.checked = false;
                }
            }
        }
        return true;
    }




// -->
</script>
</html> 