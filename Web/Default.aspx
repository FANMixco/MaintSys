<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Web_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>MaintSys :: Administrar</title>
    <link rel="Stylesheet" type="text/css" href="~/Styles/Main_Style.css" />
    <script type='text/javascript' src='/MaintSys/Controls/DatePicker/datetimepicker_css.js'></script>
    <link rel="Stylesheet" type="text/css" href="/MaintSys/Styles/General_Style.css" />
	<link rel='stylesheet' type='text/css' href='~/Controls/fancybox/jquery.fancybox-1.3.4.css' media='screen' />
    <style type="text/css">
        .style1
        {
            width: 676px;
        }
        #Image5
        {
            padding-top: 15px;
        }
        .Move
        {
            padding-left:20px;
            text-align :justify;
        }
        p
        {
            font-weight:bold;
        }
        td
        {
            padding-top:5px;
            padding-bottom:5px;
        }
    </style>
    <script type="text/javascript" src="../JS/jquery-1.7.min.js"></script>
	<script type='text/javascript' src='../JS/jquery-1.4.min.js'></script>
	<script type='text/javascript' src='../Controls/fancybox/jquery.mousewheel-3.0.4.pack.js'></script>
	<script type='text/javascript' src='../Controls/fancybox/jquery.fancybox-1.3.4.pack.js'></script>
    <script type="text/javascript">
        $(function () {
            $("#Maintenance_Schedule td:contains('Completo')").parent().css("background", "#cccccc");
            $("#Maintenance_Schedule td:contains('Pendiente')").parent().css("background", "#FFDDDD");
            $("#Maintenance_Schedule td:contains('Abierto')").parent().css("background", "#ddffdd");

            $("#Equipments td:contains('Bueno')").parent().css("background", "#ddffdd");
            $("#Equipments td:contains('Malo')").parent().css("background", "#FFDDDD");
            $("#Equipments td:contains('Restauración')").parent().css("background", "#cccccc");
        });

        $(document).ready(function () {
            $('.Float_Form').fancybox({
                'width': '35%',
                'height': '55%',
                'autoScale': false,
                'transitionIn': 'none',
                'transitionOut': 'none',
                'type': 'iframe'
            });
        });
    </script>
