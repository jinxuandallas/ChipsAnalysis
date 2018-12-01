<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebCrawler.aspx.cs" Inherits="ChipsAnalysis.WebCrawler" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="Button_Graphics" runat="server" OnClick="Button_Graphics_Click" Text="爬取显卡" />
        </div>
    </form>
</body>
</html>
