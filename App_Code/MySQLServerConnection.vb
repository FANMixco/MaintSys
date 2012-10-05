Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Configuration.ConfigurationManager

Public Class MySQLServerConnection
    Private MSSqlCn As SqlConnection
    Private Query As SqlCommand
    Public Data As SqlDataReader
    Private Parameters As SqlParameterCollection
    Private Source As SqlDataSource
    Private ConnString As String

    Public Sub New()
        ConnString = ConnectionStrings("MaintSysConnectionString").ConnectionString
        MSSqlCn = New SqlConnection(ConnString)
        Try
            MSSqlCn.Open()
            Query = New SqlCommand
            Query.Connection = MSSqlCn
        Catch ex As Exception
            MsgBox("Imposible de conectar con la base de datos seleecionada.", MsgBoxStyle.OkOnly, "Error")
        End Try
    End Sub

    Protected Overrides Sub Finalize()

    End Sub

    Public Sub Close()
        MSSqlCn.Close()
    End Sub

    Public Sub Add_Param(ByVal Name As String, ByRef Value As Object)
        Query.Parameters.Add(New SqlParameter(Name, Value))
    End Sub

    Public Function Exec_Query(ByVal SQL_Sentence As String) As Integer
        Dim result As Integer
        Call Liberar()
        Query.CommandText = SQL_Sentence
        result = Query.ExecuteNonQuery
        Query.Parameters.Clear()
        Return result
    End Function

    Public Sub Exec_Proc(ByVal Proc As String)
        Proc = "Exec dbo." + Proc
        Exec_Query(Proc)
    End Sub

    Public Function Exec_Func(ByVal Func As String) As String
        Func = "MaintSys.dbo.Select " + Func + ";"
        Return Exec_Query(Func)
    End Function

    Public Sub Get_DB_Data(ByVal SQL_Sentence As String)
        Call Liberar()
        Query.CommandText = SQL_Sentence
        Data = Query.ExecuteReader
        Query.Parameters.Clear()
    End Sub

    Public Function Get_DB_Val(ByVal SQL_Sentence As String) As Object
        Call Liberar()
        Query.CommandText = SQL_Sentence
        Return Query.ExecuteScalar
    End Function

    Public Function Get_DB_Source(ByVal SQL_Sentence As String) As SqlDataSource
        Source = New SqlDataSource(ConnString, SQL_Sentence)
        Return Source
    End Function

    Private Sub Liberar()
        Try
            If Data.IsClosed = False Then Data.Close()
        Catch ex As Exception

        End Try
    End Sub
End Class
