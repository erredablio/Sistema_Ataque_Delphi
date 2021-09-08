unit USistemaAtaque;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  FMX.EditBox, FMX.NumberBox, FMX.SpinBox;

type
  TFSistemaAtaque = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnATQP1: TButton;
    BtnATQP2: TButton;
    Memo: TMemo;
    BtnSaveP1: TButton;
    BtnSaveP2: TButton;
    EdtFP1: TSpinBox;
    EdtDP1: TSpinBox;
    EdtDP2: TSpinBox;
    EdtFP2: TSpinBox;
    EdtVP1: TNumberBox;
    EdtVP2: TNumberBox;
    BtnIniciar: TButton;
    procedure BtnSaveP1Click(Sender: TObject);
    procedure BtnSaveP2Click(Sender: TObject);
    procedure BtnIniciarClick(Sender: TObject);
    procedure BtnATQP1Click(Sender: TObject);
    procedure BtnATQP2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSistemaAtaque: TFSistemaAtaque;
  Dado, Dano, FP1, FP2, DP1, DP2, VP1, VP2: Integer;

implementation

{$R *.fmx}

procedure TFSistemaAtaque.BtnATQP1Click(Sender: TObject);
begin
  Dano:=0;
  Dado:= Random(10);
  Memo.Lines.Add('P1 obteve ' + IntToStr(Dado) + ' no dado');
  if Dado <= FP1 then
    begin
      Dano:=(Dado+(FP1-DP2));
      VP2:=VP2-Dano;
      Memo.Lines.Add('P2 recebeu ' + IntToStr(Dano) + ' de dano e ficou com ' + IntToStr(VP2) + ' de vida');
      EdtVP2.Text:=IntToStr(VP2);
      if VP2 <= 0 then
        Memo.Lines.Add('P2 foi derrotado');
        ShowMessage('P1 venceu!');
        BtnATQP1.Enabled:=False;
    end
    else
      Memo.Lines.Add('P2 defendeu e não sofreu danos');
end;

procedure TFSistemaAtaque.BtnATQP2Click(Sender: TObject);
begin
  Dano:=0;
  Dado:= Random(10);
  Memo.Lines.Add('P2 obteve ' + IntToStr(Dado) + ' no dado');
  if Dado <= FP2 then
    begin
      Dano:=(Dado+(FP2-DP1));
      VP1:=VP1-Dano;
      Memo.Lines.Add('P1 recebeu ' + IntToStr(Dano) + ' de dano e ficou com ' + IntToStr(VP1) + ' de vida');
      EdtVP2.Text:=IntToStr(VP1);
      if VP1 <= 0 then
        Memo.Lines.Add('P1 foi derrotado');
        ShowMessage('P2 venceu!');
        BtnATQP2.Enabled:=False;
    end
    else
      Memo.Lines.Add('P2 defendeu e não sofreu danos');
end;

procedure TFSistemaAtaque.BtnIniciarClick(Sender: TObject);
begin
  if (StrToInt(EdtFP1.Text) > 0) and (StrToInt(EdtDP1.Text) > 0) and (StrToInt(EdtFP2.Text) > 0) and (StrToInt(EdtDP2.Text) > 0) then
    begin
      BtnATQP1.Enabled:=True;
      BtnATQP2.Enabled:=True;
      FP1:=(StrToInt(EdtFP1.Text));
      DP1:=(StrToInt(EdtDP1.Text));
      VP1:=(StrToInt(EdtVP1.Text));
      FP2:=(StrToInt(EdtFP2.Text));
      DP2:=(StrToInt(EdtDP2.Text));
      VP2:=(StrToInt(EdtVP2.Text));
      EdtFP1.Enabled:=False;
      EdtFP2.Enabled:=False;
      BtnSaveP1.Enabled:=False;
      BtnSaveP2.Enabled:=False;
      Memo.Lines.Add('P1 tem os seguintes atributos: V: '+ IntToStr(VP1) + ' F: ' + IntToStr(FP1) + ' D: ' + IntToStr(DP1));
      Memo.Lines.Add('P2 tem os seguintes atributos: V: '+ IntToStr(VP2) + ' F: ' + IntToStr(FP2) + ' D: ' + IntToStr(DP2));
      BtnIniciar.Enabled:=False;
    end
    else
      ShowMessage('Atributos não preenchidos');
end;

procedure TFSistemaAtaque.BtnSaveP1Click(Sender: TObject);
begin
  if (StrToInt(EdtFP1.Text) > 0) and (StrToInt(EdtDP1.Text) > 0) then
    begin
      EdtFP1.Enabled:=False;
      EdtDP1.Enabled:=False;
      BtnSaveP1.Enabled:=False;
    end
    else
      ShowMessage('Atributos não preenchidos');
end;

procedure TFSistemaAtaque.BtnSaveP2Click(Sender: TObject);
begin
  if (StrToInt(EdtFP2.Text) > 0) and (StrToInt(EdtDP2.Text) > 0) then
    begin
      EdtFP2.Enabled:=False;
      EdtDP2.Enabled:=False;
      BtnSaveP2.Enabled:=False;
    end
    else
      ShowMessage('Atributos não preenchidos');
end;

end.
