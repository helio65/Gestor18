inherited fTarefa1: TfTarefa1
  Caption = 'Tarefa 1'
  ClientHeight = 444
  ClientWidth = 727
  OnDestroy = FormDestroy
  ExplicitWidth = 743
  ExplicitHeight = 483
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 40
    Width = 207
    Height = 193
    Caption = 'Colunas'
    TabOrder = 0
    object memoColunas: TMemo
      Left = 7
      Top = 13
      Width = 195
      Height = 173
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 220
    Top = 40
    Width = 207
    Height = 193
    Caption = 'Tabelas'
    TabOrder = 1
    object memoTabelas: TMemo
      Left = 7
      Top = 13
      Width = 195
      Height = 173
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 431
    Top = 40
    Width = 207
    Height = 193
    Caption = 'Condi'#231#245'es'
    TabOrder = 2
    object memoCondicoes: TMemo
      Left = 7
      Top = 13
      Width = 195
      Height = 173
      TabOrder = 0
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 239
    Width = 711
    Height = 198
    Caption = 'SQL Gerado'
    TabOrder = 3
    object memoSQL: TMemo
      Left = 7
      Top = 16
      Width = 696
      Height = 174
      TabOrder = 0
    end
  end
  object btnGerarSQL: TBitBtn
    Left = 648
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Gerar SQL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = btnGerarSQLClick
  end
  object spQuery1: TspQuery
    Left = 656
    Top = 8
  end
end
