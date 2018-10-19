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
                    <asp:DropDownList ID="drinkList" runat="server" AutoPostBack="True" DataSourceID="drinkData" DataTextField="drink_name" DataValueField="drink_id" OnSelectedIndexChanged="drinkList_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:Label ID="drinkPrice" runat="server" Text="茶"></asp:Label>
                    <asp:Label ID="drinkNumber" runat="server" Text="剩幾個"></asp:Label>
                </td>
                <td class="auto-style5"></td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Image ID="drinkImage" runat="server" />
                </td>
                <td class="auto-style4"></td>
            </tr>
        </table>
        <table class="auto-style6">
            <tr>
                <td>
                    <asp:Button ID="orderBT" runat="server" OnClick="orderBT_Click" Text="前往訂購" />
                    <asp:Button ID="reTB" runat="server" OnClick="reTB_Click" Text="重建表單" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
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
    </form>
</body>
</html>
