
Partial Class Web_index
    Inherits System.Web.UI.Page

    Public Function ShowEdit_Del(ByVal IdUser As String, ByVal State As String) As String
        If Session("User") = IdUser Then
            If State = "Pendiente" Then
                Return "true"
            Else
                Return "false"
            End If
        End If

        If Session("Level") = "Administrador" Or Session("Level") = "Jefe de Departamento" Then
            If State <> "Completado" Then
                Return "true"
            Else
                Return "false"
            End If
        Else
            Return "false"
        End If
    End Function

    Public Function ShowDetail(ByVal IdAssigned_dUser As String, ByVal State As String) As String
        If Session("User") <> IdAssigned_dUser And Not (Session("Level") = "Administrador") Then
            Return "false"
        Else
            Return "true"
        End If
    End Function

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("User") = String.Empty Or Session("Level") = String.Empty Then
            Response.Redirect("/MaintSys/default.aspx")
        End If
        Dim Valor As String = Request.QueryString("Adm")
        welcome_name.Text = "<b>Bienvenido, " + Session("NombreF") + "</b><br />"
        Call Create_Menu()
        With Link
            .NavigateUrl = "Acciones/" + Valor + "_M.aspx"
            If Not Request.QueryString("Adm") = String.Empty Then
                .Visible = True
            Else
                .Visible = False
            End If
        End With
        If Request.QueryString("Del") <> String.Empty Then
            Panel1.Visible = True
        End If
        If Valor = String.Empty Then
            Resultado.Text = "Bienvenidos a MaintSys, será un gusto atenderle, por favor seleccionela Opción que desea Utilizar del menú que se encuentra a la izquierda."
        Else
            If Not IsPostBack Then
                Call Load_Grid()
                Response.Cookies.Clear()
            End If
        End If
    End Sub

    Protected Sub Create_Menu()
        If Not IsPostBack Then
            Dim Level As String = Session("Level")
            Dim VMenu As String = "<li><a href='Default.aspx?Adm=Equipment_Producer'>Distribuidor de Equipo</a></li>" + _
                                    "<li><a href='Default.aspx?Adm=Equipments'>Equipos</a></li>" + _
                                    "<li><a href='Default.aspx?Adm=Maintenance_Type'>Tipo de Mantenimiento</a></li>"
            Select Case Level
                Case "Jefe de Departamento" 'Asignar el trabajo
                    Menu.Text = VMenu
                Case Else
                    If Level <> "Empleado" Then
                        Menu.Text += "<li><a href='Default.aspx?Adm=Buildings'>Edificios</a></li>" + _
                                "<li><a href='Default.aspx?Adm=Laboratories'>Laboratorios</a></li>" + _
                                "<li><a href='Default.aspx?Adm=Classrooms'>Salones</a></li>" + _
                                VMenu
                        If Level = "Administrador" Then
                            Menu.Text += "<li><a href='Default.aspx?Adm=Users'>Usuarios</a></li>" + _
                                         "<li><a href='Actions/BackUp.aspx'>Copia de Respaldo</a></li>"
                        End If
                    End If
            End Select
            '            If Not (Level = "Administrador") Then
            'Menu.Text += "<li><a href='Acciones/E_Sugerencia.aspx' class='Float_Form'>Sugerencia</a></li>"
            'End If
        End If
    End Sub

    Protected Sub Load_Grid()
        Dim SQL As String
        Dim Opt As String = Request.QueryString("Adm")
        SQL = "select * from vw_" + Opt.ToLower()
        Select Case Opt
            Case "Maintenance_Schedule"
                Call E_Grid(Maintenance_Schedule, SQL + " ORDER BY M_Ending_Date")
                If Maintenance_Schedule.Rows.Count = 0 Then
                    lbl_Error.Text = "No existen mantenimientos <br />"
                    lbl_Error.Visible = True
                    Maintenance_Schedule_Panel.Visible = False
                Else
                    Maintenance_Schedule_Panel.Visible = True
                End If
                Link.Text = "Nuevo Mantenimiento"
            Case "Equipment_Producer"
                Call E_Grid(Equipment_Producer, SQL)
                If Equipment_Producer.Rows.Count = 0 Then
                    lbl_Error.Text = "No existen distribuidores <br />"
                    lbl_Error.Visible = True
                End If
                Link.Text = "Nuevo Distribuidor"
            Case "Equipments"
                Call E_Grid(Equipments, SQL)
                If Equipments.Rows.Count = 0 Then
                    lbl_Error.Text = "No existen equipos <br />"
                    lbl_Error.Visible = True
                    Equipments_Panel.Visible = False
                Else
                    Equipments_Panel.Visible = True
                End If
                Link.Text = "Nuevo Equipo"
            Case "Maintenance_Type"
                Call E_Grid(Maintenance_Type, SQL)
                If Maintenance_Type.Rows.Count = 0 Then
                    lbl_Error.Text = "No existen tipos de mantenimiento <br />"
                    lbl_Error.Visible = True
                End If
                Link.Text = "Nuevo Tipo de Mantenimiento"
            Case "Buildings"
                Call E_Grid(Buildings, SQL)
                If Buildings.Rows.Count = 0 Then
                    lbl_Error.Text = "No existen edificios <br />"
                    lbl_Error.Visible = True
                End If
                Link.Text = "Nuevo Edificio"
            Case "Laboratories"
                Call E_Grid(Laboratories, SQL)
                If Laboratories.Rows.Count = 0 Then
                    lbl_Error.Text = "No existen laboratorios <br />"
                    lbl_Error.Visible = True
                End If
                Link.Text = "Nuevo Laboratorio"
            Case "Classrooms"
                Call E_Grid(Classrooms, SQL)
                If Classrooms.Rows.Count = 0 Then
                    lbl_Error.Text = "No existen salones <br />"
                    lbl_Error.Visible = True
                End If
                Link.Text = "Nuevo Salón"
            Case "Users"
                Call E_Grid(Users, SQL)
                If Users.Rows.Count = 0 Then
                    lbl_Error.Text = "No existen usuarios <br />"
                    lbl_Error.Visible = True
                End If
                Link.Text = "Nuevo Usuario"
        End Select
        Link.NavigateUrl = "Actions/" + Opt + ".aspx"
    End Sub

    Protected Sub E_Grid(ByVal Grid As GridView, ByVal SQL As String)
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Grid.Visible = True
            Grid.DataSource = .Get_DB_Source(SQL)
            Grid.DataBind()
        End With
    End Sub

    Protected Sub No_Click(sender As Object, e As System.EventArgs) Handles No.Click
        Panel1.Visible = False
        Response.Redirect("Default.aspx?Adm=" + Request.QueryString("Adm"))
    End Sub

    Protected Sub Yes_Click(sender As Object, e As System.EventArgs) Handles Yes.Click
        Dim IdTable As String = "Id" + Request.QueryString("Adm")
        If IdTable = "Buildings" Or IdTable = "Classrooms" Or IdTable = "Equipments" Or IdTable = "Laboratories" Then
            IdTable = "Id" + Left(IdTable, IdTable.Length - 1)
        End If

        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Exec_Query("DELETE FROM " + Request.QueryString("Adm") + " WHERE " + IdTable + "=" + Request.QueryString("Del"))
                Resultado.Text = "<h4 class=notify1>Fue eliminado con éxito.</h4>"
            Catch ex As Exception
                Resultado.Text = "<h4 class=notify3>Error al modificar el mantenimiento.</h4>"
            End Try
        End With
        Panel1.Visible = False
    End Sub

    Protected Sub Search()
        If TxtFechaIni.Text <> String.Empty And TxtFechaFin.Text <> String.Empty Then
            Dim SQL As String = "select * from vw_maintenance_schedule WHERE M_Start_Date BETWEEN '" + TxtFechaIni.Text + " 00:00' AND '" + TxtFechaFin.Text + " 23:59'"
            E_Grid(Maintenance_Schedule, SQL)
            Reporte.NavigateUrl = "Actions/Reportes/Grid.aspx?FechaIni=" + TxtFechaIni.Text + "&FechaFin=" + TxtFechaFin.Text
        End If

        If txtFecha.Text <> String.Empty Then
            Dim SQL As String = "select * from vw_maintenance_schedule WHERE M_Start_Date BETWEEN '" + txtFecha.Text + " 00:00' AND '" + txtFecha.Text + " 23:59'"
            E_Grid(Maintenance_Schedule, SQL)
            Reporte_F.NavigateUrl = "Actions/Reportes/Grid.aspx?Fecha=" + txtFecha.Text
        End If
    End Sub

    Protected Sub TxtFechaIni_TextChanged(sender As Object, e As System.EventArgs) Handles TxtFechaIni.TextChanged
        Call Search()
    End Sub

    Protected Sub TxtFechaFin_TextChanged(sender As Object, e As System.EventArgs) Handles TxtFechaFin.TextChanged
        Call Search()
    End Sub

    Protected Sub Buildings_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Buildings.PageIndexChanging
        Buildings.PageIndex = e.NewPageIndex
        Buildings.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Classrooms_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Classrooms.PageIndexChanging
        Classrooms.PageIndex = e.NewPageIndex
        Classrooms.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Equipment_Producer_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Equipment_Producer.PageIndexChanging
        Equipment_Producer.PageIndex = e.NewPageIndex
        Equipment_Producer.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Equipment_Type_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Equipment_Type.PageIndexChanging
        Equipment_Type.PageIndex = e.NewPageIndex
        Equipment_Type.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Equipments_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Equipments.PageIndexChanging
        Equipments.PageIndex = e.NewPageIndex
        Equipments.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Laboratories_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Laboratories.PageIndexChanging
        Laboratories.PageIndex = e.NewPageIndex
        Laboratories.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Maintenance_Schedule_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Maintenance_Schedule.PageIndexChanging
        Maintenance_Schedule.PageIndex = e.NewPageIndex
        Maintenance_Schedule.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Maintenance_Type_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Maintenance_Type.PageIndexChanging
        Maintenance_Type.PageIndex = e.NewPageIndex
        Maintenance_Type.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Users_PageIndexChanging(sender As Object, e As System.Web.UI.WebControls.GridViewPageEventArgs) Handles Users.PageIndexChanging
        Users.PageIndex = e.NewPageIndex
        Users.DataBind()
        Call Load_Grid()
    End Sub

    Protected Sub Intervalo_CheckedChanged(sender As Object, e As EventArgs) Handles Intervalo.CheckedChanged
        If Intervalo.Checked = True Then
            Image1.Visible = False
            Panel2.Visible = True
            txtFecha.Text = ""
            txtFecha.Enabled = False
        Else
            txtFecha.Enabled = True
            Image1.Visible = True
            Panel2.Visible = False
            TxtFechaFin.Text = ""
            TxtFechaIni.Text = ""
        End If
    End Sub

    Protected Sub txtFecha_TextChanged(sender As Object, e As EventArgs) Handles txtFecha.TextChanged
        Call Search()
    End Sub
End Class
