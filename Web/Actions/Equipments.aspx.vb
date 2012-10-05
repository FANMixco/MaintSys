
Partial Class Web_Equipments
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
        Dim Cnn As New MySQLServerConnection
        With Cnn
            Try
                .Add_Param("Name", Equipment.Text)
                .Add_Param("Type", IdEquipment_Type.SelectedValue)
                .Add_Param("Producer", IdEquipment_Producer.SelectedValue)
                .Add_Param("Classroom", IdClassroom.SelectedValue)
                .Add_Param("Tech_Specification", Tech_Specification.Text)
                .Add_Param("Comments", Comments.Text)
                .Add_Param("State", State.SelectedValue)
                If IdEquipment.Value = String.Empty Then
                    .Exec_Proc("p_equipments 1, 0, @Type, @Producer, @Classroom, @Name, @Tech_Specification, @Comments, @State")
                    lblErr.Text = "<h4 class='notify1'>El distribuidor de equipo fue ingresado con exito.</h4>"
                Else
                    .Add_Param("IdEquip", IdEquipment.Value)
                    .Exec_Proc("p_equipments 0, @IdEquip, @Type, @Producer, @Classroom, @Name, @Tech_Specification, @Comments, @State")
                    lblErr.Text = "<h4 class='notify1'>El distribuidor de equipo fue actualizado con exito.</h4>"
                End If
            Catch ex As Exception
                lblErr.Text = "<h4 class='notify3'>La información no pudo ser ingresada intente en otro momento.</h4>"
            End Try
        End With
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Session("User") = String.Empty Or Session("Level") = "Empleado" Then
                Response.Redirect("/MaintSys/default.aspx")
            End If
            Dim Cnn As New MySQLServerConnection
            Dim IdVal As String = Request.QueryString("Edit")
            Dim i As Integer
            With Cnn
                .Get_DB_Data("SELECT * FROM Equipment_Type")
                IdEquipment_Type.Items.Clear()
                While .Data.Read
                    IdEquipment_Type.Items.Add(New ListItem(.Data(1), .Data(0)))
                End While

                .Get_DB_Data("SELECT * FROM Equipment_Producer")
                IdEquipment_Producer.Items.Clear()
                While .Data.Read
                    IdEquipment_Producer.Items.Add(New ListItem(.Data(1), .Data(0)))
                End While

                .Get_DB_Data("SELECT * FROM Classrooms")
                IdClassroom.Items.Clear()
                While .Data.Read
                    IdClassroom.Items.Add(New ListItem(.Data(1), .Data(0)))
                End While

                If Not IdVal = String.Empty Then
                    IdEquipment.Value = Request.QueryString("Edit")
                    Button1.Text = "Actualizar"
                    .Add_Param("IdVal", IdVal)
                    .Get_DB_Data("SELECT * FROM Equipments WHERE IdEquipment=@IdVal")
                    .Data.Read()
                    Equipment.Text = .Data(4).ToString
                    Tech_Specification.Text = .Data(5).ToString
                    Comments.Text = .Data(6).ToString
                    For i = 0 To IdEquipment_Type.Items.Count() - 1
                        If IdEquipment_Type.Items(i).Value.Equals(.Data(1)) Then IdEquipment_Type.Items(i).Selected = True
                    Next

                    For i = 0 To IdEquipment_Producer.Items.Count() - 1
                        If IdEquipment_Producer.Items(i).Value.Equals(.Data(2)) Then IdEquipment_Producer.Items(i).Selected = True
                    Next

                    For i = 0 To IdClassroom.Items.Count() - 1
                        If IdClassroom.Items(i).Value.Equals(.Data(3)) Then IdClassroom.Items(i).Selected = True
                    Next

                    For i = 0 To State.Items.Count() - 1
                        If State.Items(i).Value.Equals(.Data(7)) Then State.Items(i).Selected = True
                    Next
                Else
                    Button1.Text = "Agregar"
                    Equipment.Text = String.Empty
                    Tech_Specification.Text = String.Empty
                    Comments.Text = String.Empty
                End If
            End With
        End If
    End Sub
End Class
