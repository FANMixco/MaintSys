<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<meta http-equiv="Content-Language" content="ES-ES" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9" />
	<meta name="autor" content="Federico Navarrete" />
	<meta name="distribution" content="Programa Mundial de Alimentos de las Naciones Unidas" />
	<meta name="distribution" content="Global" />
	<meta name="copyright" content="© Programa Mundial de Alimentos de las Naciones Unidas" />
	<meta name="keywords" content="PMA,login,elsalvador" />
	<meta name="Robots" content="all"/>
    <title>MaintSys :: Login</title>
    <link rel="Stylesheet" type="text/css" href="/MaintSys/Styles/General_Style.css" />
    <link href="Styles/Form_Style.css" rel="stylesheet" type="text/css" />
    <link rel="Stylesheet" type="text/css" href="Styles/Login_Style.css" />
</head>
<body>
    <form id="FrmLogin" runat="server" class ="login-form">	
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>	
        <h2>Ingresar al Sistema</h2><hr />
        <table>
            <tr>
                <td>Usuario</td>
                <td><asp:TextBox ID="TxtUser" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Contraseña</td>
                <td><asp:TextBox ID="TxtPass" runat="server" TextMode="Password" 
                        CssClass="twitterStyleTextbox"></asp:TextBox></td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Label ID="LblErr" runat="server"></asp:Label><br />
                <asp:Button ID="BtnLogin" runat="server" Text="Ingresar" CssClass="Button" />
                <br />
                <asp:HyperLink ID="HyperLink1" runat="server" Font-Size="Small" 
                    NavigateUrl="~/Web/Actions/Recover_Pass.aspx">Recuperar Contraseña</asp:HyperLink>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>