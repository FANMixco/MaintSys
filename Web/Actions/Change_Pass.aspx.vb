
Partial Class Web_Change_Pass
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("User") = String.Empty Then
            Response.Redirect("/MaintSys/default.aspx")
        End If
        IdUser.Text = Session("User")
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Add_Param("User", Session("User"))
                .Get_DB_Data("SELECT * FROM Users WHERE idUsuario=@User")
                .Data.Read()
                If .Data("U_Password") = txtOld.Text Then
                    .Add_Param("Password", txtNew.Text)
                    .Exec_Proc("update_password @User, @Password")
                    lblErr.Text = "<h4 class='notify1'>La contraseña fue actualizada exitosamente.</h4>"
                Else
                    lblErr.Text = "<h4 class='notify3'>La contraseña ingresada no coincide con la ingresada previamente.</h4>"
                End If
            Catch ex As Exception
                lblErr.Text = "<h4 class='notify3'>La información no pudo ser ingresada intente en otro momento.</h4>"
            End Try
            .Close()
        End With
    End Sub
End Class
