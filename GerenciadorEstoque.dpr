program GerenciadorEstoque;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {FrmPrincipal},
  uProdutos in 'uProdutos.pas' {FrmProdutos},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TFrmProdutos, FrmProdutos);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
