<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Laboratories.aspx.vb" Inherits="Web_Laboratories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Laboratorios</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
	    <h2>Laboratorios</h2><hr /><br />
        <table style="width: 100%;">
            <tr>
                <td>
                
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Text="Nombre del Laboratorio"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="Laboratory" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Laboratory" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                        Text="Edificio al que pertenece"></asp:Label>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="Building" runat="server">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Building" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass="Button" />
                    <asp:HiddenField ID="IdLaboratory" runat="server" />
                    <br />
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Web/Default.aspx?Adm=Laboratories" CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>