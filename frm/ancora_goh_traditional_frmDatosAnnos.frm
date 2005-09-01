VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Begin VB.Form frmDatosNiveles 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Niveles"
   ClientHeight    =   1485
   ClientLeft      =   45
   ClientTop       =   330
   ClientWidth     =   4680
   Icon            =   "ancora_goh_traditional_frmDatosNiveles.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   1485
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin ACTIVESKINLibCtl.SkinLabel labCantNiveles 
      Height          =   255
      Left            =   4200
      OleObjectBlob   =   "ancora_goh_traditional_frmDatosNiveles.frx":000C
      TabIndex        =   5
      Top             =   240
      Width           =   375
   End
   Begin VB.CommandButton cmdAdd 
      Caption         =   "Agregar"
      Height          =   375
      Left            =   240
      TabIndex        =   4
      Top             =   840
      Width           =   1215
   End
   Begin ACTIVESKINLibCtl.SkinLabel labNiveles 
      Height          =   255
      Left            =   240
      OleObjectBlob   =   "ancora_goh_traditional_frmDatosNiveles.frx":006C
      TabIndex        =   3
      Top             =   240
      Width           =   615
   End
   Begin VB.CommandButton cmdEliminar 
      Caption         =   "Eliminar"
      Height          =   375
      Left            =   1680
      TabIndex        =   2
      Top             =   840
      Width           =   1335
   End
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Terminar"
      Height          =   375
      Left            =   3240
      TabIndex        =   1
      Top             =   840
      Width           =   1335
   End
   Begin VB.ComboBox cboNiveles 
      Height          =   315
      Left            =   960
      Style           =   2  'Dropdown List
      TabIndex        =   0
      Top             =   240
      Width           =   3135
   End
End
Attribute VB_Name = "frmDatosNiveles"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub cmdAdd_Click()
    ancora.addNivel
End Sub

Private Sub cmdCancelar_Click()
    Hide
End Sub

Private Sub cmdEliminar_Click()
    Dim r As Integer
    r = interface.MessageDlg("Eliminar nivel", "Eliminar un nivel significa eliminar todas las brigadas y todas las asignaturas de ese nivel, incluyendo toda la información relacionada con ellas. ¿Está seguro que desea eliminar el nivel " & (cboNiveles.ListIndex + 1) & "?", vbQuestion, "Sí", "No")
    If r = 1 Then
        ancora.deleteNivel cboNiveles.ListIndex + 1
        refresca
    End If
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Public Sub refresca()
    interface.fillCboNiveles cboNiveles
    labCantNiveles.Caption = "" & ancora.cantNiveles
End Sub