</head>
<body>
    <form id="FrmAdmin" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="wrapper-main">        
		<!--Add the info here-->
            <!--The welcome div-->
            <div id="welcome-header">
                <asp:Literal ID="welcome_name" runat="server"></asp:Literal>                    
                <a href="../Default.aspx">Cerrar Sesión</a>
            </div>
            <asp:Image ID="Image5" runat="server" Height="81px" ImageUrl="~/Media/Images/Icon.png" 
                Width="90px" />
            <br />
            <!--Title-->
            <h2>MaintSys :: Administrar</h2><hr />
            <br />
            <table>
                <tr>
                    <td id="opt">
                        <!--Menu div-->
                        <div id="options">                    
                            <ul id="nav">
                                <li>Tareas Frecuentes</li><hr />
                                <li><a href='Actions/Maintenance_Schedule.aspx'>Nuevo Mantenimiento</a></li>
                                <li><a href="Actions/Change_Pass.aspx">Cambiar Contrase&ntilde;a</a></li>
                                <li><a href="Actions/Secret.aspx">Pregunta Secreta</a></li>
                                <br />
                                <li>Administrar</li><hr />
                                <li><a href='Default.aspx?Adm=Maintenance_Schedule'>Mantenimiento</a></li>
                                <asp:Literal ID="Menu" runat="server"></asp:Literal>
                            </ul>
                        </div>
                    </td>
                    <td class="style1">
                        <center>
                            <asp:Panel ID="Panel1" runat="server" Visible="False" Font-Size="Small" 
                                BackColor="#B9E3FF">
                                <b>¿Desea eliminarlo realmente?</b>
                                <br />
                                <asp:Button ID="Yes" runat="server" Text="Sí" />
                                &nbsp;
                                <asp:Button ID="No" runat="server" Text="No" />
                                <br />
                            </asp:Panel>
                            <asp:Label ID="Resultado" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:GridView ID="Buildings" runat="server" AllowPaging="True" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" AutoGenerateColumns="False" Visible="False" 
                                Font-Size="Smaller">
                                <Columns>
                                    <asp:BoundField DataField="Building" HeaderText="Nombre del Edificio" />
                                    <asp:BoundField DataField="Building_Number" HeaderText="Número" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                        <table>
                                            <tr>
                                            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                Text='Editar'></asp:HyperLink></td>
                                            <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                Text='Eliminar'></asp:HyperLink></td>
                                            </tr>
                                        </table>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="enlaceboton" />
                                    </asp:TemplateField>
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
                            <asp:GridView ID="Classrooms" runat="server" AllowPaging="True" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" AutoGenerateColumns="False" Visible="False" 
                                Font-Size="Smaller">
                                <Columns>
                                    <asp:BoundField DataField="Classroom" HeaderText="Salón" />
                                    <asp:BoundField DataField="Laboratory" HeaderText="Laboratorio" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                        <table>
                                            <tr>
                                            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                Text='Editar'></asp:HyperLink></td>
                                            <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                Text='Eliminar'></asp:HyperLink></td>
                                            </tr>
                                        </table>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="enlaceboton" />
                                    </asp:TemplateField>
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
                            <asp:GridView ID="Equipment_Producer" runat="server" AllowPaging="True" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" AutoGenerateColumns="False" Visible="False" 
                                Font-Size="Smaller">
                                <Columns>
                                    <asp:BoundField DataField="Equipment_Producer" HeaderText="Distribuidor" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                        <table>
                                            <tr>
                                            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                Text='Editar'></asp:HyperLink></td>
                                            <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                Text='Eliminar'></asp:HyperLink></td>
                                            </tr>
                                        </table>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="enlaceboton" />
                                    </asp:TemplateField>
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
                            <asp:GridView ID="Equipment_Type" runat="server" AllowPaging="True" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" AutoGenerateColumns="False" Visible="False" 
                                Font-Size="Smaller">
                                <Columns>
                                    <asp:BoundField DataField="Equipment_Type" HeaderText="Tipo" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                        <table>
                                            <tr>
                                            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                Text='Editar'></asp:HyperLink></td>
                                            <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                Text='Eliminar'></asp:HyperLink></td>
                                            </tr>
                                        </table>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="enlaceboton" />
                                    </asp:TemplateField>
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
                            <asp:Panel ID="Equipments_Panel" runat="server" Visible="False">
                                <asp:Table ID="Table1" runat="server" Font-Bold="True" Font-Size="Small">
                                    <asp:TableRow ID="TableRow1" runat="server">
                                        <asp:TableCell ID="TableCell1" runat="server" BackColor="#DDFFDD">Bueno</asp:TableCell>
                                        <asp:TableCell ID="TableCell2" runat="server" BackColor="#CCCCCC">Restauración</asp:TableCell>
                                        <asp:TableCell ID="TableCell3" runat="server" BackColor="#FFDDDD">Malo</asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <asp:GridView ID="Equipments" runat="server" AllowPaging="True" 
                                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="3" AutoGenerateColumns="False" Visible="True" 
                                    Font-Size="Smaller">
                                    <Columns>
                                        <asp:BoundField DataField="Equipment" HeaderText="Equipo" />
                                        <asp:BoundField DataField="Type" HeaderText="Tipo" />
                                        <asp:BoundField DataField="Producer" HeaderText="Distribuidor" />
                                        <asp:BoundField DataField="Classroom" HeaderText="Salón" />
                                        <asp:BoundField DataField="Technical_Specification" 
                                            HeaderText="Especificación técnica" />
                                        <asp:BoundField DataField="Comments" HeaderText="Comentarios" />
                                        <asp:BoundField DataField="E_State" HeaderText="Estado" />
                                        <asp:TemplateField HeaderText="Acciones">
                                            <ItemTemplate>
                                            <table>
                                                <tr>
                                                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                    Text='Editar'></asp:HyperLink></td>
                                                <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                    Text='Eliminar'></asp:HyperLink></td>
                                                </tr>
                                            </table>
                                            </ItemTemplate>
                                            <ControlStyle CssClass="enlaceboton" />
                                        </asp:TemplateField>
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
                            </asp:Panel>
                            <asp:GridView ID="Laboratories" runat="server" AllowPaging="True" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" AutoGenerateColumns="False" Visible="False" 
                                Font-Size="Smaller">
                                <Columns>
                                    <asp:BoundField DataField="Laboratory" HeaderText="Laboratorio" />
                                    <asp:BoundField DataField="Building" HeaderText="Edificio" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                        <table>
                                            <tr>
                                                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                    Text='Editar'></asp:HyperLink></td>
                                                <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                    Text='Eliminar'></asp:HyperLink></td>
                                            </tr>
                                        </table>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="enlaceboton" />
                                    </asp:TemplateField>
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
                            <asp:Panel ID="Maintenance_Schedule_Panel" runat="server" Visible="False">
                                <table style="width:100%; text-align:center;">
                                    <tr>
                                        <td colspan="3">
                                            <h4>Reporte por Fecha Específica</h4><hr />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="False" 
                                                Text="Fecha:"></asp:Label>
                                            &nbsp;<asp:TextBox ID="txtFecha" runat="server" AutoPostBack="True" 
                                                CssClass="twitterStyleTextbox" MaxLength="10" Width="116px"></asp:TextBox>
                                            <asp:Image ID="Image1" runat="server" alt="FechaIni" 
                                                ImageUrl="~/Controls/DatePicker/images2/cal.gif" 
                                                onclick="javascript:NewCssCal ('txtFecha','yyyyddMM','arrow')" />
                                        </td>
                                        <td>
                                            <asp:HyperLink ID="Reporte_F" runat="server" CssClass="enlaceboton" 
                                                Target="_blank">Reporte</asp:HyperLink>
                                        </td>
                                        <td>
                                            <asp:CheckBox ID="Intervalo" runat="server" AutoPostBack="True" Text="Intervalo" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:Panel ID="Panel2" runat="server" Visible="False">
                                <table style="width:100%; text-align:center;">
                                    <tr>
                                        <td colspan="3">
                                            <h4>Reporte por Invervalo de Fechas</h4><hr />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="False" 
                                                Text="Fecha Inicial:"></asp:Label>
                                            &nbsp;<asp:TextBox ID="TxtFechaIni" runat="server" AutoPostBack="True" 
                                                CssClass="twitterStyleTextbox" MaxLength="10" Width="116px"></asp:TextBox>
                                            <asp:Image ID="Image7" runat="server" alt="FechaIni" 
                                                ImageUrl="~/Controls/DatePicker/images2/cal.gif" 
                                                onclick="javascript:NewCssCal ('TxtFechaIni','yyyyddMM','arrow')" />
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Italic="False" 
                                                Text="Fecha Final:"></asp:Label>
                                            &nbsp;<asp:TextBox ID="TxtFechaFin" runat="server" AutoPostBack="True" 
                                                CssClass="twitterStyleTextbox" MaxLength="10" Width="116px"></asp:TextBox>
                                            <asp:Image ID="Image8" runat="server" alt="FechaFin" 
                                                ImageUrl="~/Controls/DatePicker/images2/cal.gif" 
                                                onclick="javascript:NewCssCal ('TxtFechaFin','ddMMyyyy','arrow')" />
                                        </td>
                                        <td>
                                            <asp:HyperLink ID="Reporte" runat="server" CssClass="enlaceboton" 
                                                Target="_blank">Reporte</asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                                </asp:Panel>
                                <br />
                                <asp:Table ID="Table2" runat="server" Font-Bold="True" Font-Size="Small">
                                    <asp:TableRow ID="TableRow2" runat="server">
                                        <asp:TableCell ID="TableCell4" runat="server" BackColor="#DDFFDD">Abierto</asp:TableCell>
                                        <asp:TableCell ID="TableCell5" runat="server" BackColor="#CCCCCC">Completo</asp:TableCell>
                                        <asp:TableCell ID="TableCell6" runat="server" BackColor="#FFDDDD">Pendiente</asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                                <asp:GridView ID="Maintenance_Schedule" runat="server" AllowPaging="True" 
                                    BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                    CellPadding="3" Font-Size="Smaller" 
                                    AutoGenerateColumns="False">
                                    <Columns>
                                        <asp:BoundField DataField="IdUser" HeaderText="Usuario Solicitante" />
                                        <asp:BoundField DataField="Classroom" 
                                            HeaderText="Salón y Tipo de Mantenimiento" />
                                        <asp:BoundField DataField="M_Start_Date" HeaderText="Fecha de Inicio" />
                                        <asp:BoundField DataField="M_Ending_Date" HeaderText="Fecha de Finalización" />
                                        <asp:BoundField DataField="M_State" HeaderText="Estado" />
                                        <asp:BoundField DataField="Detail" HeaderText="Detalle del Trabajo" 
                                            HtmlEncode="False" />
                                        <asp:TemplateField HeaderText="Acciones">
                                            <ItemTemplate>
                                                <table>
                                                    <tr>
                                                        <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                            Text='Editar'
                                                            Visible='<%# ShowEdit_Del(CType(Eval("IdUser"),String),CType(Eval("M_State"),String)) %>'
                                                            ></asp:HyperLink></td>
                                                        <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                            Text='Eliminar'
                                                            Visible='<%# ShowEdit_Del(CType(Eval("IdUser"),String),CType(Eval("M_State"),String)) %>'
                                                            ></asp:HyperLink></td>
                                                         <td>
                                                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# Eval("Detalle") %>'
                                                                Text="Detalle"
                                                            Visible='<%# ShowDetail(CType(Eval("IdAssigned_User").ToString(),String),CType(Eval("M_State"),String)) %>'
                                                                ></asp:HyperLink>
                                                        </td>
                                                       <td>
                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("Reporte") %>'
                                                                Target="_blank" Text="Reporte"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                            <ControlStyle CssClass="enlaceboton" />                                    
                                        </asp:TemplateField>
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
                            </asp:Panel>
                            <asp:GridView ID="Maintenance_Type" runat="server" AllowPaging="True" 
                                BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" 
                                CellPadding="3" AutoGenerateColumns="False" Visible="False" 
                                Font-Size="Smaller" PageSize="1">
                                <Columns>
                                    <asp:BoundField DataField="Maintenance_Type" HeaderText="Trabajo" />
                                    <asp:BoundField DataField="Detail" HeaderText="Detalle" HtmlEncode="False" >
                                    <ItemStyle CssClass="Move" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                        <table>
                                            <tr>
                                            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                Text='Editar'></asp:HyperLink></td>
                                            <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                Text='Eliminar'></asp:HyperLink></td>
                                            </tr>
                                        </table>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="enlaceboton" />
                                    </asp:TemplateField>
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
                            <asp:GridView ID="Users" runat="server" AllowPaging="True" BackColor="White" 
                                BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                                Visible="False" Font-Size="Smaller" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="IdUser" HeaderText="Usuario" />
                                    <asp:BoundField DataField="U_Level" HeaderText="Nivel" />
                                    <asp:BoundField DataField="Name" HeaderText="Nombre Completo" />
                                    <asp:BoundField DataField="Building" HeaderText="Edificio" />
                                    <asp:BoundField DataField="Email" HeaderText="Correo Electrónico" />
                                    <asp:TemplateField HeaderText="Acciones">
                                        <ItemTemplate>
                                        <table>
                                            <tr>
                                            <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("Editar") %>' 
                                                Text='Editar'></asp:HyperLink></td>
                                            <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# Eval("Eliminar") %>' 
                                                Text='Eliminar'></asp:HyperLink></td>
                                            </tr>
                                        </table>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="enlaceboton" />
                                    </asp:TemplateField>
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
                            <br />
                            <asp:Label ID="lbl_Error" runat="server"></asp:Label>
                            <br />
                            <asp:HyperLink ID="Link" runat="server" Visible="False" CssClass="enlaceboton">HyperLink</asp:HyperLink>
                            <asp:Timer ID="Timer1" runat="server" Interval="50000" Enabled="False">
                            </asp:Timer>
                        </center>                            
                    </td>
                </tr>
            </table>
            <div id=Footer>
                <br />
                &copy; Todos los Derechos Reservados, Federico Navarrete, 2012
            </div>
		</div>
    </form>
</body>
</html>
