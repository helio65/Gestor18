inherited fTarefa2: TfTarefa2
  Caption = 'Threads'
  Color = clGray
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 72
    Width = 131
    Height = 13
    Caption = 'Tempo de espera thread 1:'
  end
  object Label2: TLabel
    Left = 224
    Top = 72
    Width = 60
    Height = 13
    Caption = 'milisegundos'
  end
  object Label3: TLabel
    Left = 8
    Top = 104
    Width = 131
    Height = 13
    Caption = 'Tempo de espera thread 2:'
  end
  object Label4: TLabel
    Left = 224
    Top = 104
    Width = 60
    Height = 13
    Caption = 'milisegundos'
  end
  object BitBtn1: TBitBtn
    Left = 24
    Top = 24
    Width = 97
    Height = 25
    Caption = 'Processar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object pbThread1: TProgressBar
    Left = 0
    Top = 346
    Width = 626
    Height = 33
    Align = alBottom
    TabOrder = 3
    Visible = False
  end
  object pbThread2: TProgressBar
    Left = 0
    Top = 379
    Width = 626
    Height = 33
    Align = alBottom
    TabOrder = 4
    Visible = False
  end
  object edtTempo_T1: TEdit
    Left = 143
    Top = 69
    Width = 76
    Height = 21
    TabOrder = 0
  end
  object edtTempo_T2: TEdit
    Left = 143
    Top = 101
    Width = 76
    Height = 21
    TabOrder = 1
  end
end
