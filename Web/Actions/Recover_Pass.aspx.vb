
Partial Class Web_Pass_Recover
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Button.Text = "Buscar Usuario"
    End Sub

    Protected Sub Button_Click(sender As Object, e As System.EventArgs) Handles Button.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            If Panel1.Visible = False Then
                .Add_Param("IdVal", txtUser.Text)
                .Get_DB_Data("SELECT * FROM Users WHERE IdUser=@IdVal")
                .Data.Read()
                If .Data.HasRows Then
                    If .Data(5).ToString = String.Empty Then
                        lblErr.Text = "<h4 class='notify3'>No dispone de Pregunta Secreta, consulte a su Administrador</h4>"
                        Exit Sub
                    End If
                    Panel1.Visible = True
                    lblQuestion.Text = .Data(5)
                    txtUser.ReadOnly = True
                    Button.Text = "Aceptar"
                Else
                    lblErr.Text = "<h4 class='notify3'>No existe el usuario ingresado</h4>"
                End If
            Else
                .Add_Param("IdVal", txtUser.Text)
                .Add_Param("SA", txtAnswer.Text)
                .Get_DB_Data("SELECT * FROM Users WHERE IdUser=@IdVal AND Secret_Answer like @SA")
                .Data.Read()
                If .Data.HasRows Then
                    lblErr.Text = "<h4 class='notify1'>Su contraseña es: <i>" + .Data(1) + "</i></h4>"
                Else
                    lblErr.Text = "<h4 class='notify3'>La respuesta ingresada no es correcta</h4>"
                End If
            End If
        End With
    End Sub
End Class
