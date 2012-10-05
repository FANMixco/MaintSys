<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Equipment_Producer.aspx.vb" Inherits="Web_Actions_Equipment_Producer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Distribuidor de Equipo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h2>Distribuidor de Equipo</h2><hr />
        <table style="width: 100%;">
            <tr>
                <td>                
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Text="Nombre del Distribuidor"></asp:Label>                
                </td>
                <td>
                
                    <asp:TextBox ID="Equipment_Producer" runat="server" 
                        CssClass="twitterStyleTextbox"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Building" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="" CssClass="Button" />
                    <asp:HiddenField ID="IdEquipment_Producer" runat="server" />
                    <br />
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx?Adm=Buildings" 
            CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>