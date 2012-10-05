
Partial Class Web_Actions_Equipment_Producer
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Add_Param("Name", Equipment_Producer.Text)
                If IdEquipment_Producer.Value = String.Empty Then
                    .Exec_Proc("p_equipment_producer 1, 0, @Name")
                    lblErr.Text = "<h4 class='notify1'>El distribuidor de equipo fue ingresado con exito.</h4>"
                Else
                    .Add_Param("Id", IdEquipment_Producer.Value)
                    .Exec_Proc("p_equipment_producer 0, @Id, @Name")
                    lblErr.Text = "<h4 class='notify1'>El distribuidor de equipo fue actualizado con exito.</h4>"
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
            IdEquipment_Producer.Value = Request.QueryString("Edit")
            Button1.Text = "Actualizar"
            With Cnn
                .Add_Param("IdVal", IdVal)
                .Get_DB_Data("SELECT * FROM Equipment_Producer WHERE IdEquipment_Producer=@IdVal")
                .Data.Read()
                Equipment_Producer.Text = .Data(1)
            End With
        Else
            Button1.Text = "Agregar"
            Equipment_Producer.Text = String.Empty
        End If
        Cnn.Close()
    End Sub
End Class
