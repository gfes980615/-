<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web_class1.WebForm1" UICulture="Auto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <title>我的網站</title>
        <style type="text/css">
            .auto-style1 {
                text-align: center;
                font-size: xx-large;
            }
            .auto-style2 {
                color: #FF9966;
            }
            .auto-style8 {
                width: 100%;
                border-style: solid;
                border-width: 1px;
                position: relative;
                left: 0px;
                top: 52px;
            }
            .auto-style9 {
                height: 33px;
                text-align: center;
            }
            .auto-style12 {
                margin-left: 20px;
            }
            .auto-style13 {
                height: 54px;
                text-align: center;
            }
            .auto-style14 {
                height: 48px;
                text-align: center;
            }
        </style>
    </head>
    <body style="background-position: center center; background-image: url('4eRxg.jpg'); background-repeat: no-repeat; background-size: cover; background-attachment: fixed;">
        <form id="form1" runat="server">
        <div class="auto-style1" style="margin-top:5%;">
            <strong style="color: #00FFFF";><span class="auto-style2">歡迎來到我的網站</span> </strong>
        </div>
            <table class="auto-style8" style="border-style: hidden;">
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="account" runat="server" Text="帳號："></asp:Label>
                        <asp:TextBox ID="accountB" runat="server" CssClass="auto-style12"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14">
                        <asp:Label ID="passward" runat="server" Text="密碼："></asp:Label>
                        <asp:TextBox ID="passwardB" runat="server" CssClass="auto-style12"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Button ID="login" runat="server" Text="登入" OnClick="login_Click" />
                        <asp:LinkButton ID="entry" runat="server" Visible="False">進入商店</asp:LinkButton>
                    </td>
                </tr>

            </table>
            <asp:DetailsView ID="clientDetailView" runat="server" AutoGenerateRows="False" DataSourceID="clientDetail" EmptyDataText="帳密錯誤" Height="50px" OnPageIndexChanging="DetailsView1_PageIndexChanging" Visible="False" Width="125px">
                <Fields>
                    <asp:BoundField DataField="user_name" HeaderText="user_name" SortExpression="user_name" />
                    <asp:BoundField DataField="user_money" HeaderText="user_money" SortExpression="user_money" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="clientDetail" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [user_name], [user_money] FROM [userData] WHERE (([user_name] = @user_name) AND ([user_passward] = @user_passward))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="accountB" Name="user_name" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="passwardB" Name="user_passward" PropertyName="Text" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </form>
    </body>
</html>
