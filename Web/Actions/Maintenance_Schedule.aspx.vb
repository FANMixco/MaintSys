Partial Class Web_Actions_Maintenance_Schedule
    Inherits System.Web.UI.Page

    Protected Sub R_Type_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles R_Type.SelectedIndexChanged
        If R_Type.SelectedValue = "Completo" Then
            IdMaintenance_Type.Enabled = True
            Panel1.Visible = False
        Else
            IdMaintenance_Type.SelectedIndex = 0
            IdMaintenance_Type.Enabled = False
            RW_Type.SelectedIndex = 0
            RW_Type.Enabled = False
            Panel1.Visible = True
        End If
        IdMaintenance_Type_SelectedIndexChanged(sender, e)
    End Sub

    Protected Sub Cookie_Clear()
        Dim aCookie As HttpCookie
        Dim i As Integer
        Dim limit As Integer = Request.Cookies.Count - 1
        For i = 0 To limit
            aCookie = Request.Cookies(i)
            aCookie.Expires = DateTime.Now.AddDays(-1)
            Response.Cookies.Add(aCookie)
        Next i
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim Cnn, Temp As New MySQLServerConnection
            Dim MEquip As Boolean = False
            Dim Id As String = Request.QueryString("Edit")
            With Cnn

                If Session("User") = String.Empty Then
                    Response.Redirect("/MaintSys/default.aspx")
                End If

                'Agrega el valor del Id
                IdMaintenance_Schedule.Value = Id

                'Agrega los Salones
                .Get_DB_Data("SELECT * FROM Classrooms")
                While .Data.Read()
                    IdClassroom.Items.Add(New ListItem(.Data(1), .Data(0)))
                End While

                'Agrega el Tipo de Mantenimiento
                .Get_DB_Data("SELECT * FROM Maintenance_Type WHERE Maintenance_Type<>'Completo'")
                While .Data.Read()
                    IdMaintenance_Type.Items.Add(New ListItem(.Data(1), .Data(0)))
                End While

                If Not Id = String.Empty Then
                    MEquip = True
                    Button1.Text = "Actualizar"
                    Try
                        .Add_Param("Id", Id)
                        .Get_DB_Data("SELECT * FROM Maintenance_Schedule WHERE IdMaintenance_Schedule=@Id")
                        .Data.Read()
                        IdClassroom.SelectedValue = .Data(2)

                        Call IdClassroom_SelectedIndexChanged(sender, e)

                        If .Data(3).ToString = String.Empty Then
                            IdMaintenance_Type.SelectedIndex = 0
                        Else
                            IdMaintenance_Type.SelectedValue = .Data(3)
                        End If

                        Call IdMaintenance_Type_SelectedIndexChanged(sender, e)

                        Temp.Add_Param("Id", Id)
                        Temp.Get_DB_Data("SELECT ME.IdEquipment AS IdEquipment, Equipment, IdMaintenance_Type, Works FROM Maintenance_Equipment ME INNER JOIN dbo.Equipments E ON ME.IdEquipment=E.IdEquipment WHERE ME.IdMaintenance_Schedule=@Id")
                        If Temp.Data.HasRows Then
                            Call Cookie_Clear()
                            '                            Panel1.Visible = True

                            IdEquipment_Ch.Items.Clear()
                            While Temp.Data.Read()
                                '                                set_Cookie(Temp.Data("IdEquipment"))
                                Dim MType As String = Temp.Data("IdMaintenance_Type").ToString
                                If MType = String.Empty Then
                                    MType = "Todos"
                                End If
                                set_Cookie(Temp.Data("IdEquipment"), "Type", MType)
                                If Not Temp.Data("Works").ToString = String.Empty Then
                                    set_Cookie(Temp.Data("IdEquipment"), "WType", "Específico")
                                    set_Cookie(Temp.Data("IdEquipment"), "Works", Temp.Data("Works"))
                                Else
                                    set_Cookie(Temp.Data("IdEquipment"), "WType", "Completo")
                                End If
                                IdEquipment_Ch.Items.Add(New ListItem(Temp.Data("Equipment"), Temp.Data("IdEquipment")))
                            End While

                            Temp.Add_Param("Id", Id)
                            Temp.Get_DB_Data("SELECT * FROM Equipments WHERE IdEquipment NOT IN (SELECT IdEquipment FROM Maintenance_Equipment WHERE IdMaintenance_Schedule=@Id)")

                            IdEquipment.Items.Clear()
                            While Temp.Data.Read()
                                IdEquipment.Items.Add(New ListItem(Temp.Data("Equipment"), Temp.Data("IdEquipment")))
                            End While

                            R_Type.SelectedIndex = 1
                            R_Type_SelectedIndexChanged(sender, e)
                        End If

                        If MEquip = False Then
                            If .Data("IdMaintenance_Type").ToString <> String.Empty Then
                                IdMaintenance_Type.SelectedValue = .Data("IdMaintenance_Type")
                                txtWorks.Text = .Data("Works").ToString
                            Else
                                IdMaintenance_Type.SelectedIndex = 0
                            End If
                        End If

                        If .Data("M_Start_Date").ToString <> String.Empty Then
                            TxtFechaIni.Text = Format(Convert.ToDateTime(.Data("M_Start_Date").ToString), "yyyy-MM-dd HH:mm").ToString
                        End If

                        If .Data("M_Ending_Date").ToString <> String.Empty Then
                            TxtFechaFin.Text = Format(Convert.ToDateTime(.Data("M_Ending_Date").ToString), "yyyy-MM-dd HH:mm").ToString
                        End If
                        State.SelectedValue = .Data("M_State")

                        Call Users_Load()

                        If .Data("IdAssigned_User").ToString <> String.Empty Then
                            '                            Temp.Add_Param("User", .Data("IdAssigned_User"))
                            '                           Temp.Get_DB_Data("SELECT * FROM Users WHERE IdUser=@User")
                            '                          Temp.Data.Read()
                            '                         IdAssigned_User.Items.Clear()
                            '                        IdAssigned_User.Items.Add(New ListItem(Temp.Data(3), Temp.Data(0)))
                            IdAssigned_User.SelectedValue = .Data("IdAssigned_User")
                        End If

                        'Add Extra Users
                        'Temp.Add_Param("Start_Date", .Data("M_Start_Date"))
                        'Temp.Add_Param("End_Date", .Data("M_Ending_Date"))

                        'Temp.Get_DB_Data("SELECT * FROM Users WHERE IdUser NOT IN (SELECT IdAssigned_User FROM Maintenance_Schedule WHERE (M_Start_Date BETWEEN @Start_Date AND @End_Date OR M_Ending_Date BETWEEN @Start_Date AND @End_Date) OR (@Start_Date BETWEEN M_Start_Date AND M_Ending_Date OR @End_Date BETWEEN M_Start_Date AND M_Ending_Date))")
                        'While Temp.Data.Read()
                        'IdAssigned_User.Items.Add(New ListItem(Temp.Data(3), Temp.Data(0)))
                        'End While

                        If IdAssigned_User.Items.Count > 0 Then
                            IdAssigned_User.Enabled = True
                        End If

                        IdUser.Value = .Data("IdUser")

                    Catch ex As Exception
                        lblErr.Text = "<h4 class=notify3>Error al cargar la información.</h4>"
                    End Try

                Else
                    Button1.Text = "Agregar"
                End If
                If Session("Level") = "Administrador" Or Session("Level") = "Jefe de Departamento" Then
                    Panel2.Visible = True
                End If
                .Close()
                Temp.Close()
            End With
        End If
    End Sub

    Protected Sub BtnYes_Click(sender As Object, e As System.EventArgs) Handles BtnYes.Click
        If IdEquipment.Items.Count <> 0 Then
            IdEquipment_Ch.Items.Add(New ListItem(IdEquipment.SelectedItem.ToString, IdEquipment.SelectedValue))
            IdEquipment.Items.Remove(IdEquipment.SelectedItem)
        End If
    End Sub

    Protected Sub BtnNo_Click(sender As Object, e As System.EventArgs) Handles BtnNo.Click
        If IdEquipment_Ch.Items.Count <> 0 Then
            IdEquipment.Items.Add(New ListItem(IdEquipment_Ch.SelectedItem.ToString, IdEquipment_Ch.SelectedValue))
            IdEquipment_Ch.Items.Remove(IdEquipment_Ch.SelectedItem)
        End If
    End Sub

    Protected Sub txtWorks_TextChanged(sender As Object, e As System.EventArgs) Handles txtWorks.TextChanged
        If R_Type.SelectedValue <> "Completo" Then
            set_Cookie(IdEquipment_Ch.SelectedValue, "Work", txtWorks.Text)
        End If
    End Sub

    Protected Sub IdEquipment_Ch_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles IdEquipment_Ch.SelectedIndexChanged
        get_Cookie(IdEquipment_Ch.SelectedValue)
        IdMaintenance_Type.Enabled = True
    End Sub

    Protected Sub RW_Type_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles RW_Type.SelectedIndexChanged
        If RW_Type.SelectedIndex = 0 Then
            Panel3.Visible = False
        Else
            Panel3.Visible = True
        End If
        set_Cookie(IdEquipment_Ch.SelectedValue, "WType", RW_Type.SelectedValue)
    End Sub

    Protected Sub IdMaintenance_Type_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles IdMaintenance_Type.SelectedIndexChanged
        Dim Cnn As New MySQLServerConnection
        Dim SQL As String = "SELECT * FROM Maintenance_Type WHERE"
        With Cnn
            If IdMaintenance_Type.SelectedValue = "Todos" Then
                RW_Type.Enabled = False
            Else
                RW_Type.Enabled = True
                .Add_Param("Id", IdMaintenance_Type.SelectedValue)
                SQL += " IdMaintenance_Type=@Id AND"
            End If
            .Get_DB_Data(SQL + " Maintenance_Type<>'Completo'")
            Information.Text = ""
            While .Data.Read
                Information.Text += "<b>" + .Data(1) + "</b><br/>" + .Data(2) + "<br />"
            End While
            .Close()
        End With
        set_Cookie(IdEquipment_Ch.SelectedValue, "Type", IdMaintenance_Type.SelectedValue)
    End Sub

    Protected Function set_Cookie(ByVal CName As String, Optional ByVal Name As String = "", Optional ByVal Value As String = "") As Boolean
        'Función para crear Cookies
        'This variable verify that the Cookie exist in the system
        Dim Exist As Boolean = False

        'Create a temporal cookie
        Dim cookie As HttpCookie

        'If the cookie exist create a temporal cookie with their name
        If Not Request.Cookies(CName) Is Nothing Then
            Exist = True
            cookie = Request.Cookies(CName)
        Else
            'If not exist create a new cookie
            cookie = New HttpCookie(CName)
        End If
        Try
            If Exist = False Then
                'Add cookie expires time
                cookie.Expires = DateTime.Today.AddDays(1)

                'Create a real cookie
                Response.Cookies.Add(cookie)
            End If
            If Not (Name = "" Or Value = "") Then
                If cookie.Values.Get(Name) = "" Then
                    cookie.Values.Add(Name, Value)
                    Response.Cookies.Add(cookie)
                Else
                    cookie.Values.Set(Name, Value)
                    Response.Cookies.Set(cookie)
                End If
            End If
            Return True
        Catch ex As Exception
            Return False
        End Try
    End Function

    Protected Function get_Cookie(ByVal CName As String) As Boolean
        If Not Request.Cookies(CName) Is Nothing Then
            Dim cookie As HttpCookie = Request.Cookies(CName)
            Try
                If Not cookie.Values.Get("Type") = "" Then
                    IdMaintenance_Type.SelectedValue = cookie.Values.Get("Type")
                End If
                If Not cookie.Values.Get("WType") = "" Then
                    RW_Type.SelectedValue = cookie.Values.Get("WType")
                    RW_Type.Enabled = True
                Else
                    RW_Type.Enabled = False
                End If
                If Not cookie.Values.Get("Works") = "" Then
                    txtWorks.Text = cookie.Values.Get("Works")
                    Panel3.Visible = True
                Else
                    Panel3.Visible = False
                End If
                Return True
            Catch ex As Exception
                Return False
            End Try
        Else
            IdMaintenance_Type.SelectedIndex = 0
            RW_Type.SelectedIndex = 0
            RW_Type.Enabled = False
            txtWorks.Text = ""
            Panel3.Visible = False
            Return False
        End If
    End Function

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        'MsgBox(IdAssigned_User.SelectedIndex)
        '        Exit Sub
        Dim Cnn As New MySQLServerConnection
        Dim Id As String = IdMaintenance_Schedule.Value
        With Cnn
            Try
                If IdUser.Value = String.Empty Then
                    .Add_Param("User", Session("User"))
                Else
                    .Add_Param("User", IdUser.Value)
                End If

                .Add_Param("Classroom", IdClassroom.SelectedValue)

                If R_Type.SelectedValue = "Completo" Then
                    If IdMaintenance_Type.SelectedValue <> "Todos" Then
                        .Add_Param("MType", IdMaintenance_Type.SelectedValue)
                    Else
                        .Add_Param("MType", DBNull.Value)
                    End If

                    If RW_Type.SelectedValue <> "Completo" Then
                        .Add_Param("Works", txtWorks.Text)
                    Else
                        .Add_Param("Works", DBNull.Value)
                    End If

                Else
                    .Add_Param("MType", DBNull.Value)
                    .Add_Param("Works", DBNull.Value)
                End If

                If TxtFechaIni.Text <> String.Empty Then
                    .Add_Param("Start_Date", Format(Convert.ToDateTime(TxtFechaIni.Text), "yyyy-dd-MM HH:mm"))
                Else
                    .Add_Param("Start_Date", DBNull.Value)
                End If

                If TxtFechaFin.Text <> String.Empty Then
                    .Add_Param("End_Date", Format(Convert.ToDateTime(TxtFechaFin.Text), "yyyy-dd-MM HH:mm"))
                Else
                    .Add_Param("End_Date", DBNull.Value)
                End If

                .Add_Param("State", State.SelectedValue)

                If IdAssigned_User.SelectedValue <> "" Then
                    .Add_Param("AUser", IdAssigned_User.SelectedValue)
                Else
                    .Add_Param("AUser", DBNull.Value)
                End If

                If Id = String.Empty Then

                    Try

                        .Exec_Proc("p_maintenance_schedule 1, 0, @User, @MType, @Classroom, @Start_Date, @End_Date, @State, @Works, @AUser")

                        lblErr.Text = "<h4 class=notify1>El mantenimiento fue agregado con éxito.</h4>"

                        'If IdAssigned_User.SelectedValue <> "" Then
                        'Área de gestión de correo electrónico, dentro de la clase Email faltan parametros que ahí dice cuales e debe modificar
                        'Dim Temp As New MySQLServerConnection
                        'Dim FUser, TUser As String
                        'Temp.Add_Param("User", Session("User"))
                        'Temp.Get_DB_Data("SELECT Email FROM Users WHERE idUser=@User")
                        'Temp.Data.Read()
                        'FUser = Temp.Data("Email").ToString

                        'Temp.Add_Param("User", IdAssigned_User.SelectedValue)
                        'Temp.Get_DB_Data("SELECT Email FROM Users WHERE idUser=@User")
                        'Temp.Data.Read()
                        'TUser = Temp.Data("Email").ToString

                        'If TUser <> String.Empty Then
                        '     Dim myEmail As New Email(FUser, TUser, "Nuevo Mantenimiento", "Fecha del Mantenimiento:" & TxtFechaIni.Text & " - " & TxtFechaFin.Text)
                        '      myEmail.Enviar()
                        '   End If
                        'End If

                    Catch ex As Exception
                        lblErr.Text = "<h4 class=notify3>Error al agregar el mantenimiento.</h4>"

                    End Try

                Else
                    .Add_Param("Id", Id)

                    Try
                        .Exec_Proc("p_maintenance_schedule 0, @Id, @User, @MType, @Classroom, @Start_Date, @End_Date, @State, @Works, @AUser")
                        lblErr.Text = "<h4 class=notify1>El mantenimiento fue modificado con éxito.</h4>"

                        If IdEquipment_Ch.Items.Count > 0 Then
                            Try
                                .Add_Param("IdMS", Id)
                                .Exec_Query("DELETE FROM Maintenance_Equipment WHERE IdMaintenance_Schedule=@IdMS")
                            Catch ex As Exception
                                lblErr.Text = "<h4 class=notify3>Error al eliminar la información temporal.</h4>"

                            End Try
                        End If

                        'If IdAssigned_User.SelectedValue <> "" Then
                        'Área de gestión de correo electrónico, dentro de la clase Email faltan parametros que ahí dice cuales e debe modificar
                        'Dim Temp As New MySQLServerConnection
                        'Dim FUser, TUser As String
                        'Temp.Add_Param("User", Session("User"))
                        'Temp.Get_DB_Data("SELECT Email FROM Users WHERE idUser=@User")
                        'Temp.Data.Read()
                        'FUser = Temp.Data("Email").ToString

                        'Temp.Add_Param("User", IdAssigned_User.SelectedValue)
                        'Temp.Get_DB_Data("SELECT Email FROM Users WHERE idUser=@User")
                        'Temp.Data.Read()
                        'TUser = Temp.Data("Email").ToString

                        'If TUser <> String.Empty Then
                        '     Dim myEmail As New Email(FUser, TUser, "Actualización de Mantenimiento", "Fecha del Mantenimiento:" & TxtFechaIni.Text & " - " & TxtFechaFin.Text)
                        '      myEmail.Enviar()
                        '   End If
                        'End If

                    Catch ex As Exception
                        lblErr.Text = "<h4 class=notify3>Error al modificar el mantenimiento.</h4>"

                    End Try

                End If

                Try
                    If IdEquipment_Ch.Items.Count > 0 Then

                        .Get_DB_Data("SELECT MAX(IdMaintenance_Schedule) AS ID FROM Maintenance_Schedule")
                        .Data.Read()

                        Id = .Data("Id")
                        For i = 0 To IdEquipment_Ch.Items.Count - 1
                            IdEquipment_Ch.SelectedIndex = i
                            IdEquipment_Ch_SelectedIndexChanged(sender, e)
                            .Add_Param("IdMS", Id)
                            .Add_Param("IdE", IdEquipment_Ch.SelectedValue)

                            If IdMaintenance_Type.SelectedValue <> "Todos" Then
                                .Add_Param("MType", IdMaintenance_Type.SelectedValue)
                            Else
                                .Add_Param("MType", DBNull.Value)
                            End If

                            If RW_Type.SelectedValue <> "Completo" Then
                                .Add_Param("Works", txtWorks.Text)
                            Else
                                .Add_Param("Works", DBNull.Value)
                            End If

                            .Exec_Proc("p_maintenance_equipment @IdMS, @IdE, @MType, @Works")
                        Next i
                    End If

                Catch ex As Exception
                    lblErr.Text = "<h4 class=notify3>Error al agregar los equipos en el mantenimiento.</h4>"

                End Try
            Catch ex As Exception
                lblErr.Text = "<h4 class=notify3>Error en el mantenimiento.</h4>"

            End Try
        End With
    End Sub

    Protected Sub IdClassroom_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles IdClassroom.SelectedIndexChanged
        Call Cookie_Clear()
        Dim Cnn As New MySQLServerConnection
        Dim SQL As String
        With Cnn
            Try
                .Add_Param("Id", IdClassroom.SelectedValue)
                SQL = "SELECT * FROM Equipments WHERE IdClassroom=@Id"
                IdEquipment.Items.Clear()
                If IdClassroom.SelectedIndex <> 0 Then
                    .Get_DB_Data(SQL)
                    While .Data.Read()
                        IdEquipment.Items.Add(New ListItem(.Data(4), .Data(0)))
                    End While
                End If

                .Close()
                If IdClassroom.SelectedValue.ToString <> String.Empty Then
                    R_Type.Enabled = True
                Else
                    R_Type.Enabled = False
                End If
                R_Type_SelectedIndexChanged(sender, e)
            Catch ex As Exception

            End Try
        End With
    End Sub

    Protected Sub Users_Load()
        If TxtFechaIni.Text <> String.Empty And TxtFechaFin.Text <> String.Empty Then
            Dim Cnn As New MySQLServerConnection
            With Cnn
                'Agrega los Usuarios
                .Add_Param("Start_Date", Format(Convert.ToDateTime(TxtFechaIni.Text), "yyyy-MM-dd HH:mm").ToString)
                .Add_Param("End_Date", Format(Convert.ToDateTime(TxtFechaFin.Text), "yyyy-MM-dd HH:mm").ToString)

                'Verifica si el usuario no se encuentra elegido
                .Get_DB_Data("SELECT * FROM Users WHERE IdUser NOT IN (SELECT IdAssigned_User FROM Maintenance_Schedule WHERE (M_Start_Date BETWEEN @Start_Date AND @End_Date OR M_Ending_Date BETWEEN @Start_Date AND @End_Date) OR (@Start_Date BETWEEN M_Start_Date AND M_Ending_Date OR @End_Date BETWEEN M_Start_Date AND M_Ending_Date))")
                IdAssigned_User.Items.Clear()
                '                IdAssigned_User.Items.Add(New ListItem("Pendiente", "Pendiente"))
                IdAssigned_User.Items.Add("")
                While .Data.Read()
                    IdAssigned_User.Items.Add(New ListItem(.Data(3), .Data(0)))
                End While

                .Close()

                If IdAssigned_User.Items.Count = 0 Then
                    IdAssigned_User.Enabled = False
                End If
            End With
        End If
    End Sub

    Protected Sub TxtFechaIni_TextChanged(sender As Object, e As System.EventArgs) Handles TxtFechaIni.TextChanged
        Call Users_Load()
    End Sub

    Protected Sub TxtFechaFin_TextChanged(sender As Object, e As System.EventArgs) Handles TxtFechaFin.TextChanged
        Call Users_Load()
    End Sub
End Class
