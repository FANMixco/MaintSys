
Partial Class index
    Inherits System.Web.UI.Page

    Protected Sub BtnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles BtnLogin.Click
        Dim Conn As New MySQLServerConnection()
        With Conn
            .Add_Param("User", TxtUser.Text)
            .Get_DB_Data("Select * From Users Where IdUser=@User")
            If .Data.Read Then
                If .Data("U_Password") = TxtPass.Text Then
                    'This is a user
                    Session("User") = TxtUser.Text
                    Session("NombreF") = .Data("Name")
                    Session("Level") = .Data("U_Level")
                    Session("Credentials") = "$0fTk.mM!"
                    Response.Redirect("Web/Default.aspx")
                Else
                    LblErr.Text = "Contraseña errónea. Por favor verificar."
                End If
            Else
                'Definitively, the user doesn't exists
                LblErr.Text = "El usuario " + TxtUser.Text + " no existe"
            End If
        End With
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.Clear()
        Session.RemoveAll()
    End Sub
End Class
