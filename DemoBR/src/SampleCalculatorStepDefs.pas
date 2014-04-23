unit SampleCalculatorStepDefs;

interface

uses
  SampleCalculator, DelphiSpec.Attributes, DelphiSpec.StepDefinitions;

type
  [Feature('Calculadora')]
  TSampleCalculatorSteps = class(TStepDefinitions)
  private
    FCalc: TCalculator;
  public
    procedure SetUp; override;
    procedure TearDown; override;

    [Given_('digitei $value na calculadora')]
    procedure Given_I_have_entered_value_in_calculator(Value: Integer);

    [When_('pressionar adicionar')]
    procedure When_I_press_add;

    [When_('pressionar multiplicar')]
    procedure When_I_press_mul;

    [Then_('o resultado deve ser de $value')]
    procedure Then_the_result_should_be_value_on_the_screen(Value: Integer);
  end;

implementation

uses
  SysUtils, DelphiSpec.Core, DelphiSpec.Assert;

{ TSampleCalculatorSteps }

procedure TSampleCalculatorSteps.When_I_press_add;
begin
  FCalc.Add;
end;

procedure TSampleCalculatorSteps.Given_I_have_entered_value_in_calculator(Value: Integer);
begin
  FCalc.Push(Value);
end;

procedure TSampleCalculatorSteps.When_I_press_mul;
begin
  FCalc.Mul;
end;

procedure TSampleCalculatorSteps.SetUp;
begin
  FCalc := TCalculator.Create;
end;

procedure TSampleCalculatorSteps.TearDown;
begin
  FCalc.Free;
end;

procedure TSampleCalculatorSteps.Then_the_result_should_be_value_on_the_screen(Value: Integer);
begin
  Assert.AreEqual(Value, FCalc.Value, 'Resultado incorreto');
end;

initialization
  RegisterStepDefinitionsClass(TSampleCalculatorSteps);

end.
