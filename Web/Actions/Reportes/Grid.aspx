<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Grid.aspx.vb" Inherits="Web_Grid" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MaintSys :: Reporte</title>
    <style type="text/css">
*{
    margin:0;
    padding:0;
    font-family:Palatino Linotype,Calibri;
}
    
td{
    padding:10px;
}

.enlaceboton {
   border-top: 1px solid #96d1f8;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#65a9d7));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   padding: 5px 10px;
   -webkit-border-radius: 8px;
   -moz-border-radius: 8px;
   border-radius: 8px;
   -webkit-box-shadow: rgba(0,0,0,1) 0 1px 0;
   -moz-box-shadow: rgba(0,0,0,1) 0 1px 0;
   box-shadow: rgba(0,0,0,1) 0 1px 0;
   text-shadow: rgba(0,0,0,.4) 0 1px 0;
   color: white;
   font-size: Smaller;
   /*font-family: Georgia, serif;*/
   text-decoration: none;
   vertical-align: middle;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <center>
            <asp:Literal ID="Welcome" runat="server"></asp:Literal>
            <br />
        </center>    
        </div>
        <center>
            <asp:GridView ID="Maintenance_Schedule" runat="server" AllowPaging="True" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" Font-Size="Medium" 
                                AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="IdUser" HeaderText="Usuario Solicitante" />
                    <asp:BoundField DataField="Classroom" 
                                        HeaderText="Salón y Tipo de Mantenimiento" />
                    <asp:BoundField DataField="Date_Time" HeaderText="Fecha de Actividad" />
                    <asp:BoundField DataField="M_State" HeaderText="Estado" />
                    <asp:BoundField DataField="Detail" HeaderText="Detalle del Trabajo" 
                                        HtmlEncode="False" />
                </Columns>
                <FooterStyle BackColor="White" ForeColor="#000066" />
                <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                <RowStyle ForeColor="#000066" />
                <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#007DBB" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#00547E" />
            </asp:GridView>
        </center>
    </form>
</body>
</html>
