object Form1: TForm1
  Left = 800
  Top = 311
  Width = 237
  Height = 222
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RzButton1: TRzButton
    Left = 32
    Top = 128
    Width = 113
    Height = 33
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' Barcode 2D'
    TabOrder = 0
    OnClick = RzButton1Click
  end
  object RG: TRadioGroup
    Left = 8
    Top = 8
    Width = 153
    Height = 81
    Caption = #1050#1086#1076#1080#1088#1086#1074#1082#1072
    ItemIndex = 0
    Items.Strings = (
      'ANSI'
      'UTF-8')
    TabOrder = 1
  end
  object Button1: TButton
    Left = 24
    Top = 96
    Width = 121
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100' Quricol'
    TabOrder = 2
    OnClick = Button1Click
  end
  object frxReport1: TfrxReport
    Version = '3.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    ReportOptions.CreateDate = 41926.355251944400000000
    ReportOptions.LastChange = 41933.400712256950000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnAfterPrint = frxReport1AfterPrint
    OnBeforePrint = frxReport1BeforePrint
    OnGetValue = frxReport1GetValue
    Left = 128
    Top = 48
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      #39'ST00011|NAME='#1054#1040#1054'"'#1057#1050#1069#1050'"|PERSON='#39'ST00011|NAME='#1054#1040#1054'"'#1057#1050#1069#1050'"|PERSON')
    DataSet = ODS
    Left = 160
    Top = 48
  end
  object OS: TOracleSession
    LogonUsername = 'esbp'
    LogonPassword = 'esbp'
    LogonDatabase = 'ORCL.LOCAL.SKEK.RU'
    Connected = True
    Left = 128
    Top = 80
  end
  object ODS: TOracleDataSet
    SQL.Strings = (
      
        'select '#39'ST00011|Name='#1054#1040#1054' "'#1057#1050#1069#1050'"|PersonalAcc=40702810826020103034' +
        '|BankName='#1054#1058#1044#1045#1051#1045#1053#1048#1045' '#8470'8615 '#1057#1041#1045#1056#1041#1040#1053#1050#1040' '#1056#1054#1057#1057#1048#1048' '#1043'.'#1050#1045#1052#1045#1056#1054#1042#1054
      
        '|BIC=043207707|CorrespAcc=30101810200000000612|Sum=1000|Purpose=' +
        'v|PayeeINN=4205153492|lastName='#1056#1072#1075#1091#1083#1080#1085'|'
      
        'firstName='#1042'|middleName='#1040'|payerAddress='#1057#1072#1103#1085#1089#1082#1072#1103' '#1091#1083'.6|persAcc=1012' +
        '827|paymPeriod=102014|serviceName=v|'
      'counterVal=350|category=4201'#39' from dual')
    Optimize = False
    QBEDefinition.QBEFieldDefs = {
      04000000010000001E00000027535430303031317C4E414D453DCEC0CE22D1CA
      DDCA227C504552534F4E010000000000}
    Session = OS
    Left = 160
    Top = 80
  end
  object Barcode2D: TBarcode2D_QRCode
    OnEncode = Barcode2DEncode
    Left = 128
    Top = 112
  end
  object DBBarcode2D: TDBBarcode2D
    Left = 144
    Top = 112
  end
  object DS: TDataSource
    DataSet = ODS
    Left = 192
    Top = 80
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = False
    Outline = False
    Author = 'FastReport'#174
    Subject = 'FastReport'#174' PDF export'
    Background = False
    Creator = 'FastReport'#174' (http://www.fast-report.com)'
    HTMLTags = True
    Left = 128
    Top = 16
  end
  object frxBMPExport1: TfrxBMPExport
    UseFileCache = True
    ShowProgress = True
    Left = 192
    Top = 48
  end
  object frxJPEGExport1: TfrxJPEGExport
    UseFileCache = True
    ShowProgress = True
    JPEGQuality = 1000
    Left = 160
    Top = 16
  end
end
