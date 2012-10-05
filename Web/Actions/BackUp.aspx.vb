Imports System.IO
Imports System.Linq

Partial Class Web_Actions_BackUp
    Inherits System.Web.UI.Page
    Private Const Type As String = ".bak"

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                Cnn.Exec_Query("Backup Database MaintSys to disk='" + Server.MapPath("~/BackUps/") + Label1.Text + ".bak'")
                lblErr.Text = "<h4 class='notify1'>La copia de respaldo fue hecha con éxito.</h4>"
            Catch ex As Exception
                lblErr.Text = "<h4 class='notify3'>Falla en la creación de la copia de respaldo.</h4>"
            End Try
        End With
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("User") = String.Empty Or Session("Level") <> "Administrador" Then
            Response.Redirect("/MaintSys/default.aspx")
        End If
        Label1.Text = Date.Now().Day.ToString + "-" + Date.Now().Month.ToString + "-" + Date.Now().Year.ToString

        Call Listar()

    End Sub

    Protected Sub Listar()
        Dim archivos = From archivo In Directory.GetFiles(Server.MapPath("~/BackUps/")) _
                        Where Type = New FileInfo(archivo).Extension _
                        Select Nombre = New FileInfo(archivo).Name
        listado.DataSource = archivos
        listado.DataBind()
    End Sub
End Class
