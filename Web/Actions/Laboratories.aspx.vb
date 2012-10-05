
Partial Class Web_Laboratories
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Add_Param("Name", Laboratory.Text)
                .Add_Param("IdBuilding", Building.SelectedValue)
                If IdLaboratory.Value = String.Empty Then
                    .Exec_Proc("p_laboratories 1, 0, @Name, @IdBuilding")
                    lblErr.Text = "<h4 class='notify1'>El laboratorio fue ingresado con exito.</h4>"
                Else
                    .Add_Param("IdLab", IdLaboratory.Value)
                    .Exec_Proc("p_laboratories 0, @IdLab, @Name, @IdBuilding")
                    lblErr.Text = "<h4 class='notify1'>El laboratorio fue actualizado con exito.</h4>"
                End If
            Catch ex As Exception
                lblErr.Text = "<h4 class='notify3'>La información no pudo ser ingresada intente en otro momento.</h4>"
            End Try
        End With
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Session("User") = String.Empty Or Session("Level") = "Empleado" Or Session("Level") = "Jefe de Departamento" Then
            Response.Redirect("/MaintSys/default.aspx")
        End If
        Dim Cnn As New MySQLServerConnection
        Dim IdVal As String = Request.QueryString("Edit")
        Dim i As Integer
        With Cnn
            .Get_DB_Data("SELECT * FROM Buildings")
            Building.Items.Clear()
            While .Data.Read
                Building.Items.Add(New ListItem(.Data(1), .Data(0)))
            End While

            If Not IdVal = String.Empty Then
                IdLaboratory.Value = Request.QueryString("Edit")
                Button1.Text = "Actualizar"
                .Add_Param("IdVal", IdVal)
                .Get_DB_Data("SELECT * FROM Laboratories WHERE IdLaboratory=@IdVal")
                .Data.Read()
                Laboratory.Text = .Data(1)
                For i = 0 To Building.Items.Count() - 1
                    If Building.Items(i).Value.Equals(.Data(2)) Then Building.Items(i).Selected = True
                Next
            Else
                Button1.Text = "Agregar"
            End If
            Cnn.Close()
        End With
    End Sub
End Class
