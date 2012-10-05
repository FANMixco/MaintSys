<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Maintenance_Schedule.aspx.vb" Inherits="Web_Actions_Maintenance_Schedule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>MaintSys :: Mantenimiento</title>
    <link rel="Stylesheet" type="text/css" href="/MaintSys/Styles/Form_Style.css" />
    <link rel="Stylesheet" type="text/css" href="/MaintSys/Styles/General_Style.css" />
    <script type='text/javascript' src='/MaintSys/Controls/DatePicker/datetimepicker_css.js'></script>
    <script type='text/javascript' src='/MaintSys/JS/Validar.js'></script>
    <script src="/MaintSys/JS/jquery-1.7.min.js" type="text/javascript"></script>
    <script type ="text/javascript">
        $(document).ready(function () {
            $(".Form").width(600);
        });
    </script>
</head>
<body>
    <form id="form1" class="Form" runat="server">
        <div>
            <center>                
                <h2>Mantenimiento</h2><hr />
                <table style="width: 100%;">
                    <tr>
                        <td>                
                            <asp:Label ID="Label1" runat="server" Font-Bold="True" 
                                Text="Salón"></asp:Label>                
                        </td>
                        <td>                
                            <asp:DropDownList ID="IdClassroom" runat="server" AutoPostBack="True">
                                <asp:ListItem></asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="IdClassroom" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                        </td>
                        <td rowspan="8">
                            <asp:Panel ID="Panel4" runat="server" Height="200px" HorizontalAlign="Justify" 
                                ScrollBars="Vertical">
                                <asp:Literal ID="Information" runat="server"></asp:Literal>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>                
                            <asp:Label ID="Label2" runat="server" Font-Bold="True" Text="Tipo de revisión"></asp:Label>
                
                        </td>
                        <td>                
                            <asp:DropDownList ID="R_Type" runat="server" AutoPostBack="True" 
                                Enabled="False">
                                <asp:ListItem Value="Completo">Completo</asp:ListItem>
                                <asp:ListItem Value="Específico">Específico</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Panel ID="Panel1" runat="server" Visible="False">
                                <table style="width:100%;">
                                    <tr>
                                        <td rowspan="4">
                                            <asp:ListBox ID="IdEquipment" runat="server">
                                            </asp:ListBox>
                                        </td>
                                        <td>
                                            &nbsp;</td>
                                        <td rowspan="4">
                                            <asp:ListBox ID="IdEquipment_Ch" runat="server" AutoPostBack="True">
                                            </asp:ListBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnYes" runat="server" Text="&rArr;" Font-Bold="True" 
                                                style="width: 26px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Button ID="BtnNo" runat="server" Text="&lArr;" Font-Bold="True" style="width: 26px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;</td>
                                    </tr>                                </table>
                                <asp:Label ID="Label23" runat="server" Font-Italic="True" 
                                    Text="Seleccione el equipo a trabajar."></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                    <tr>
                        <td>                
                            <asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Tipo de Mantenimiento"></asp:Label>
                
                        </td>
                        <td>                
                            <asp:DropDownList ID="IdMaintenance_Type" runat="server" Enabled="False" 
                                AutoPostBack="True">
                                <asp:ListItem>Todos</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Tareas a Realizar"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="RW_Type" runat="server" AutoPostBack="True" 
                                Enabled="False">
                                <asp:ListItem Value="Completo">Completo</asp:ListItem>
                                <asp:ListItem Value="Específico">Específico</asp:ListItem>
                            </asp:DropDownList>
                            <asp:Panel ID="Panel3" runat="server" Visible="False">
                                <asp:TextBox ID="txtWorks" runat="server" AutoPostBack="True"></asp:TextBox>
                                <br />
                                <asp:Label ID="Label24" runat="server" Font-Italic="True" Text="Separe cada tarea por una &quot;,&quot;."></asp:Label>
                            </asp:Panel>
                        </td>
                    </tr>
                    <asp:Panel ID="Panel2" runat="server" Visible="False">
                        <tr>
                            <td>
                                <asp:Label ID="Label3" runat="server" Font-Bold="True" 
                                    Text="Fecha de Inicio"></asp:Label>
                
                            </td>
                            <td>
                                <asp:TextBox ID="TxtFechaIni" runat="server" CssClass="twitterStyleTextbox" MaxLength="19" AutoPostBack="True"></asp:TextBox>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Controls/DatePicker/images2/cal.gif" onclick="javascript:NewCssCal ('TxtFechaIni','yyyyddMM','arrow',true,'24','true','future')"></asp:Image>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="TxtFechaIni" Display="Dynamic" ErrorMessage="*" 
                                    Font-Bold="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label5" runat="server" Font-Bold="True" 
                                    Text="Fecha de Finalización"></asp:Label>
                
                            </td>
                            <td>
                                <asp:TextBox ID="TxtFechaFin" runat="server" CssClass="twitterStyleTextbox" MaxLength="19" AutoPostBack="True"></asp:TextBox>
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Controls/DatePicker/images2/cal.gif" onclick="javascript:NewCssCal ('TxtFechaFin','yyyyddMM','arrow',true,'24','true','future')"></asp:Image>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="TxtFechaFin" Display="Dynamic" ErrorMessage="*" 
                                    Font-Bold="True"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>                
                                <asp:Label ID="Label6" runat="server" Font-Bold="True" Text="Estado"></asp:Label>
                
                            </td>
                            <td>                
                                <asp:DropDownList ID="State" runat="server">
                                    <asp:ListItem Value="Abierto">Abierto</asp:ListItem>
                                    <asp:ListItem Value="Completado">Completado</asp:ListItem>
                                    <asp:ListItem Value="Pendiente" Selected="True">Pendiente</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="Label8" runat="server" Font-Bold="True" 
                                    Text="Usuario Asignado"></asp:Label>                
                            </td>
                            <td>                
                                <asp:DropDownList ID="IdAssigned_User" runat="server">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </asp:Panel>
                </table>
                <asp:Label ID="lblErr" runat="server" Font-Italic="False"></asp:Label>
                <br />
                <asp:Button ID="Button1" runat="server" CssClass="Button" />
                <br />
                <asp:HiddenField ID="IdMaintenance_Schedule" runat="server" />
                <asp:HiddenField ID="IdUser" runat="server" />
            </center>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Web/Default.aspx?Adm=Maintenance_Schedule" 
                    CssClass="enlaceboton">Regresar</asp:HyperLink>    
        </div>
    </form>
</body>
</html>
