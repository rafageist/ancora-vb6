VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "libStrings"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

Public Function cantChar(a As String, c As String) As Long

    Dim i As Long, cant As Long

    For i = 1 To Len(a)
        If Mid(a, i, 1) = c Then cant = cant + 1
    Next

    cantChar = cant
End Function

Public Function cantsubcadenas(a As String, c As String) As Long

    Dim ss As String
    ss = Trim(a)
    If ss = "" Then Exit Function
    If Mid(ss, Len(ss), 1) <> c Then ss = ss + c
    cantsubcadenas = cantChar(ss, c)
End Function

Public Function subcadena(s As String, n As Long, ch As String) As String

    Dim ss As String, k As Long, j As Long
    ss = Trim(s)
    If ss = "" Then
        subcadena = ""
        Exit Function
    End If

    If Mid(ss, Len(ss), 1) <> ch Then ss = ss + ch
    k = 0
    While InStr(1, ss, ch) <> 0
        j = InStr(1, ss, ch)
        k = k + 1
        If k = n Then
            subcadena = Mid(ss, 1, j - 1)
            Exit Function
        End If

        ss = Mid(ss, j + 1)
    Wend
End Function

Public Function BoolToStr(b As Boolean) As String
    BoolToStr = "False"
    If b Then BoolToStr = "True"
End Function

Public Function DepuraText(ByVal s As String) As String
    If Trim(s) = "" Then
        DepuraText = Chr(34) + Chr(34)
    Else
        If Mid(Trim(s), 1, 1) <> Chr(34) Then
            DepuraText = Chr(34) & s & Chr(34)
        Else
            DepuraText = s
        End If

    End If

End Function

Public Function DepuraComillas(ByVal s As String) As String
    Dim i As Long, k As Long
    If s <> "" Then
        If Mid(s, 1, 1) = Chr(34) Then i = 2 Else i = 1
        k = Len(s) - i
        DepuraComillas = Replace(s, Chr(34), Chr(34) + "+chr(34)+" + Chr(34), i, k, vbTextCompare)
    Else
        DepuraComillas = s
    End If

End Function

Public Function DepuraEnters(ByVal s As String) As String
    s = Replace(s, Chr(13), " ")
    DepuraEnters = Replace(s, Chr(10), " ")
End Function

Public Function PicaString(ByVal s As String) As String
    Dim ss As String, max As Long, cct As Long
    max = 180
    If Len(s) < max Then
        PicaString = s
        Exit Function
    End If

    If Mid(s, 1, 1) = Chr(34) Then s = Mid(s, 2)
    If Mid(s, Len(s), 1) = Chr(34) Then s = Mid(s, 1, Len(s) - 1)
    ss = ""
    While Len(s) > max
        If Mid(s, max + 1, 1) = Chr(34) Then cct = max + 1 Else cct = max
        ss = ss + Chr(34) + DepuraComillas(Mid(s, 1, cct)) + Chr(34) + " & _ " + Chr(13) + Chr(10)
        If cct + 1 <= Len(s) Then s = Mid(s, cct + 1)
    Wend
    ss = ss + Chr(34) + DepuraComillas(s) + Chr(34)
    PicaString = ss
End Function

Public Function StrToBool(s As String) As Boolean
    s = LCase(Trim(s))
    StrToBool = (s = "true")
End Function

Public Function namevar(ByVal s As String) As String
    s = Trim(s)
    s = Replace(s, " ", "_")
    s = Replace(s, "{", "_")
    s = Replace(s, "}", "_")
    s = Replace(s, "-", "_")
    If Asc(Mid(s, 1, 1)) >= Asc("0") And Asc(Mid(s, 1, 1)) <= Asc("9") Then s = "_" + s
    namevar = s
End Function

Public Function BuscaSubCadena(s As String, s1 As String, ch As String) As Long
    Dim i As Long

    For i = 1 To cantsubcadenas(s, ch)
        If s1 = subcadena(s, i, ch) Then
            BuscaSubCadena = i
            Exit Function
        End If

    Next

    BuscaSubCadena = 0
End Function

Public Function subcadenasIguales(s1 As String, s2 As String, ch As String, ByRef m As Long) As Long
    Dim i As Long, c As Long, cc As Long
    Dim a As Long, b As Long
    a = cantsubcadenas(s1, ch)
    b = cantsubcadenas(s2, ch)
    c = a
    If a > b Then c = b 'c = min(a,b)
    
    cc = 0

    For i = 1 To c
        If subcadena(s1, i, ch) = subcadena(s2, i, ch) Then cc = cc + 1
    Next
    
    a = cantsubcadenas(s1, ch)
    b = cantsubcadenas(s2, ch)
    m = a
    If a < b Then m = b 'm = max(a,b)
    
    subcadenasIguales = cc
End Function

Public Function cantCharIgual(s1 As String, s2 As String) As Long
    Dim i As Long, j As Long, k As Long
    Dim a As Long, b As Long
    j = 0
    
    a = Len(s1)
    b = Len(s2)
    k = a
    
    If a > b Then k = b 'k= min(a,b)

    For i = 1 To k
        If Mid(s1, i, 1) = Mid(s2, i, 1) Then j = j + 1
    Next

    cantCharIgual = j
End Function

Public Function QuitaSpanish(s As String) As String
    QuitaSpanish = Sustituye(s, "·ÈÌÛ˙¡…Õ”⁄Ò—¸‹", "aeiouAEIOUnNuU")
End Function

Public Function QuitaDobleEspacios(s As String) As String
    s = kernel.utils.trunca(s)
    While InStr(1, s, "  ") <> 0
        s = Replace(s, "  ", " ")
    Wend
    QuitaDobleEspacios = s
End Function

Public Function Sustituye(ByVal s As String, c1 As String, c2 As String) As String
    Dim i As Long, j As Long

    For i = 1 To Len(c1)
        s = Replace(s, Mid(c1, i, 1), Mid(c2, i, 1))
    Next

    Sustituye = s
End Function

Public Function picaPrimerasubcadena(ByRef cadena As String, Optional ch As String = ",", Optional ByVal pica As Boolean = True) As String
    Dim p As Long
    p = InStr(1, cadena, ",")
    If p > 0 Then
        picaPrimerasubcadena = Mid(cadena, 1, p - 1)
        If pica Then
            cadena = Mid(cadena, p + 1)
        End If
        Exit Function
    Else
        picaPrimerasubcadena = kernel.utils.trunca(cadena)
        cadena = ""
    End If

End Function
