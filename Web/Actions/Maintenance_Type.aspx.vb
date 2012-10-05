
Partial Class Web_Actions_Maintenance_Type
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Add_Param("Name", Maintenance_Work.Text)
                .Add_Param("Detail", Detail.Content.ToString)
                If IdMaintenance_Work.Value = String.Empty Then
                    .Exec_Proc("p_maintenance_type 1, 0, @Name, @Detail")
                    lblErr.Text = "<h4 class='notify1'>El tipo de mantenimiento fue ingresado con exito.</h4>"
                Else
                    .Add_Param("Id", IdMaintenance_Work.Value)
                    .Exec_Proc("p_maintenance_type 0, @Id, @Name, @Detail")
                    lblErr.Text = "<h4 class='notify1'>El tipo de mantenimiento fue actualizado con exito.</h4>"
                End If
            Catch ex As Exception
                lblErr.Text = "<h4 class='notify3'>La información no pudo ser ingresada intente en otro momento.</h4>"
            End Try
        End With
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("User") = String.Empty Or Session("Level") = "Empleado" Then
            Response.Redirect("/MaintSys/default.aspx")
        End If
        Dim Cnn As New MySQLServerConnection
        Dim IdVal As String = Request.QueryString("Edit")
        If Not IdVal = String.Empty Then
            IdMaintenance_Work.Value = Request.QueryString("Edit")
            Button1.Text = "Actualizar"
            With Cnn
                .Add_Param("IdVal", IdVal)
                .Get_DB_Data("SELECT * FROM Maintenance_Type WHERE IdMaintenance_Type=@IdVal")
                .Data.Read()
                Maintenance_Work.Text = .Data(1)
                Detail.Content = .Data(2)
            End With
        Else
            Button1.Text = "Agregar"
            Maintenance_Work.Text = String.Empty
            Detail.Content = String.Empty
        End If
        Cnn.Close()
    End Sub
End Class
