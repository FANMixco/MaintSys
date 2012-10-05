<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Recover_Pass.aspx.vb" Inherits="Web_Pass_Recover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Recuperar Contraseña</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
	    <h2>Recuperar Contraseña</h2><hr /><br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="Usuario"></asp:Label>
        <br />
        <asp:TextBox ID="txtUser" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
        <br />
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <br />
            <asp:Label ID="lblQuestion" runat="server" Font-Bold="True"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtAnswer" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
        </asp:Panel>
        <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
        <br />
        <asp:Button ID="Button" runat="server" CssClass="Button" />
        <br />        
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" 
            CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>

