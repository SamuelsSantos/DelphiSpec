unit SampleSpamFilterStepDefs;

interface

uses
  DelphiSpec.Attributes, DelphiSpec.StepDefinitions;

type
  [Feature('Filtro Spam')]
  TSpamFilterSteps = class(TStepDefinitions)
  private
    FBlackList: string;
    FMailCount: Integer;
  public
    [Given_('que eu tenho uma lista negra:')]
    procedure Given_I_have_a_blacklist(const Text: string);
    [Given_('minha caixa de entrada está vazia')]
    procedure Given_I_have_empty_inbox;

    [When_('eu recebo um email de "(.*)"')]
    procedure ReceiveEmail(const From: string);

    [Then_('minha caixa de entrada está vazia')]
    procedure Then_my_inbox_is_empty;
  end;

implementation

uses
  StrUtils, DelphiSpec.Core, DelphiSpec.Assert;

{ TFilterSteps }

procedure TSpamFilterSteps.Given_I_have_a_blacklist(const Text: string);
begin
  FBlackList := Text;
end;

procedure TSpamFilterSteps.Given_I_have_empty_inbox;
begin
  FMailCount := 0;
end;

procedure TSpamFilterSteps.ReceiveEmail(const From: string);
begin
  if not ContainsStr(FBlackList, From) then
    Inc(FMailCount);
end;

procedure TSpamFilterSteps.Then_my_inbox_is_empty;
begin
  Assert.AreEqual(0, FMailCount, 'Caixa de entrada deve estar vazia');
end;

initialization
  RegisterStepDefinitionsClass(TSpamFilterSteps);

end.
