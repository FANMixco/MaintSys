Partial Class Web_Grid
    Inherits System.Web.UI.Page
    Dim Conn As New MySQLServerConnection()

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Welcome.Text = "<h2>Reporte de Actividad"
        If Session("User") = String.Empty Then Response.Redirect("/MaintSys/Default.aspx")
        Dim Id As String = Request.QueryString("Ver")
        Dim SQL As String = "SELECT MS.IdUser, C.Classroom + ISNULL(dbo.MType(MS.IdMaintenance_Schedule), '') + ISNULL(': '+Works,'') + ISNULL(', ' + dbo.Ch_Equipment(MS.IdMaintenance_Schedule), '') AS Classroom, " _
                                + " MS.M_State, CASE WHEN MS.IdAssigned_User IS NULL " _
                                + " THEN 'NO EXISTE AUN REPORTE' ELSE ('<b>Usuario:</b> ' + MS.IdAssigned_User + '<br />' + ISNULL(CAST(MSD.Extra AS varchar), '')) END AS Detail," _
                                + " ISNULL(CAST(M_Start_Date AS varchar)+'-'+CAST(M_Ending_Date AS varchar),'AUN NO ASIGNADA') AS Date_Time" _
                                + " FROM dbo.Maintenance_Schedule AS MS LEFT OUTER JOIN" _
                                + " dbo.Maintenance_Schedule_Detail AS MSD ON MSD.IdMaintenance_Schedule = MS.IdMaintenance_Schedule INNER JOIN" _
                                + " dbo.Users AS U ON MS.IdUser = U.IdUser INNER JOIN" _
                                + " dbo.Classrooms AS C ON MS.IdClassroom = C.IdClassroom LEFT OUTER JOIN" _
                                + " dbo.Maintenance_Type AS MT ON MS.IdMaintenance_Type = MT.IdMaintenance_Type"
        With Conn
            If Not Id = String.Empty Then
                SQL += " WHERE MS.IdMaintenance_Schedule=" + Id
                Welcome.Text += "</h2><hr />"
            Else
                Dim FechaIni As String
                Dim FechaFin As String
                If String.IsNullOrEmpty(Request.QueryString("FechaIni")) Or String.IsNullOrEmpty(Request.QueryString("FechaFin")) Then
                    FechaIni = Request.QueryString("Fecha")
                    FechaFin = Request.QueryString("Fecha")
                    Welcome.Text += " de la fecha " + FechaIni + "</h2><hr />"
                Else
                    FechaIni = Request.QueryString("FechaIni")
                    FechaFin = Request.QueryString("FechaFin")
                    Welcome.Text += " de " + Request.QueryString("FechaIni") + " al " + Request.QueryString("FechaFin") + "</h2><hr />"
                End If
                SQL += " WHERE MS.M_Start_Date BETWEEN '" + FechaIni + " 00:00' AND '" + FechaFin + " 23:59'"
            End If
            Maintenance_Schedule.DataSource = .Get_DB_Source(SQL)
            Maintenance_Schedule.DataBind()
        End With
    End Sub
End Class
