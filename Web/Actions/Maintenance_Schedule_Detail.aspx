<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="Maintenance_Schedule_Detail.aspx.vb" Inherits="Web_Actions_Maintenance_Schedule_Detail" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit.HTMLEditor" tagprefix="cc1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>MaintSys :: Detalles</title>
    <script src="../../JS/jquery-1.7.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".Form").width(600);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center>
        <asp:Panel ID="Panel1" runat="server">
            <h2>Detalle de la Actividad</h2><hr />
            <cc1:Editor ID="Detail" runat="server" />
            <br />
            <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Enviar" CssClass="Button" />
        </asp:Panel>
    </center>
    <br />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx?Adm=Maintenance_Schedule" 
                    CssClass="enlaceboton">Regresar</asp:HyperLink>
    <asp:Timer ID="Timer1" runat="server" Enabled="False" Interval="50000">
    </asp:Timer>
</asp:Content>

