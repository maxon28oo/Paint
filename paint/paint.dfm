object Form1: TForm1
  Left = 267
  Top = 238
  Width = 915
  Height = 570
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Box: TPaintBox
    Left = 192
    Top = 32
    Width = 665
    Height = 417
    OnMouseDown = BoxMouseDown
    OnMouseMove = BoxMouseMove
    OnMouseUp = BoxMouseUp
    OnPaint = BoxPaint
  end
  object Label4: TLabel
    Left = 64
    Top = 112
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 64
    Top = 136
    Width = 3
    Height = 13
  end
  object Button1: TButton
    Left = 8
    Top = 448
    Width = 73
    Height = 33
    Caption = 'Clear'
    TabOrder = 0
    OnClick = Button1Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 500
    Width = 899
    Height = 31
    Panels = <
      item
        Width = 50
      end>
    SimplePanel = False
  end
  object ColorGrid1: TColorGrid
    Left = 8
    Top = 360
    Width = 104
    Height = 80
    TabOrder = 2
    OnChange = ColorGrid1Change
  end
  object Button2: TButton
    Left = 120
    Top = 360
    Width = 57
    Height = 81
    Caption = 'Advanced'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 192
    Top = 240
    Width = 209
    Height = 233
    Caption = 'Panel1'
    TabOrder = 4
    object Shape1: TShape
      Left = 144
      Top = 136
      Width = 49
      Height = 49
      Pen.Style = psClear
    end
    object Label1: TLabel
      Left = 17
      Top = 0
      Width = 12
      Height = 16
      Caption = 'R'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 57
      Top = 0
      Width = 12
      Height = 16
      Caption = 'G'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 97
      Top = 0
      Width = 11
      Height = 16
      Caption = 'B'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TrackBar1: TTrackBar
      Left = 8
      Top = 16
      Width = 49
      Height = 209
      Max = 255
      Orientation = trVertical
      PageSize = 3
      Frequency = 1
      Position = 0
      SelEnd = 0
      SelStart = 0
      TabOrder = 0
      TickMarks = tmBottomRight
      TickStyle = tsAuto
      OnChange = TrackBar1Change
    end
    object TrackBar2: TTrackBar
      Left = 48
      Top = 16
      Width = 41
      Height = 209
      Max = 255
      Orientation = trVertical
      Frequency = 1
      Position = 0
      SelEnd = 0
      SelStart = 0
      TabOrder = 1
      TickMarks = tmBottomRight
      TickStyle = tsAuto
      OnChange = TrackBar2Change
    end
    object TrackBar3: TTrackBar
      Left = 88
      Top = 16
      Width = 41
      Height = 209
      Max = 255
      Orientation = trVertical
      Frequency = 1
      Position = 0
      SelEnd = 0
      SelStart = 0
      TabOrder = 2
      TickMarks = tmBottomRight
      TickStyle = tsAuto
      OnChange = TrackBar3Change
    end
  end
  object Timer1: TTimer
    Interval = 1
    OnTimer = Timer1Timer
    Left = 848
    Top = 456
  end
end
