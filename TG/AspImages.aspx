<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AspImages.aspx.cs" Inherits="TG.AspImages" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

       
            <div style="clear: both;">
                <asp:Repeater ID="RepeaterImages" runat="server">
                    <ItemTemplate>
                        <asp:Image ID="Image" runat="server" ImageUrl='<%# Container.DataItem %>' />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            

    </form>
</body>
</html>
