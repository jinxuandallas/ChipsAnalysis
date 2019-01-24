<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GraphicsCardAJAX.aspx.cs" Inherits="ChipsAnalysis.GraphicsCardAJAX" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script src="js/jquery-3.3.1.min.js"></script>
    <script>
        /*
        $(function () {
            $(":input").click(function (e) {
                alert("xx");
                return false;
            });
        })
        */
        function Edit(obj) {
            var id = obj.id.substring(obj.id.lastIndexOf("_") + 1);

            ToggleControl(id);

            $("#textboxPrice_" + id).val($("#spanPrice_" + id).text());
            return false;
        }

        function Update(obj) {
            var id = obj.id.substring(obj.id.lastIndexOf("_") + 1);



            var price = parseFloat($("#textboxPrice_" + id).val()).toFixed(2);

            if (price === "" || price == $("#spanPrice_" + id).text()) {
                ToggleControl(id);
                return false;
            }
            var data = "{id:" + id + ",price:" + price + "}";
            $.ajax({
                //要用post方式   
                type: "Post",
                //方法所在页面和方法名   
                url: "GraphicsCardAJAX.aspx/Update",
                contentType: "application/json;",
                dataType: "json",
                data: data,
                success: function (data) {
                    //返回的数据用data.d获取内容 
                    var p = $.parseJSON(data.d);
                    //alert(p.performance);
                    ToggleControl(id);
                    //更新价格
                    $("#spanPrice_" + id).text(price);
                    //更新性价比
                    $("#spanPrice_" + id).parent().next().text(p.performance);
                },
                error: function (err) {
                    alert(err);
                }
            });
            return false;
        }

        function Cancel(obj) {
            var id = obj.id.substring(obj.id.lastIndexOf("_") + 1);

            ToggleControl(id);

            return false;
        }

        function ToggleControl(id) {
            //var id = obj.id.substring(obj.id.lastIndexOf("_") + 1);

            $("#update_" + id).toggle();
            $("#cancel_" + id).toggle();
            $("#textboxPrice_" + id).toggle();
            $("#spanPrice_" + id).toggle();
            $("#edit_" + id).toggle();

        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Id" DataSourceID="SqlDataSource2" GridLines="Vertical" PageSize="30" AutoGenerateSelectButton="True" ClientIDMode="Static" ClientIDRowSuffix="Id">
                <AlternatingRowStyle BackColor="#DCDCDC" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" Visible="false" />
                    <asp:BoundField DataField="排名" HeaderText="排名" SortExpression="排名" />
                    <asp:BoundField DataField="显卡" HeaderText="显卡" SortExpression="显卡" />
                    <asp:BoundField DataField="图形" HeaderText="图形" SortExpression="图形" />
                    <asp:BoundField DataField="分数" HeaderText="分数" SortExpression="分数" />
                    <asp:TemplateField HeaderText="价格" SortExpression="价格">
                        <ItemTemplate>
                            <span id='spanPrice_<%# Eval("Id") %>'><%# string.Format("{0:000.00}", Eval("价格")) %></span>
                            <%--<asp:Label ID="PriceLabel" Text='<%# Eval("价格") %>' runat="server"></asp:Label>--%>
                            <input type="button" id='edit_<%# Eval("Id") %>' onclick="Edit(this)" value="编辑" />
                            <input type="number" id='textboxPrice_<%# Eval("Id") %>' style="display: none" />
                            <input type="button" id='update_<%# Eval("Id") %>' onclick="Update(this)" value="更新" style="display: none" />
                            <input type="button" id='cancel_<%# Eval("Id") %>' onclick="Cancel(this)" value="取消" style="display: none" />
                            <%--<asp:TextBox ID="PriceTextBox" Text='<%# Eval("价格") %>' TextMode="Number" Visible="false" Width="80px" runat="server"></asp:TextBox>--%>
                            <%--<input type="button" id='edit_<%# Eval("Id") %>' onclick="Edit(this)" value="eee" />--%>

                            <%--<asp:Button  ClientIDMode="Predictable" ID="Edit" Text="编辑" OnClick="Edit_Click" CommandArgument="<%# Container.DataItemIndex %>" runat="server"  />--%>
                            <%--<asp:Button ID="Update" Text="更新" OnClick="Update_Click" CommandArgument="<%# Container.DataItemIndex %>" Visible="false" runat="server" />--%>
                            <%--<asp:Button ID="Cancel" Text="取消" OnClick="Cancel_Click" CommandArgument="<%# Container.DataItemIndex %>" Visible="false" runat="server" />--%>
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



            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id], [排名], [显卡], [图形], [分数], [价格], [性价比] FROM [Graphics]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
