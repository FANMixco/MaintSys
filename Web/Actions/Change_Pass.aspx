<%@ Page Title="MaintSys :: Cambiar Contraseña" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Change_Pass.aspx.vb" Inherits="Web_Change_Pass" Culture="Auto" UICulture="Auto" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h2>Cambiar Contraseña</h2><hr />
        <table style="width: 100%;">
            <tr>
                <td colspan="2">
                    <asp:Label ID="IdUser" runat="server" Font-Bold="True"></asp:Label>            
                </td>
            </tr>
            <tr>
                <td>                
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Text="Antigua contraseña"></asp:Label>                
                </td>
                <td>                
                    <asp:TextBox ID="txtOld" runat="server" TextMode="Password" 
                        CssClass="twitterStyleTextbox"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtOld" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>                
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Nueva contraseña"></asp:Label>
                
                </td>
                <td>                
                    <asp:TextBox ID="txtNew" runat="server" TextMode="Password" 
                        CssClass="twitterStyleTextbox"></asp:TextBox>                
                    <asp:PasswordStrength ID="txtNew_PasswordStrength" runat="server" 
                        TargetControlID="txtNew">
                    </asp:PasswordStrength>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtNew" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>                
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" 
                        Text="Repetir contraseña"></asp:Label>
                
                </td>
                <td>                
                    <asp:TextBox ID="txtRep" runat="server" TextMode="Password" 
                        CssClass="twitterStyleTextbox"></asp:TextBox>                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtRep" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtNew" ControlToValidate="txtRep" Display="Dynamic" 
                        ErrorMessage="Las contraseñas no coinciden"></asp:CompareValidator>
                    <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="Actualizar" CssClass="Button" />
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx" 
            CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>

