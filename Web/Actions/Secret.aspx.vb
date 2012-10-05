
Partial Class Web_Secret
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
                .Add_Param("SQ", cmbQuestion.SelectedValue)
                .Add_Param("SA", txtAnswer.Text)
                .Exec_Proc("update_secret @User, @SQ, @SA")
                lblErr.Text = "<h4 class='notify1'>La información fue actualizada exitosamente.</h4>"
            Catch ex As Exception
                lblErr.Text = "<h4 class='notify3'>La información no pudo ser ingresada intente en otro momento.</h4>"
            End Try
        End With
    End Sub
End Class
