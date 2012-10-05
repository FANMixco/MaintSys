<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Secret.aspx.vb" Inherits="Web_Secret" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Pregunta Secreta</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
	    <h2>Pregunta Secreta</h2><hr /><br />
        <table style="width: 100%;">
            <tr>
                <td colspan="2">
                    <asp:Label ID="IdUser" runat="server" Font-Bold="True"></asp:Label>            
                </td>
            </tr>
            <tr>
                <td>                
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Pregunta secreta"></asp:Label>                
                </td>
                <td>
                
                    <asp:DropDownList ID="cmbQuestion" runat="server">
                        <asp:ListItem>¿Cuál es tu comida favorita?</asp:ListItem>
                        <asp:ListItem>¿Quién fue tú primer profesor?</asp:ListItem>
                        <asp:ListItem>¿Nombre de tú primera mascota?</asp:ListItem>
                        <asp:ListItem>¿Nombre de tú primera cita?</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Respuesta secreta"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="txtAnswer" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtAnswer" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="lblErr" runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Actualizar" CssClass="Button" />
                    <br />
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx" 
        CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>

