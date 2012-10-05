
Partial Class Web_Actions_Classrooms
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Add_Param("Name", Classroom.Text)
                .Add_Param("IdLab", IdLaboratory.SelectedValue)
                If IdClassroom.Value = String.Empty Then
                    .Exec_Proc("p_classroom 1, 0, @Name, @IdLab")
                    lblErr.Text = "<h4 class='notify1'>El edificio fue ingresado con exito.</h4>"
                Else
                    .Add_Param("Id", IdClassroom.Value)
                    .Exec_Proc("p_classroom 0, @Id, @Name, @IdLab")
                    lblErr.Text = "<h4 class='notify1'>El edificio fue actualizado con exito.</h4>"
                End If
            Catch ex As Exception
                lblErr.Text = "<h4 class='notify3'>La información no pudo ser ingresada intente en otro momento.</h4>"
            End Try
            .Close()
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
            .Get_DB_Data("SELECT * FROM Laboratories")
            IdLaboratory.Items.Clear()
            While .Data.Read
                IdLaboratory.Items.Add(New ListItem(.Data(1), .Data(0)))
            End While
            If Not IdVal = String.Empty Then
                IdClassroom.Value = Request.QueryString("Edit")
                Button1.Text = "Actualizar"
                .Add_Param("IdVal", IdVal)
                .Get_DB_Data("SELECT * FROM Classrooms WHERE IdClassroom=@IdVal")
                .Data.Read()
                Classroom.Text = .Data(1)
                For i = 0 To IdLaboratory.Items.Count() - 1
                    If IdLaboratory.Items(i).Value.Equals(.Data(2)) Then IdLaboratory.Items(i).Selected = True
                Next
            Else
                Classroom.Text = String.Empty
                Button1.Text = "Agregar"
            End If
            Cnn.Close()
        End With
    End Sub
End Class
