
Partial Class Web_Actions_Maintenance_Schedule_Detail
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("User") = String.Empty Then
            Response.Redirect("/MaintSys/default.aspx")
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Add_Param("Id", Request.QueryString("Edit"))
                .Add_Param("Detail", Detail.Content.ToString)
                .Exec_Proc("p_maintenance_schedule @Id, @Detail")
                Try
                    .Add_Param("Id", Request.QueryString("Edit"))
                    .Add_Param("State", "Completado")
                    .Exec_Query("UPDATE Maintenance_Schedule SET M_State=@State WHERE IdMaintenance_Schedule=@Id")
                    lblErr.Text = "<h4 class=notify1>La información fue agregada con exito, se redireccionara en 5s.</h4>"
                Catch ex As Exception
                    lblErr.Text = "<h4 class=notify3>Error en actualizar el estado.</h4>"
                End Try
                .Close()
                Timer1.Enabled = True
            Catch ex As Exception
                lblErr.Text = "<h4 class=notify3>Error al agregar los detalles del mantenimiento.</h4>"
            End Try
        End With
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As System.EventArgs) Handles Timer1.Tick
        Response.Redirect("~/Web/Default.aspx?Adm=Maintenance_Schedule")
    End Sub
End Class
