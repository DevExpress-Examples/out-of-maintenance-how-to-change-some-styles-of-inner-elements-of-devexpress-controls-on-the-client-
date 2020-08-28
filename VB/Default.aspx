<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxFormLayout" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxDocking" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxTabControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v14.1, Version=14.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxClasses" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style type="text/css">
        .noImage
        {
            background-image: none !important;
        }
    </style>
    <script type="text/javascript">
        function headerColorCombobox_SelectedIndexChanged(s, e) {
            var dpElement = dockPanel.GetMainElement();
            var headerElement = dpElement.getElementsByClassName("dpHeader")[0];
            headerElement.style.backgroundColor = s.GetValue();
        }
        function contentColorCombobox_SelectedIndexChanged(s, e) {
            var dpElement = dockPanel.GetMainElement();
            var headerElement = dpElement.getElementsByClassName("dpContent")[0];
            headerElement.style.backgroundColor = s.GetValue();
        }

        function ChangeColor(color, tabName) {
            var tabElement = pc.GetMainElement().getElementsByClassName(tabName)[0];
            var activeTabElement = pc.GetMainElement().getElementsByClassName(tabName)[1];
            tabElement.style.backgroundColor = color;
            activeTabElement.style.backgroundColor = color;
        }
        function ChangeColorForAllTabs(color) {
            $('.myTab').css({ 'background-Color': color });
        }
    </script>
    <script type="text/javascript" src="Scripts/jquery-2.1.3.js"></script>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server">
            <Items>
                <dx:LayoutGroup ColCount="2" Caption="ASPxDockPanel Example">
                    <Items>
                        <dx:LayoutItem Caption="Header color">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="headerColorCombobox" runat="server" ValueType="System.String">
                                        <ClientSideEvents SelectedIndexChanged="headerColorCombobox_SelectedIndexChanged" />
                                        <Items>
                                            <dx:ListEditItem Value="LightGray" Selected="true" />
                                            <dx:ListEditItem Value="Black" />
                                            <dx:ListEditItem Value="White" />
                                            <dx:ListEditItem Value="Orange" />
                                            <dx:ListEditItem Value="Yellow" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="" RowSpan="2">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxDockZone ID="ASPxDockZone1" runat="server" ZoneUID="zone1" Height="100" Orientation="Fill"></dx:ASPxDockZone>
                                    <dx:ASPxDockPanel ID="ASPxDockPanel1" runat="server" ClientInstanceName="dockPanel"
                                        OwnerZoneUID="zone1" AllowedDockState="DockedOnly" ShowCloseButton="false">
                                        <Styles>
                                            <Header CssClass="noImage dpHeader"></Header>
                                            <Content CssClass="dpContent"></Content>
                                        </Styles>
                                        <ContentCollection>
                                            <dx:PopupControlContentControl ID="PopupControlContentControl1" runat="server">Some content here...</dx:PopupControlContentControl>
                                        </ContentCollection>
                                    </dx:ASPxDockPanel>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem Caption="Content color">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer runat="server">
                                    <dx:ASPxComboBox ID="contentColorCombobox" runat="server" ValueType="System.String">
                                        <ClientSideEvents SelectedIndexChanged="contentColorCombobox_SelectedIndexChanged" />
                                        <Items>
                                            <dx:ListEditItem Value="LightGray" Selected="true" />
                                            <dx:ListEditItem Value="Black" />
                                            <dx:ListEditItem Value="White" Selected="true" />
                                            <dx:ListEditItem Value="Orange" />
                                            <dx:ListEditItem Value="Yellow" />
                                        </Items>
                                    </dx:ASPxComboBox>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                <dx:LayoutGroup ColCount="2" Caption="ASPxPageControl Example">
                    <Items>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer1" runat="server">
                                    <table>
                                        <tr>
                                            <td>
                                                <dx:ASPxRadioButtonList ID="ASPxRadioButtonList1" runat="server" Caption="Tab 1">
                                                    <Items>
                                                        <dx:ListEditItem Value="Red" />
                                                        <dx:ListEditItem Value="Yellow" />
                                                        <dx:ListEditItem Value="Green" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e){ ChangeColor(s.GetValue(),'tab1'); }" />
                                                </dx:ASPxRadioButtonList>
                                            </td>
                                            <td>
                                                <dx:ASPxRadioButtonList ID="ASPxRadioButtonList2" runat="server" Caption="Tab 2">
                                                    <Items>
                                                        <dx:ListEditItem Value="Red" />
                                                        <dx:ListEditItem Value="Yellow" />
                                                        <dx:ListEditItem Value="Green" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e){ ChangeColor(s.GetValue(),'tab2'); }" />
                                                </dx:ASPxRadioButtonList>
                                            </td>
                                            <td>
                                                <dx:ASPxRadioButtonList ID="ASPxRadioButtonList3" runat="server" Caption="Tab 3">
                                                    <Items>
                                                        <dx:ListEditItem Value="Red" />
                                                        <dx:ListEditItem Value="Yellow" />
                                                        <dx:ListEditItem Value="Green" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e){ ChangeColor(s.GetValue(),'tab3'); }" />
                                                </dx:ASPxRadioButtonList>
                                            </td>
                                        </tr>
                                    </table>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer2" runat="server">
                                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="1" ClientInstanceName="pc">
                                        <TabStyle CssClass="noImage "></TabStyle>
                                        <ActiveTabStyle CssClass="noImage"></ActiveTabStyle>
                                        <TabPages>
                                            <dx:TabPage>
                                                <TabStyle CssClass="tab1"></TabStyle>
                                                <ActiveTabStyle CssClass="tab1"></ActiveTabStyle>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl1" runat="server">
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage>
                                                <TabStyle CssClass="tab2"></TabStyle>
                                                <ActiveTabStyle CssClass="tab2"></ActiveTabStyle>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl2" runat="server">
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage>
                                                <TabStyle CssClass="tab3"></TabStyle>
                                                <ActiveTabStyle CssClass="tab4"></ActiveTabStyle>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl3" runat="server">
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                        </TabPages>
                                    </dx:ASPxPageControl>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
                    <dx:LayoutGroup ColCount="2" Caption="ASPxPageControl Example (jQuery)">
                    <Items>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer3" runat="server">
                                                <dx:ASPxRadioButtonList ID="ASPxRadioButtonList4" runat="server" Caption="Color for all tabs">
                                                    <Items>
                                                        <dx:ListEditItem Value="Red" />
                                                        <dx:ListEditItem Value="Yellow" />
                                                        <dx:ListEditItem Value="Green" />
                                                    </Items>
                                                    <ClientSideEvents SelectedIndexChanged="function(s, e){ ChangeColorForAllTabs(s.GetValue()); }" />
                                                </dx:ASPxRadioButtonList>

                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                        <dx:LayoutItem ShowCaption="False">
                            <LayoutItemNestedControlCollection>
                                <dx:LayoutItemNestedControlContainer ID="LayoutItemNestedControlContainer4" runat="server">
                                    <dx:ASPxPageControl ID="ASPxPageControl2" runat="server" ActiveTabIndex="1" ClientInstanceName="pageControl2">
                                        <TabStyle CssClass="noImage myTab"></TabStyle>
                                        <ActiveTabStyle CssClass="noImage myTab"></ActiveTabStyle>
                                        <TabPages>
                                            <dx:TabPage>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl4" runat="server">
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl5" runat="server">
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                            <dx:TabPage>
                                                <ContentCollection>
                                                    <dx:ContentControl ID="ContentControl6" runat="server">
                                                    </dx:ContentControl>
                                                </ContentCollection>
                                            </dx:TabPage>
                                        </TabPages>
                                    </dx:ASPxPageControl>
                                </dx:LayoutItemNestedControlContainer>
                            </LayoutItemNestedControlCollection>
                        </dx:LayoutItem>
                    </Items>
                </dx:LayoutGroup>
            </Items>
        </dx:ASPxFormLayout>
    </form>
</body>
</html>