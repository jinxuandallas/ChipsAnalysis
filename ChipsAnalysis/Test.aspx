<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="ChipsAnalysis.Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script>
        /*$(function () {
            $(":input").click(function () {
                alert("xxxx");
                return false;
            })
        })
        */
        function eee(obj) {
            alert(obj.id);
            return false;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:Button ID="Button1" runat="server" OnClientClick="eee(this)" Text="Button" />

        </div>
    </form>
</body>
</html>
