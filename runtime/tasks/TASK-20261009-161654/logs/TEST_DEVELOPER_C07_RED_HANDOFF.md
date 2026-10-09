# C07 functional RED

TDD CYCLE TEST EVIDENCE

Cycle: C07
Test File: validation/RickCalculatorTests/src/Calculator.Tests.pas
Test Names: Sign_AllowsNegativeZero; Sign_NegativeSecondOperand; Sign_TwiceRestoresEntry; Sign_ResultPreservesRepeat
Test SHA256: 1BCD09F37BFB75796028F43BE97FB212E2E9BBB5343A3D1AE4FAE10ADA5C4A04
Build Errors: 0
Build Warnings: 0
Discovered: 21
Executed: 21
Passed: 17
Failed: 4
Errors: 0
ExitCode: build=0; test=1
Initial State: RED
Evidence: evidence/C07-red-build.log; evidence/C07-red-execution.log.

Actual new assertions: Sign_AllowsNegativeZero Expected="-0" Actual="0"; Sign_NegativeSecondOperand Expected="3" Actual="7"; Sign_TwiceRestoresEntry Expected="-12" Actual="12"; Sign_ResultPreservesRepeat Expected="-5" Actual="5". Seventeen previous names PASS in same cumulative run. Neutral ToggleSign does nothing, explaining all actual failures; no runtime exceptions.

Read structural resolution before building. Commands: scripts/build-project.cmd validation/RickCalculatorTests/RickCalculatorTests.dproj Debug Win32; validation/RickCalculatorTests/bin/RickCalculatorTests.exe C07. Compiler summary and warning check show zero errors/warnings; successful build validates structural cause removed. Actual exits separately captured; originals preserved and copied into evidence. Frozen hash unchanged; no test/production/config/script/policy/registry modifications during return.

HANDOFF

From: TEST_DEVELOPER
To: PRODUCTION_DEVELOPER via FLOW_COORDINATOR
Current Task: TASK-20261009-161654 / C07
Status: VALID FUNCTIONAL RED
Approved Artifacts: frozen C07 cumulative tests; zero-warning real build; actual functional RED evidence.
Open Blockers: none
Evidence: 21 discovered/executed; seventeen prior cases pass; four new assertion failures; Errors=0, exit=1.
Next Responsibility: Implement only C07 input/result sign behavior in approved production files; preserve tests and prior behavior, obtain cumulative GREEN and route REFACTOR_SPECIALIST.
