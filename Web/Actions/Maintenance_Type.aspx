<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Maintenance_Type.aspx.vb" Inherits="Web_Actions_Maintenance_Type" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Trabajo</title>
    <script src="../../JS/jquery-1.7.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".Form").width(800);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
	    <h2>Tipo de Mantenimiento</h2><hr /><br />
        <table style="width: 100%;">
            <tr>
                <td>
                
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                        Text="Nombre del Trabajo"></asp:Label>
                
                </td>
                <td>
                
                    <asp:TextBox ID="Maintenance_Work" runat="server" 
                        CssClass="twitterStyleTextbox"></asp:TextBox>
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="Maintenance_Work" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td>
                
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" 
                        Text="Detalle"></asp:Label>
                
                </td>
                <td>
                <br />
                    <cc1:Editor ID="Detail" runat="server" AutoFocus="False" />
                
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="Detail" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align:center">
                    <asp:Label ID="lblErr" runat="server"></asp:Label>
                    <br />
                    <asp:Button ID="Button1" runat="server" CssClass="Button" />
                    <asp:HiddenField ID="IdMaintenance_Work" runat="server" />
                    <br />
                </td>
            </tr>
        </table>
    </center>
    <asp:HyperLink ID="HyperLink1" runat="server" 
        NavigateUrl="~/Web/Default.aspx?Adm=Maintenance_Type" CssClass="enlaceboton">Regresar</asp:HyperLink>
    </asp:Content>
