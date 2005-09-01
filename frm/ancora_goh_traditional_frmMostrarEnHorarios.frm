VERSION 5.00
Begin VB.Form frmMostrarEnHorarios 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "¿Qué desea ver en cada casilla de horario?"
   ClientHeight    =   2175
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   8595
   Icon            =   "ancora_goh_traditional_frmMostrarEnHorarios.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2175
   ScaleWidth      =   8595
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton Command2 
      Caption         =   "Cancelar"
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
      Left            =   7320
      TabIndex        =   16
      Top             =   1680
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Aceptar"
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
      Left            =   6120
      TabIndex        =   15
      Top             =   1680
      Width           =   1095
   End
   Begin VB.Frame frameHorarioLugar 
      Caption         =   "Horario de lugar"
      Height          =   1335
      Left            =   5640
      TabIndex        =   10
      Top             =   120
      Width           =   2655
      Begin VB.CheckBox chLug_Asig 
         Caption         =   "Asignatura"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   14
         Top             =   240
         Width           =   1455
      End
      Begin VB.CheckBox chLug_Brg 
         Caption         =   "Brigada"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   13
         Top             =   720
         Width           =   1455
      End
      Begin VB.CheckBox chLug_Clasif 
         Caption         =   "Clasificación de actividad"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   12
         Top             =   480
         Width           =   2295
      End
      Begin VB.CheckBox chLug_Profe 
         Caption         =   "Profesor"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   11
         Top             =   960
         Width           =   1575
      End
   End
   Begin VB.Frame frameHorarioProfesor 
      Caption         =   "Horario de profesor"
      Height          =   1335
      Left            =   2880
      TabIndex        =   5
      Top             =   120
      Width           =   2655
      Begin VB.CheckBox chPro_Asig 
         Caption         =   "Asignatura"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   9
         Top             =   240
         Width           =   1455
      End
      Begin VB.CheckBox chPro_Brg 
         Caption         =   "Brigada"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   8
         Top             =   720
         Width           =   1455
      End
      Begin VB.CheckBox chPro_Clasif 
         Caption         =   "Clasificación de actividad"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   7
         Top             =   480
         Width           =   2175
      End
      Begin VB.CheckBox chPro_Lug 
         Caption         =   "Lugar"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   6
         Top             =   960
         Width           =   1575
      End
   End
   Begin VB.Frame frameHorarioBrigada 
      Caption         =   "Horario de brigada"
      Height          =   1335
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2655
      Begin VB.CheckBox chBrg_Asig 
         Caption         =   "Asignatura"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   4
         Top             =   240
         Width           =   1455
      End
      Begin VB.CheckBox chBrg_Profe 
         Caption         =   "Profesor"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   3
         Top             =   720
         Width           =   1455
      End
      Begin VB.CheckBox chBrg_Clasif 
         Caption         =   "Clasificación de actividad"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   2
         Top             =   480
         Width           =   2175
      End
      Begin VB.CheckBox chBrg_Lugar 
         Caption         =   "Lugar"
         ForeColor       =   &H80000008&
         Height          =   195
         Left            =   120
         TabIndex        =   1
         Top             =   960
         Width           =   1575
      End
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   -360
      X2              =   8640
      Y1              =   1560
      Y2              =   1560
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   -360
      X2              =   8640
      Y1              =   1575
      Y2              =   1575
   End
End
Attribute VB_Name = "frmMostrarEnHorarios"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2250389"
Option Explicit
Private Sub Command1_Click()
    Dim i As Long

    For i = 1 To 3

        With MUESTRA_EN_HORARIO(i)
            .asig = False
            .brg = False
            .clasif = False
            .lugar = False
            .profe = False
        End With

    Next

    With MUESTRA_EN_HORARIO(1)
        If chBrg_Asig.value = 1 Then .asig = True
        If chBrg_Clasif.value = 1 Then .clasif = True
        If chBrg_Lugar.value = 1 Then .lugar = True
        If chBrg_Profe.value = 1 Then .profe = True
        If Not .asig And Not .lugar And Not .profe And Not .clasif Then
            interface.MessageDlg "Seguridad", "Horario de brigada: seleccione por lo menos un dato a ver en las casillas.", vbInformation, "Aceptar"
            Exit Sub
        End If

    End With

    With MUESTRA_EN_HORARIO(2)
        If chPro_Asig.value = 1 Then .asig = True
        If chPro_Clasif.value = 1 Then .clasif = True
        If chPro_Lug.value = 1 Then .lugar = True
        If chPro_Brg.value = 1 Then .brg = True
        If Not .asig And Not .brg And Not .lugar And Not .clasif Then
            interface.MessageDlg "Seguridad", "Horario de profesor: seleccione por lo menos un dato a ver en las casillas.", vbInformation, "Aceptar"
            Exit Sub
        End If

    End With

    With MUESTRA_EN_HORARIO(3)
        If chLug_Asig.value = 1 Then .asig = True
        If chLug_Clasif.value = 1 Then .clasif = True
        If chLug_Brg.value = 1 Then .brg = True
        If chLug_Profe.value = 1 Then .profe = True
        If Not .asig And Not .brg And Not .profe And Not .clasif Then
            interface.MessageDlg "Seguridad", "Horario de lugar: seleccione por lo menos un dato a ver en las casillas.", vbInformation, "Aceptar"
            Exit Sub
        End If

    End With

    Hide
End Sub

Private Sub Command2_Click()
    Hide
End Sub

Private Sub Form_Activate()

    With MUESTRA_EN_HORARIO(1)
        If .asig Then chBrg_Asig.value = 1
        If .clasif Then chBrg_Clasif.value = 1
        If .lugar Then chBrg_Lugar.value = 1
        If .profe Then chBrg_Profe.value = 1
    End With

    With MUESTRA_EN_HORARIO(2)
        If .asig Then chPro_Asig.value = 1
        If .clasif Then chPro_Clasif.value = 1
        If .lugar Then chPro_Lug.value = 1
        If .brg Then chPro_Brg.value = 1
    End With

    With MUESTRA_EN_HORARIO(3)
        If .asig Then chLug_Asig.value = 1
        If .clasif Then chLug_Clasif.value = 1
        If .brg Then chLug_Brg.value = 1
        If .profe Then chLug_Profe.value = 1
    End With

End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
