<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Users.aspx.vb" Inherits="Web_Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h2>Usuarios</h2><hr />
        <table style="width: 100%;">
            <tr>
                <td>
                
                    <asp:Label ID="Label1" runat="server" Text="Usuario" Font-Bold="True"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="txtUser" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtUser" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label5" runat="server" Text="Correo Electrónico" Font-Bold="True"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Ingrese un Correo Electrónico Válido" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label2" runat="server" Text="Nombre Completo" Font-Bold="True"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="txtName" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="txtName" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label3" runat="server" Text="Nivel" Font-Bold="True"></asp:Label>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="cmbLevel" runat="server">
                        <asp:ListItem>Administrador</asp:ListItem>
                        <asp:ListItem>Empleado</asp:ListItem>
                        <asp:ListItem>Jefe de Departamento</asp:ListItem>
                        <asp:ListItem>Supervisor</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="cmbLevel" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label4" runat="server" Text="Edificio" Font-Bold="True"></asp:Label>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="cmbBuilding" runat="server">
                    </asp:DropDownList>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                
                    <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                    <br />
                
                    <asp:Button ID="Button1" runat="server" Text="Ingresar" CssClass="Button" />
                
                    <br />                    
                
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx?Adm=Users" 
                        CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>

