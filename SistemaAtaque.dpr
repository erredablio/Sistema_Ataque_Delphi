program SistemaAtaque;

uses
  System.StartUpCopy,
  FMX.Forms,
  USistemaAtaque in 'USistemaAtaque.pas' {FSistemaAtaque};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFSistemaAtaque, FSistemaAtaque);
  Application.Run;
end.
