program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  QuricolAPI in '..\..\..\..\..\Program Files\Borland\Delphi7\Lib\Quricol\Source\QuricolAPI.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

