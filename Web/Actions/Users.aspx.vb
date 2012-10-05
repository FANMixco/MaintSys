
Partial Class Web_Users
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Add_Param("User", txtUser.Text)
                .Get_DB_Data("SELECT * FROM Users WHERE idUsuario=@User")
                .Data.Read()
                If Not Cnn.Data.HasRows Then
                    .Add_Param("User", txtUser.Text)
                    .Add_Param("Name", txtName.Text)
                    .Add_Param("Level", cmbLevel.SelectedValue)
                    .Add_Param("Building", cmbBuilding.SelectedValue)

                    If txtEmail.Text = String.Empty Then
                        .Add_Param("Email", DBNull.Value)
                    Else
                        .Add_Param("Email", txtEmail.Text)
                    End If

                    If txtUser.ReadOnly = True Then
                        .Exec_Proc("p_users 1, @User, @Level, @Name, @Building, @Email")
                        lblErr.Text = "<h4 class='notify1'>El usuario fue ingresado con exito.</h4>"
                    Else
                        .Exec_Proc("p_users 0, @User, @Level, @Name, @Building, @Email")
                        lblErr.Text = "<h4 class='notify1'>El usuario fue actualizado con exito.</h4>"
                    End If
                Else
                    lblErr.Text = "<h4 class='notify3'>El Usuario ingresado ya existe.</h4>"
                End If
            Catch ex As Exception
                lblErr.Text = "<h4 class='notify3'>La información no pudo ser ingresada intente en otro momento.</h4>"
            End Try
            .Close()
        End With
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("User") = String.Empty Or Session("Level") <> "Administrador" Then
            Response.Redirect("/MaintSys/default.aspx")
        End If
        Dim Cnn As New MySQLServerConnection
        Dim IdVal As String = Request.QueryString("Edit")
        Dim i As Integer
        With Cnn
            .Get_DB_Data("SELECT * FROM Buildings")
            cmbBuilding.Items.Clear()
            While .Data.Read
                cmbBuilding.Items.Add(New ListItem(.Data(1), .Data(0)))
            End While

            If Not IdVal = String.Empty Then
                txtUser.Text = Request.QueryString("Edit")
                txtUser.ReadOnly = True
                Button1.Text = "Actualizar"
                With Cnn
                    .Add_Param("IdVal", IdVal)
                    .Get_DB_Data("SELECT * FROM Users WHERE IdUser=@IdVal")
                    .Data.Read()
                    txtUser.Text = .Data(0)
                    txtName.Text = .Data(3)
                    txtEmail.Text = .Data("Email")
                    For i = 0 To cmbBuilding.Items.Count() - 1
                        If cmbBuilding.Items(i).Value.Equals(.Data(4)) Then cmbBuilding.Items(i).Selected = True
                    Next

                    For i = 0 To cmbLevel.Items.Count() - 1
                        If cmbLevel.Items(i).Value.Equals(.Data(2)) Then cmbLevel.Items(i).Selected = True
                    Next
                End With
            Else
                txtUser.Text = String.Empty
                txtName.Text = String.Empty
                Button1.Text = "Agregar"
            End If
            .Close()
        End With
    End Sub
End Class
