<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TokenForm.aspx.cs" Inherits="TokenField.TokenForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery/jquery-1.8.0.js"></script>
    <script src="https://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.22/jquery-ui.js"></script>
    <script>
        $(function () {
            $("#TextBox1").autocomplete({
                source: function (request, response) {
                    var param = { empdetails: $('#TextBox1').val() };
                    $.ajax({
                        url: "TokenForm.aspx/getEmp",
                        data: JSON.stringify(param),
                        type: "post",
                        contentType: "application/json; charset=utf-8",
                        datafilter: function (data) { return data; },
                        success: function (data) {
                            response($.map(data.d, function (item) {
                                return { value: item }
                            }))
                },
            });
        },
            minLength: 1
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <hr />
            Enter name: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </div>
    </form>
</body>
</html>
