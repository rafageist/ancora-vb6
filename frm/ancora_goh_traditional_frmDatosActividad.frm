VERSION 5.00
Object = "{90F3D7B3-92E7-44BA-B444-6A8E2A3BC375}#1.0#0"; "actskin4.ocx"
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}#1.0#0"; "msflxgrd.ocx"
Begin VB.Form frmDatosActividad 
   Caption         =   "Editando la actividad"
   ClientHeight    =   7845
   ClientLeft      =   60
   ClientTop       =   405
   ClientWidth     =   8805
   Icon            =   "ancora_goh_traditional_frmDatosActividad.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   7845
   ScaleWidth      =   8805
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdDelete 
      Caption         =   "Eliminar la actividad"
      Height          =   375
      Left            =   120
      TabIndex        =   26
      Top             =   7440
      Width           =   1695
   End
   Begin MSComctlLib.ImageList imgList 
      Left            =   3240
      Top             =   7320
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   2
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosActividad.frx":000C
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmDatosActividad.frx":0772
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.CommandButton cmdCancelar 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   7440
      TabIndex        =   8
      Top             =   7440
      Width           =   1335
   End
   Begin VB.CommandButton cmdAceptar 
      Caption         =   "Aceptar"
      Height          =   375
      Left            =   5880
      TabIndex        =   7
      Top             =   7440
      Width           =   1455
   End
   Begin VB.Frame frameCambios 
      Caption         =   "Cambios posibles"
      Height          =   4455
      Left            =   0
      TabIndex        =   1
      Top             =   2880
      Width           =   8775
      Begin VB.CheckBox chkFija 
         Caption         =   "Fija"
         Height          =   195
         Left            =   4920
         TabIndex        =   27
         Top             =   4080
         Width           =   855
      End
      Begin ACTIVESKINLibCtl.SkinLabel labRecursos 
         Height          =   255
         Left            =   4920
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":0D88
         TabIndex        =   10
         Top             =   1320
         Width           =   1455
      End
      Begin MSComctlLib.ListView lvwRecursos 
         Height          =   2415
         Left            =   4920
         TabIndex        =   9
         Top             =   1560
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   4260
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         Checkboxes      =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "imgList"
         SmallIcons      =   "imgList"
         ColHdrIcons     =   "imgList"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin VB.ComboBox cboLugar 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   6
         Top             =   840
         Width           =   2775
      End
      Begin ACTIVESKINLibCtl.SkinLabel labLugar 
         Height          =   255
         Left            =   5280
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":0E04
         TabIndex        =   5
         Top             =   840
         Width           =   495
      End
      Begin VB.ComboBox cboProfesor 
         Height          =   315
         Left            =   5880
         Style           =   2  'Dropdown List
         TabIndex        =   4
         Top             =   360
         Width           =   2775
      End
      Begin ACTIVESKINLibCtl.SkinLabel labProfesor 
         Height          =   255
         Left            =   5160
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":0E6E
         TabIndex        =   3
         Top             =   360
         Width           =   615
      End
      Begin VB.Frame frameCambioTurno 
         Caption         =   "Turno"
         Height          =   4095
         Left            =   120
         TabIndex        =   2
         Top             =   240
         Width           =   4695
         Begin MSFlexGridLib.MSFlexGrid tablaPosiblesInicios 
            Height          =   3735
            Left            =   120
            TabIndex        =   11
            Top             =   240
            Width           =   4455
            _ExtentX        =   7858
            _ExtentY        =   6588
            _Version        =   393216
         End
      End
   End
   Begin VB.Frame frameInformacion 
      Caption         =   "Información de la actividad"
      Height          =   2775
      Left            =   0
      TabIndex        =   0
      Top             =   0
      Width           =   8775
      Begin MSComctlLib.ListView lvwBrigadas 
         Height          =   2055
         Left            =   4920
         TabIndex        =   25
         Top             =   600
         Width           =   3735
         _ExtentX        =   6588
         _ExtentY        =   3625
         View            =   3
         LabelEdit       =   1
         LabelWrap       =   -1  'True
         HideSelection   =   -1  'True
         FullRowSelect   =   -1  'True
         GridLines       =   -1  'True
         _Version        =   393217
         Icons           =   "imgList"
         SmallIcons      =   "imgList"
         ColHdrIcons     =   "imgList"
         ForeColor       =   -2147483640
         BackColor       =   -2147483643
         BorderStyle     =   1
         Appearance      =   1
         NumItems        =   0
      End
      Begin ACTIVESKINLibCtl.SkinLabel labBrigadas 
         Height          =   255
         Left            =   4920
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":0EDE
         TabIndex        =   24
         Top             =   360
         Width           =   3495
      End
      Begin ACTIVESKINLibCtl.SkinLabel edtGrupo 
         Height          =   255
         Left            =   2280
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":0F84
         TabIndex        =   23
         Top             =   2160
         Width           =   615
      End
      Begin ACTIVESKINLibCtl.SkinLabel labGrupo 
         Height          =   255
         Left            =   240
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":0FE4
         TabIndex        =   22
         Top             =   2160
         Width           =   1815
      End
      Begin ACTIVESKINLibCtl.SkinLabel edtNumero 
         Height          =   255
         Left            =   2280
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":1072
         TabIndex        =   21
         Top             =   1440
         Width           =   615
      End
      Begin ACTIVESKINLibCtl.SkinLabel labNumero 
         Height          =   255
         Left            =   360
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":10D2
         TabIndex        =   20
         Top             =   1440
         Width           =   1695
      End
      Begin ACTIVESKINLibCtl.SkinLabel edtClasif 
         Height          =   255
         Left            =   2280
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":1158
         TabIndex        =   19
         Top             =   1800
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel labClasif 
         Height          =   255
         Left            =   1080
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":11C4
         TabIndex        =   18
         Top             =   1800
         Width           =   975
      End
      Begin ACTIVESKINLibCtl.SkinLabel edtFecha 
         Height          =   255
         Left            =   2280
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":123E
         TabIndex        =   17
         Top             =   360
         Width           =   2295
      End
      Begin ACTIVESKINLibCtl.SkinLabel labFecha 
         Height          =   255
         Left            =   120
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":12C6
         TabIndex        =   16
         Top             =   360
         Width           =   1935
      End
      Begin ACTIVESKINLibCtl.SkinLabel edtPeriodo 
         Height          =   255
         Left            =   2280
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":135A
         TabIndex        =   15
         Top             =   1080
         Width           =   3975
      End
      Begin ACTIVESKINLibCtl.SkinLabel labPeriodo 
         Height          =   255
         Left            =   1440
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":13C6
         TabIndex        =   14
         Top             =   1080
         Width           =   615
      End
      Begin ACTIVESKINLibCtl.SkinLabel edtAsignatura 
         Height          =   255
         Left            =   2280
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":1434
         TabIndex        =   13
         Top             =   720
         Width           =   3375
      End
      Begin ACTIVESKINLibCtl.SkinLabel labAsignatura 
         Height          =   255
         Left            =   1200
         OleObjectBlob   =   "ancora_goh_traditional_frmDatosActividad.frx":14A0
         TabIndex        =   12
         Top             =   720
         Width           =   855
      End
   End
End
Attribute VB_Name = "frmDatosActividad"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Public dia
Public turno
Public resultbutton As Long

Private Sub cmdAceptar_Click()
    resultbutton = 1
    Hide
End Sub

Private Sub cmdCancelar_Click()
    resultbutton = 0
    Hide
End Sub

Private Sub cmddelete_Click()
    resultbutton = 2
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub

Private Sub tablaPosiblesInicios_EnterCell()
    Dim i As Long, j As Long
    If tablaPosiblesInicios.row > 0 And tablaPosiblesInicios.col > 0 Then
        tablaPosiblesInicios.CellBackColor = vbBlue
        turno = tablaPosiblesInicios.row
        dia = tablaPosiblesInicios.col
    End If
End Sub

Private Sub tablaPosiblesInicios_LeaveCell()
    If tablaPosiblesInicios.row > 0 Then tablaPosiblesInicios.CellBackColor = vbWhite
End Sub

