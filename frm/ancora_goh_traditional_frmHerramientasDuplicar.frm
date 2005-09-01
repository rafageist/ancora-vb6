VERSION 5.00
Begin VB.Form frmHerramientasDuplicar 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Duplicar información"
   ClientHeight    =   5745
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5565
   Icon            =   "ancora_goh_traditional_frmHerramientasDuplicar.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   5745
   ScaleWidth      =   5565
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command1 
      Caption         =   "Terminar"
      BeginProperty Font 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3960
      TabIndex        =   6
      Top             =   5160
      Width           =   1455
   End
   Begin VB.Frame Frame1 
      Caption         =   "Todo acerca de un período"
      Height          =   4935
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5295
      Begin VB.CommandButton Command3 
         Caption         =   "Duplicar"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   9
         Top             =   4320
         Width           =   4815
      End
      Begin VB.CommandButton Command5 
         Caption         =   "Quitar selección"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   2760
         TabIndex        =   8
         Top             =   3840
         Width           =   2295
      End
      Begin VB.CommandButton Command4 
         Caption         =   "Seleccionar todos"
         BeginProperty Font 
            Name            =   "Verdana"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   375
         Left            =   240
         TabIndex        =   7
         Top             =   3840
         Width           =   2415
      End
      Begin VB.ListBox List1 
         ForeColor       =   &H00000000&
         Height          =   2760
         ItemData        =   "ancora_goh_traditional_frmHerramientasDuplicar.frx":021E
         Left            =   240
         List            =   "ancora_goh_traditional_frmHerramientasDuplicar.frx":0220
         Style           =   1  'Checkbox
         TabIndex        =   5
         Top             =   960
         Width           =   4815
      End
      Begin VB.ComboBox Combo2 
         Height          =   315
         Left            =   3000
         Style           =   2  'Dropdown List
         TabIndex        =   3
         Top             =   480
         Width           =   2055
      End
      Begin VB.ComboBox Combo1 
         Height          =   315
         Left            =   240
         Style           =   2  'Dropdown List
         TabIndex        =   1
         Top             =   480
         Width           =   2055
      End
      Begin VB.Label Label2 
         BackStyle       =   0  'Transparent
         Caption         =   "Período destino"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   3480
         TabIndex        =   4
         Top             =   240
         Width           =   1215
      End
      Begin VB.Label Label1 
         BackStyle       =   0  'Transparent
         Caption         =   "Período origen"
         ForeColor       =   &H00000000&
         Height          =   255
         Left            =   720
         TabIndex        =   2
         Top             =   240
         Width           =   1215
      End
   End
End
Attribute VB_Name = "frmHerramientasDuplicar"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2260326"
Option Explicit
Private Sub Command1_Click()
    Hide
End Sub

Private Sub Combo1_Change()
    DUPLICAR_PER1 = Combo1.ListIndex + 1
End Sub

Private Sub Combo2_Change()
    DUPLICAR_PER2 = Combo2.ListIndex + 1
End Sub

Private Sub Command3_Click()
    Dim i As Long, r As Variant
    If Combo1.ListIndex = Combo2.ListIndex Then
        interface.MessageDlg "No se puede continuar", "No seleccione dos períodos iguales", vbExclamation, "Aceptar"
        Exit Sub
    End If

    If Combo1.ListIndex = -1 Then
        interface.MessageDlg "No se puede continuar", "Selecciones el período de origen", vbExclamation, "Aceptar"
        Exit Sub
    End If

    If Combo2.ListIndex = -1 Then
        interface.MessageDlg "No se puede continuar", "Selecciones el período de destino", vbExclamation, "Aceptar"
        Exit Sub
    End If

    r = interface.MessageDlg("Seguridad", "Los cambios que realizará no pueden deshacerse, " + Chr(13) + "al menos que no guarde el archivo y cierre la aplicación. " + Chr(13) + "¿Está seguro que desea duplicar la información?", vbQuestion, "No", "Sí")
    If r = 2 Then
        DUPLICAR_PER1 = Combo1.ListIndex + 1
        DUPLICAR_PER2 = Combo2.ListIndex + 1
        If (List1.Selected(10) Or List1.Selected(11) Or List1.Selected(12) Or List1.Selected(13)) And Not List1.Selected(6) Then
            r = interface.MessageDlg("Duplicando información", "Duplicar los Profesores por actividad, los Lugares por Actividad o Asignaciones de actividades, " & Chr(13) & "implica duplicar el Desglose de actividades. " & Chr(13) & Chr(13) & "Se duplicará automáticamente esta información. " & Chr(13) & Chr(13) & " ¿Desea continuar de todas formas?", vbQuestion, "No", "Sí")
            If r = 2 Then
                List1.Selected(6) = True
            Else
                Exit Sub
            End If

        End If

        Dim info As TFiltro

        For i = 1 To List1.ListCount
            If List1.Selected(i - 1) Then
                info.cant = info.cant + 1
                ReDim Preserve info.id(info.cant)
                info.id(info.cant) = i
            End If

        Next

        duplicar DUPLICAR_PER1, DUPLICAR_PER2, info
        r = interface.MessageDlg("Proceso terminado", "¿Desea guardar los cambios efectuados?", vbQuestion, "No", "Sí")
        If r = 2 Then ancora.GuardarTodo
    End If

End Sub

Private Sub Command4_Click()
    Dim i As Long

    For i = 1 To List1.ListCount
        List1.Selected(i - 1) = True
    Next

End Sub

Private Sub Command5_Click()
    Dim i As Long

    For i = 1 To List1.ListCount
        List1.Selected(i - 1) = False
    Next

End Sub

Public Sub refre()  'refrescamiento
    Dim i As Long
    Combo1.clear
    Combo2.clear

    For i = 1 To ancora.periodos.Count
        Combo1.AddItem "(" + kernel.utils.trunca(ancora.periodos(i).id) + ") " + kernel.utils.trunca(ancora.periodos(i).descrip)
        Combo2.AddItem "(" + kernel.utils.trunca(ancora.periodos(i).id) + ") " + kernel.utils.trunca(ancora.periodos(i).descrip)
    Next

End Sub

Private Sub Form_Activate()
    refre
    Combo1.ListIndex = DUPLICAR_PER1 - 1
    Combo2.ListIndex = DUPLICAR_PER2 - 1
    
    List1.AddItem "Restricciones del período"
    List1.AddItem "Restricciones de las especialidades"
    List1.AddItem "Restricciones de las clasificaciones de actividades"
    List1.AddItem "Zonas de prioridad de las clasificaciones de actividades"
    List1.AddItem "Restricciones de las brigadas"
    List1.AddItem "Restricciones de las asignaturas"
    List1.AddItem "Desglose de actividades"
    List1.AddItem "Restricciones de los profesores"
    List1.AddItem "Restricciones de los lugares"
    List1.AddItem "Restricciones de los Otros recursos"
    List1.AddItem "Profesores por actividad"
    List1.AddItem "Lugares por actividad"
    List1.AddItem "Otros recursos por actividad"
    List1.AddItem "Asignaciones de actividades"

End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
