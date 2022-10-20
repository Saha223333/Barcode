unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, OracleData, Oracle, frxClass, frxDBSet, pDBBarcode2D,
  pCore2D, pBarcode2D, pQRCode, RzButton, pPDF417Custom, pPDF417,
  frxExportPDF, frxExportImage, StdCtrls, ExtCtrls,QuricolApi;

type
  TForm1 = class(TForm)
    frxDBDataset1: TfrxDBDataset;
    OS: TOracleSession;
    ODS: TOracleDataSet;
	 Barcode2D: TBarcode2D_QRCode;
    DBBarcode2D: TDBBarcode2D;
    DS: TDataSource;
	 RzButton1: TRzButton;
    frxPDFExport1: TfrxPDFExport;
    frxBMPExport1: TfrxBMPExport;
    frxJPEGExport1: TfrxJPEGExport;
    RG: TRadioGroup;
    Button1: TButton;
    frxReport1: TfrxReport;
    procedure frxReport1BeforePrint(Sender: TfrxReportComponent);
    procedure RzButton1Click(Sender: TObject);
    procedure Barcode2DEncode(Sender: TObject; var Data: String;
      Barcode: String);
    procedure frxReport1GetValue(const VarName: String;
      var Value: Variant);
    procedure Button1Click(Sender: TObject);
    procedure frxReport1AfterPrint(Sender: TfrxReportComponent);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
UtfAnsi:string;
str:string;

type
MyPChar=PAnsiChar;

implementation

{$R *.dfm}

procedure TForm1.frxReport1BeforePrint(Sender: TfrxReportComponent);
var
AWidth, AHeight, ASymbolWidth, ASymbolHeight: Integer;
begin
if rg.ItemIndex=0 then UtfAnsi:='1';
if rg.ItemIndex=1 then UtfAnsi:='2';
 
 //If ODS.Active=false then ODS.Open;
 str:='ST0001'+utfansi+'|Name=ОАО "СКЭК"|PersonalAcc=40702810826020103034|'+
'BankName=ОТДЕЛЕНИЕ №8615 СБЕРБАНКА РОССИИ Г.КЕМЕРОВО'+
'|BIC=043207612|CorrespAcc=30101810200000000612|Sum=1000|Purpose=Водопотребление|'+
'PayeeINN=4205153492|lastName=Рагулин|'+
'firstName=В|middleName=А|payerAddress=Саянская ул.6'+
'|persAcc=1012827|paymPeriod=102014|serviceName=1|'+
'counterVal=350|category=42101';
Barcode2D.Barcode:=str;
Barcode2D.Module := 1;

 AWidth:=200;  ASymbolWidth:=10;
 AHeight:=200; ASymbolHeight:=10;

 Barcode2D.DrawToSize(AWidth, AHeight, ASymbolWidth, ASymbolHeight);
  with  TfrxPictureView(frxReport1.FindObject('Picture1')).Picture.Bitmap do
	begin
	 Width := AWidth;
	 Height := AHeight;
	 Barcode2D.DrawTo(Canvas, 0, 0);
	end;

 Barcode2D.DrawToSize(AWidth, AHeight, ASymbolWidth, ASymbolHeight);
  with  TfrxPictureView(frxReport1.FindObject('Picture2')).Picture.Bitmap do
	begin
	 Width := AWidth;
	 Height := AHeight;
	 Barcode2D.DrawTo(Canvas, 0, 0);
	end;
end;

procedure TForm1.RzButton1Click(Sender: TObject);
begin
 frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'\123.fr3',true);
 frxReport1.ShowReport(false);

 //If ODS.Active=true then ODS.Close;
end;

procedure TForm1.Barcode2DEncode(Sender: TObject; var Data: String;
  Barcode: String);
begin
if rg.ItemIndex=1 then
Data := #$EF#$BB#$BF + AnsiToUTF8(Barcode);


end;

procedure TForm1.frxReport1GetValue(const VarName: String;
  var Value: Variant);
begin
if varname='bc' then value:=BArcode2D.Barcode;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
MyPVar:MyPChar;
begin
MyPVar:='ST00011|Name=ОАО "СКЭК"|PersonalAcc=40702810826020103034|'+
'BankName=ОТДЕЛЕНИЕ №8615 СБЕРБАНКА РОССИИ Г.КЕМЕРОВО'+
'|BIC=043207612|CorrespAcc=30101810200000000612|Sum=1000|Purpose=Водопотребление|'+
'PayeeINN=4205153492|lastName=Рагулин|'+
'firstName=В|middleName=А|payerAddress=Саянская ул.6'+
'|persAcc=1012827|paymPeriod=102014|serviceName=1|'+
'counterVal=350|category=42101';

GenerateBMP('C:\123.bmp',MyPVar,0,3,1);
end;

procedure TForm1.frxReport1AfterPrint(Sender: TfrxReportComponent);
begin
 with  TfrxPictureView(frxReport1.FindObject('Picture3')).Picture.Bitmap do
	begin
	 //Width := 20;
	 //Height := 20;
	 LoadFromFile('C:\123.bmp');
	end;
end;

end.
