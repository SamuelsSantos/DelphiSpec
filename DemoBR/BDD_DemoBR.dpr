program BDD_DemoBR;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  SampleCalculator in 'src\SampleCalculator.pas',
  SampleCalculatorStepDefs in 'src\SampleCalculatorStepDefs.pas',
  Generics.Collections,
  DelphiSpec.Core,
  DelphiSpec.Scenario,
  DelphiSpec.DUnit;

{$R *.RES}

var
  Features: TObjectList<TFeature>;
begin
  ReportMemoryLeaksOnShutdown := True;

  Features := ReadFeatures('features', True, 'PT_BR');
  try
    CreateDUnitTests(Features);
    DUnitTestRunner.RunRegisteredTests;
  finally
    Features.Free;
  end;
end.

