<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Equipment_Type.aspx.vb" Inherits="Web_Equipment_Type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Tipo de Equipo</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
	    <h2>Tipo de Equipo</h2><hr /><br />
        <table style="width: 100%;">
            <tr>
                <td>
                
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Text="Tipo de Equipo"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="txtType" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtType" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass="Button" />
                    <asp:HiddenField ID="IdEquipment_Type" runat="server" />
                    <br />
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Web/Default.aspx?Adm=Equipment_Type" CssClass="enlaceboton">Regresar</asp:HyperLink>
    </asp:Content>

