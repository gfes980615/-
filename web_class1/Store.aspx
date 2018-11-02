<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Store.aspx.cs" Inherits="web_class1.Store" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 49px;
            margin-bottom: 0px;
        }
        .auto-style2 {
            width: 913px;
            height: 26px;
        }
        .auto-style3 {
            width: 913px;
            height: 20px;
        }
        .auto-style4 {
            height: 20px;
        }
        .auto-style5 {
            height: 26px;
        }
        .auto-style6 {
            width: 100%;
        }
        .auto-style7 {
            font-size: x-large;
        }
        .auto-style8 {
            height: 26px;
            width: 371px;
        }
        .auto-style9 {
            width: 371px;
        }
        .auto-style10 {
            background-color: #FFFFFF;
        }
    </style>
</head>
<body style="background-position: center center; background-image: url('4eRxg.jpg'); background-repeat: no-repeat; background-attachment: fixed;background-size: cover;">
    <form id="form1" runat="server">
        <div style="color: #CC66FF; text-align: center; font-weight: 700; font-size: xx-large; background-color: #FFFF99">
            歡迎來到茶水間
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="userShowLB" runat="server" Text="將顯示資料"></asp:Label>
                </td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Button ID="orderBT" runat="server" OnClick="orderBT_Click" Text="前往訂購" />
                    <asp:Button ID="reTB" runat="server" OnClick="reTB_Click" Text="重建表單" />
                </td>
                <td class="auto-style4"></td>
            </tr>
        </table>
        <table class="auto-style6">
            <tr>
                <td class="auto-style8">
                    <asp:DropDownList ID="drinkList" runat="server" AutoPostBack="True" DataSourceID="drinkData" DataTextField="drink_name" DataValueField="drink_id" OnSelectedIndexChanged="drinkList_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="drinkPrice" runat="server" Text="茶"></asp:Label>
                    <asp:Label ID="drinkNumber" runat="server" Text="剩幾個"></asp:Label>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style8">
                    <asp:DropDownList ID="cupList" runat="server" CssClass="auto-style7" OnSelectedIndexChanged="cupList_SelectedIndexChanged" Visible="False">
                    </asp:DropDownList>
                    <asp:Label ID="cupLB" runat="server" EnableTheming="True" Text="杯" Visible="False"></asp:Label>
                    <asp:DropDownList ID="sweetList" runat="server" CssClass="auto-style7" Visible="False">
                        <asp:ListItem>正常</asp:ListItem>
                        <asp:ListItem>半糖</asp:ListItem>
                        <asp:ListItem>少糖</asp:ListItem>
                        <asp:ListItem>微糖</asp:ListItem>
                        <asp:ListItem>無糖</asp:ListItem>
                    </asp:DropDownList>
                    <asp:DropDownList ID="iceList" runat="server" CssClass="auto-style7" Visible="False">
                        <asp:ListItem>正常</asp:ListItem>
                        <asp:ListItem>去冰</asp:ListItem>
                        <asp:ListItem>少冰</asp:ListItem>
                        <asp:ListItem>微冰</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="cubBT" runat="server" CssClass="auto-style7" Enabled="False" OnClick="cubBT_Click" Text="添加" Visible="False" />
                </td>
                <td class="auto-style5">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
                    <asp:Image ID="drinkImage" runat="server" />
                </td>
                <td>
                    <asp:GridView ID="orderItemGridView" runat="server" AutoGenerateColumns="False" CssClass="auto-style10" DataKeyNames="編號" DataSourceID="orderItemDataSource" Visible="False">
                        <Columns>
                            <asp:BoundField DataField="編號" HeaderText="編號" InsertVisible="False" ReadOnly="True" SortExpression="編號" />
                            <asp:BoundField DataField="飲品" HeaderText="飲品" SortExpression="飲品" />
                            <asp:BoundField DataField="數量" HeaderText="數量" SortExpression="數量" />
                            <asp:BoundField DataField="甜度" HeaderText="甜度" SortExpression="甜度" />
                            <asp:BoundField DataField="冰塊" HeaderText="冰塊" SortExpression="冰塊" />
                            <asp:BoundField DataField="小計" HeaderText="小計" ReadOnly="True" SortExpression="小計" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <br />
        <asp:SqlDataSource ID="drinkData" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [drink_id], [drink_name] FROM [drinkTable]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="drinkDataSelect" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO orderTable(order_time, order_phone) VALUES (GETDATE(), @order_phone)" SelectCommand="SELECT [drink_price], [drink_number] FROM [drinkTable] WHERE ([drink_id] = @drink_id)">
            <InsertParameters>
                <asp:SessionParameter Name="order_phone" SessionField="phone" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="drinkList" Name="drink_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:DetailsView ID="drinkDetailsView" runat="server" AutoGenerateRows="False" DataSourceID="drinkDataSelect" Height="50px" Visible="False" Width="125px">
            <Fields>
                <asp:BoundField DataField="drink_price" HeaderText="drink_price" SortExpression="drink_price" />
                <asp:BoundField DataField="drink_number" HeaderText="drink_number" SortExpression="drink_number" />
            </Fields>
        </asp:DetailsView>
        <asp:SqlDataSource ID="orderItemDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" InsertCommand="INSERT INTO orderItemTable(drink_id, order_id, num, sweet, ice) VALUES (@drink_id, @order_id, @num, @sweet, @ice)" SelectCommand="SELECT orderItemTable.orderItem_id AS 編號, drinkTable.drink_name AS 飲品, orderItemTable.num AS 數量, orderItemTable.sweet AS 甜度, orderItemTable.ice AS 冰塊, orderItemTable.num * drinkTable.drink_price AS 小計 FROM orderItemTable INNER JOIN drinkTable ON orderItemTable.drink_id = drinkTable.drink_id WHERE (orderItemTable.order_id = @order_id)">
            <InsertParameters>
                <asp:ControlParameter ControlID="drinkList" Name="drink_id" PropertyName="SelectedValue" />
                <asp:SessionParameter Name="order_id" SessionField="order_id" />
                <asp:ControlParameter ControlID="cupList" Name="num" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="sweetList" Name="sweet" PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="iceList" Name="ice" PropertyName="SelectedValue" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="order_id" SessionField="order_id" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
