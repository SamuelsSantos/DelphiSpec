unit SampleAccountsStepDefs;

interface

uses
  Generics.Collections, DelphiSpec.Attributes, DelphiSpec.StepDefinitions;

type
  [Feature('Contas')]
  TSampleAccountSteps = class(TStepDefinitions)
  private type
    TUserInfo = record
      Nome: string;
      Senha: string;
      Id: Integer;
    end;
  private
    FName, FPassword: string;
    FUsers: TList<TUserInfo>;
    FAccessGranted: Boolean;
  public
    procedure SetUp; override;
    procedure TearDown; override;

    [Given_('a lista de usuários:')]
    procedure Given_users_exist(Table: TArray<TUserInfo>);

    [Given_('que o usuário é o "(.*)"')]
    procedure EnterName(const Value: string);

    [Given_('a senha é "(.*)"')]
    procedure EnterPassword(const Value: string);

    [Given_('o usuário "(.*)" foi excluído')]
    procedure RemoveUser(const Name: string);

    [When_('acessar')]
    procedure When_I_login;

    [Then_('as mensagens privadas poderão ser visualizadas')]
    procedure Then_I_have_access_to_private_messages;

    [Then_('o acesso será negado.')]
    procedure Then_Access_Denied;
  end;

implementation

uses
  DelphiSpec.Core, DelphiSpec.Assert;

{ TSampleAccountSteps }

procedure TSampleAccountSteps.EnterName(const Value: string);
begin
  FName := Value;
end;

procedure TSampleAccountSteps.EnterPassword(const Value: string);
begin
  FPassword := Value;
end;

procedure TSampleAccountSteps.Given_users_exist(Table: TArray<TUserInfo>);
var
  I: Integer;
begin
  for I := Low(Table) to High(Table) do
    FUsers.Add(Table[I]);
end;

procedure TSampleAccountSteps.RemoveUser(const Name: string);
var
  I: Integer;
begin
  for I := 0 to FUsers.Count - 1 do
    if (FUsers[I].Nome = FName) then
    begin
      FUsers.Delete(I);
      Break;
    end;
end;

procedure TSampleAccountSteps.SetUp;
begin
  FUsers := TList<TUserInfo>.Create;
  FAccessGranted := False;
end;

procedure TSampleAccountSteps.TearDown;
begin
  FUsers.Free;
end;

procedure TSampleAccountSteps.Then_Access_Denied;
begin
  Assert.IsFalse(FAccessGranted, 'Accesso liberado');
end;

procedure TSampleAccountSteps.Then_I_have_access_to_private_messages;
begin
  Assert.IsTrue(FAccessGranted, 'Access negado');
end;

procedure TSampleAccountSteps.When_I_login;
var
  I: Integer;
begin
  for I := 0 to FUsers.Count - 1 do
    if (FUsers[I].Nome = FName) and (FUsers[I].Senha = FPassword) then
    begin
      FAccessGranted := True;
      Break;
    end;
end;

initialization
  RegisterStepDefinitionsClass(TSampleAccountSteps);

end.
