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
                        <asp:Label ID="Label1" runat="server" Text="帳號："></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style12"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="Label2" runat="server" Text="密碼："></asp:Label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style12"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13">
                        <asp:Button ID="Button1" runat="server" Text="登入" />
                    </td>
                </tr>

            </table>
        </form>
    </body>
</html>
