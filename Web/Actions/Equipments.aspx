<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Equipments.aspx.vb" Inherits="Web_Equipments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Equipos</title>
    <style type="text/css">
          .Form {
            width: 400px; 
          }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
	    <h2>Equipos</h2><hr /><br />
        <table style="width: 100%;">
            <tr>
                <td>
                
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Text="Nombre de Equipo"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="Equipment" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Equipment" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                        Text="Tipo"></asp:Label>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="IdEquipment_Type" runat="server">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="IdEquipment_Type" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                        Text="Proveedor"></asp:Label>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="IdEquipment_Producer" runat="server">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="IdEquipment_Producer" Display="Dynamic" 
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" 
                        Text="Salón"></asp:Label>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="IdClassroom" runat="server">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="IdClassroom" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                        Text="Especificación técnica"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="Tech_Specification" runat="server" CssClass="twitterStyleTextbox" 
                        TextMode="MultiLine"></asp:TextBox>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label6" runat="server" Font-Bold="True" 
                        Text="Comentarios"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="Comments" runat="server" CssClass="twitterStyleTextbox" 
                        TextMode="MultiLine"></asp:TextBox>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label7" runat="server" Font-Bold="True" 
                        Text="Estado"></asp:Label>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="State" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Bueno</asp:ListItem>
                        <asp:ListItem>Malo</asp:ListItem>
                        <asp:ListItem>Restauración</asp:ListItem>
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="State" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass="Button" />
                    <br />                    
                    <asp:HiddenField ID="IdEquipment" runat="server" />
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx?Adm=Equipments" 
                    CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>

