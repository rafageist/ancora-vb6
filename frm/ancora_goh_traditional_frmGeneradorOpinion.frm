VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Begin VB.Form frmGeneradorOpinion 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Opiniones del generador..."
   ClientHeight    =   4335
   ClientLeft      =   45
   ClientTop       =   450
   ClientWidth     =   7545
   Icon            =   "ancora_goh_traditional_frmGeneradorOpinion.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   4335
   ScaleWidth      =   7545
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdAceptar 
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
      Left            =   5760
      TabIndex        =   2
      Top             =   3840
      Width           =   1575
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   1680
      Top             =   3600
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   32
      ImageHeight     =   32
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   1
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "ancora_goh_traditional_frmGeneradorOpinion.frx":0252
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin MSComctlLib.ListView ListView3 
      CausesValidation=   0   'False
      Height          =   3255
      Left            =   120
      TabIndex        =   1
      Top             =   360
      Width           =   7215
      _ExtentX        =   12726
      _ExtentY        =   5741
      View            =   3
      LabelEdit       =   1
      MultiSelect     =   -1  'True
      LabelWrap       =   -1  'True
      HideSelection   =   0   'False
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      TextBackground  =   -1  'True
      _Version        =   393217
      ForeColor       =   0
      BackColor       =   16777215
      BorderStyle     =   1
      Appearance      =   1
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      NumItems        =   2
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "Período"
         Object.Width           =   2117
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "Orden"
         Object.Width           =   8819
      EndProperty
   End
   Begin VB.Line Line2 
      BorderColor     =   &H80000010&
      X1              =   0
      X2              =   9000
      Y1              =   3720
      Y2              =   3720
   End
   Begin VB.Line Line1 
      BorderColor     =   &H00FFFFFF&
      X1              =   0
      X2              =   9000
      Y1              =   3735
      Y2              =   3735
   End
   Begin VB.Label Label1 
      BackStyle       =   0  'Transparent
      Caption         =   "Orden de prioridad de las clasificaciones de actividades"
      Height          =   255
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   4095
   End
End
Attribute VB_Name = "frmGeneradorOpinion"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC2210257"
Option Explicit
Private Sub Form_Activate()
    Dim i As Long, a As String
    ListView3.SmallIcons = ImageList1

    With ListView3
        .ListItems.clear

        For i = 1 To ancora.periodos.Count
            a = ancora.PriorizaClasif(i)
            .ListItems.add , , "(" + kernel.utils.trunca(ancora.periodos(i).id) + ") " + kernel.utils.trunca(ancora.periodos(i).id), , 1
            .ListItems(i).ListSubItems.add , , a
        Next

    End With

End Sub

Private Sub cmdAceptar_Click()
    Hide
End Sub

Private Sub Form_Load()
    interface.SkinFor Me
End Sub
