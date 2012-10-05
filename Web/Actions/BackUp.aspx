<%@ Page Title="" Language="VB" MasterPageFile="~/Web/Actions/Base.master" AutoEventWireup="false" CodeFile="BackUp.aspx.vb" Inherits="Web_Actions_BackUp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title >MaintSys :: Copia de Respaldo de la Fecha</title>
    <style type ="text/css">
        .Loc
        {
            margin:auto;
            text-align :center ;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="Loc">
    <h2>Copia de Respaldo de la Fecha:</h2><hr />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" 
            Font-Size="Larger" Text="Label" ForeColor="#FF3300"></asp:Label>
        <br />
        <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Crear" CssClass="Button" />
        <br />
        <br />
        <hr /><asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Copias de Respaldo Disponibles"></asp:Label><hr />
        <br />
        <center>
            <asp:GridView ID="listado" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </center>
        <br />
        <br />
        <br />
    </div>
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx" 
        CssClass="enlaceboton">Regresar</asp:HyperLink>
</asp:Content>

