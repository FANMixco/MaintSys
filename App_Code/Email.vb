Imports Microsoft.VisualBasic
Imports System.Web.Mail

Public Class Email
    'Clase para enviar correos electrónicos
    Private Email_From, Email_To, Subject, Body As String


    Public Sub New(ByVal EF As String, ByVal ET As String, Optional ByVal S As String = "", Optional ByVal B As String = "")
        Email_From = EF
        Email_To = ET
        Subject = S
        Body = B
    End Sub

    Public Function Enviar() As String
        Dim correo As New System.Net.Mail.MailMessage()

        correo.From = New System.Net.Mail.MailAddress(Email_From)
        correo.To.Add(Email_To)
        correo.Subject = Subject
        correo.Body = Body
        'Establece en TRUE si vas a enviar codigo HTML
        correo.IsBodyHtml = True
        'Prioridad del Correo Alta, Baja, Normal
        correo.Priority = System.Net.Mail.MailPriority.Normal

        Dim smtp As New System.Net.Mail.SmtpClient

        '---------------------------------------------
        ' Estos datos debes rellanarlos correctamente
        '---------------------------------------------
        smtp.Host = "servidor.de.correo_o_Exchange"
        'Indicar el puerto en caso de que no sea el Standard (25)
        'smtp.Port = "###"
        smtp.Credentials = New System.Net.NetworkCredential("usuario", "password")
        'Establece en True Cuando el Servidor Requiere una conexion segura
        smtp.EnableSsl = False

        Try
            smtp.Send(correo)
            Return "Mensaje enviado satisfactoriamente"
        Catch ex As Exception
            Return "ERROR: " & ex.Message
        End Try
    End Function

End Class
