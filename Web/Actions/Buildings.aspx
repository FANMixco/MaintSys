<%@ Page Title="MaintSys :: Edificios" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Buildings.aspx.vb" Inherits="Web_Building" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h2>Edificios</h2><hr />
    <table style="width: 100%;">
        <tr>
            <td>                
                <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                    Text="Nombre del Edificio"></asp:Label>                
            </td>
            <td>
                
                <asp:TextBox ID="Building" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="Building" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
            </td>
        </tr>
        <tr>
            <td>
                
                <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                    Text="Número de Edificio"></asp:Label>
                
            </td>
            <td>
                
                <asp:TextBox ID="Number" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="Number" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align:center">
                <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" Text="" CssClass="Button" />
                <asp:HiddenField ID="IdBuilding" runat="server" />
                <br />
            </td>
        </tr>
    </table>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx?Adm=Buildings" 
            CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>

