<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ChipsAnalysis.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <%--<link href="css/main.css" rel="stylesheet" />
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/table.min.js"></script>
    <script src="js/search.js"></script>
    <script type="text/javascript">
      $(function(){
          $("table#GridView1").stupidtable();
		  $("table#GridView1 tr:odd").addClass("oddtr");
      $("table#GridView1 tr").hover(
         function(){
                   $(this).addClass("hover");
         },
         function(){
                   $(this).removeClass("hover");
         });
      });
    </script>--%>
</head>
<body>

    <%--<form name="f1" action="" onsubmit="if(this.t1.value!=null && this.t1.value!='')
						findString(this.t1.value);return false">
						<input class="wickEnabled" type="text" name="t1" id="txt1" autocomplete="OFF">--%>


    <form id="form1" runat="server">

<%--        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>

        <%--<input class="wickEnabled" type="text" name="t1" id="txt1" autocomplete="OFF"/>
		
            <input type="button" name="b1" value="搜索CPU" onclick="if(this.t1.value!=null && this.t1.value!='') findString(this.t1.value)"/>--%>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource1" GridLines="Vertical" PageSize="30" AutoGenerateSelectButton="True">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="False" />
                        <asp:BoundField DataField="排名" HeaderText="排名" SortExpression="排名" />
                        <asp:BoundField DataField="处理器" HeaderText="处理器" SortExpression="处理器" />
                        <asp:BoundField DataField="图形" HeaderText="图形" SortExpression="图形" />
                        <asp:BoundField DataField="分数" HeaderText="分数" SortExpression="分数" />
                        <asp:BoundField DataField="品牌" HeaderText="品牌" SortExpression="品牌" Visible="False" />
                        <asp:TemplateField HeaderText="价格" SortExpression="价格">
                            <ItemTemplate>
                                <asp:Label ID="PriceLabel" Text='<%# Eval("价格") %>' runat="server"></asp:Label>
                                <asp:TextBox ID="PriceTextBox" Text='<%# Eval("价格") %>' TextMode="Number" Visible="false" Width="80px" runat="server"></asp:TextBox>
                                <asp:Button ID="Edit" Text="编辑" OnClick="Edit_Click" CommandArgument="<%# Container.DataItemIndex %>" runat="server" />
                                <asp:Button ID="Update" Text="更新" OnClick="Update_Click" CommandArgument="<%# Container.DataItemIndex %>" Visible="false" runat="server" />
                                <asp:Button ID="Cancel" Text="取消" OnClick="Cancel_Click" CommandArgument="<%# Container.DataItemIndex %>" Visible="false" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="性价比" HeaderText="性价比" SortExpression="性价比" />
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>



                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CPU]"></asp:SqlDataSource>
            <%--</ContentTemplate>
        </asp:UpdatePanel>--%>
    </form>
</body>
</html>
