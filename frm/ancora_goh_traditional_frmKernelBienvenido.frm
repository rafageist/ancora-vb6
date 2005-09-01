VERSION 5.00
Object = "{B42578F8-962C-436D-9516-4E26101FF1D9}#4.0#0"; "buttonskin.ocx"
Begin VB.Form frmKernelBienvenido 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "Bienvenido(a)"
   ClientHeight    =   3945
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   5010
   Icon            =   "ancora_goh_traditional_frmKernelBienvenido.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   3945
   ScaleWidth      =   5010
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton cmdCancel 
      Caption         =   "Cancelar"
      Height          =   375
      Left            =   3720
      TabIndex        =   0
      Top             =   3480
      Width           =   1215
   End
   Begin ButtonSkin.ucBtnSkin OpcionDeInicio 
      Height          =   735
      Index           =   0
      Left            =   120
      TabIndex        =   1
      Top             =   120
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   1296
      Skin            =   9
      Caption         =   ""
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Value           =   0   'False
      ForeColorNormal =   0
      ForeColorDown   =   0
      ForeColorUp     =   0
      ForeColorDisabled=   12500670
      ForeColorCheck  =   0
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   2
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin ButtonSkin.ucBtnSkin OpcionDeInicio 
      Height          =   735
      Index           =   1
      Left            =   120
      TabIndex        =   2
      Top             =   960
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   1296
      Skin            =   9
      Caption         =   ""
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Value           =   0   'False
      ForeColorNormal =   0
      ForeColorDown   =   0
      ForeColorUp     =   0
      ForeColorDisabled=   12500670
      ForeColorCheck  =   0
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   2
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin ButtonSkin.ucBtnSkin OpcionDeInicio 
      Height          =   735
      Index           =   2
      Left            =   120
      TabIndex        =   3
      Top             =   1800
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   1296
      Skin            =   9
      Caption         =   ""
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Value           =   0   'False
      ForeColorNormal =   0
      ForeColorDown   =   0
      ForeColorUp     =   0
      ForeColorDisabled=   12500670
      ForeColorCheck  =   0
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   2
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
   Begin ButtonSkin.ucBtnSkin OpcionDeInicio 
      Height          =   735
      Index           =   3
      Left            =   120
      TabIndex        =   4
      Top             =   2640
      Width           =   4815
      _ExtentX        =   8493
      _ExtentY        =   1296
      Skin            =   9
      Caption         =   ""
      Enabled         =   -1  'True
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Verdana"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Value           =   0   'False
      ForeColorNormal =   0
      ForeColorDown   =   0
      ForeColorUp     =   0
      ForeColorDisabled=   12500670
      ForeColorCheck  =   0
      CaptionAlign    =   0
      CaptionMargin   =   10
      ButtonType      =   2
      Object.ToolTipText     =   ""
      UseUnderLineMouseUp=   0   'False
      UseUnderLineMouseCheck=   0   'False
      BorderColorCheck=   0
      ColorSchemas    =   1
   End
End
Attribute VB_Name = "frmKernelBienvenido"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"489BC20D0031"
Option Explicit

Public resultbutton As Long

Private Sub cmdCancel_Click()
    resultbutton = 0
    Hide
End Sub
Public Sub go()
    Show vbModal
End Sub

Private Sub Form_Load()
   
    interface.SkinFor Me

    Dim lFontColor As Long
    Dim lBorderColor As Long
    Dim lBackColor   As Long
        
    lBorderColor = OpcionDeInicio(0).BorderColorSkinDefault
    lBackColor = OpcionDeInicio(0).BackColorSkinDefault
    lFontColor = OpcionDeInicio(0).ForeColorNormal

    Dim str_opciones As Variant
    
    str_opciones = Array( _
                            Array("Crear un archivo en blanco", "Personas con experiencia con el sistema"), _
                            Array("Crear utilizando el asistente", "Para los novatos con el sistema"), _
                            Array("Modificar utilizando el asistente", "Repasar los pasos de la confección de archivos"), _
                            Array("Abrir un archivo existente", "Continuar el trabajo anterior") _
                            )

Dim i As Integer
With OpcionDeInicio
        For i = 1 To 4
            Call .Item(i - 1).FormatTextClear
            Call .Item(i - 1).FormatTextSetup(10, 2, 5)
            Call .Item(i - 1).FormatTextAddParagraph(eleft)
            Call .Item(i - 1).FormatTextAdd(Chr(52), "Webdings", 12, lFontColor)
            Dim itemtext As Variant
            itemtext = str_opciones(i - 1)
            Call .Item(i - 1).FormatTextAdd("" & itemtext(0), "Verdana", 10, lFontColor, , , True)
            Call .Item(i - 1).FormatTextDrawLine(lFontColor, vbDot)
            Call .Item(i - 1).FormatTextAddParagraph(eleft)
            Call .Item(i - 1).FormatTextAdd("" & itemtext(1), "Verdana", 8, lFontColor, , , False)
            Call .Item(i - 1).FormatTextAddNewLine
             .Item(i - 1).EnabledFormatText = True
            Call .Item(i - 1).Refresh
        Next
End With
End Sub

Private Sub OpcionDeInicio_Click(index As Integer)
    resultbutton = index + 1
    Hide
End Sub

