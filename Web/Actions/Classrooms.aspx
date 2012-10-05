<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Classrooms.aspx.vb" Inherits="Web_Actions_Classrooms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Salones</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <h2>Salones</h2><hr />
        <table style="width: 100%;">
            <tr>
                <td>                
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Text="Nombre del Salón"></asp:Label>                
                </td>
                <td>
                
                    <asp:TextBox ID="Classroom" runat="server" CssClass="twitterStyleTextbox"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Building" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                        Text="Laboratorio Asignado"></asp:Label>
                
                </td>
                <td>
                
                    <asp:DropDownList ID="IdLaboratory" runat="server">
                    </asp:DropDownList>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="IdLaboratory" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" Text="" CssClass="Button" />
                    <asp:HiddenField ID="IdClassroom" runat="server" />
                    <br />
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx?Adm=Buildings" 
            CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>

