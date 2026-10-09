# C04 functional RED

TDD CYCLE TEST EVIDENCE

Cycle: C04
Test File: validation/RickCalculatorTests/src/Calculator.Tests.pas
Test Names: Equals_RepeatsLastOperand; Equals_UsesFirstOperandWhenMissing; Equals_WithoutOperation; Result_DigitStartsNew; Result_AddContinues
Test SHA256: 206A205059ADB7762A2CCF3A3C321DBAA9A86B3913A760794A402EA20570E9CD
Build Errors: 0
Build Warnings: 0
Discovered: 11
Executed: 11
Passed: 8
Failed: 3
Errors: 0
ExitCode: build=0; test=1
Initial State: RED
Evidence: evidence/C04-prior-suite.log; evidence/C04-red-build.log; evidence/C04-red-execution.log.

Prior C03 suite executed before edits: 6 discovered/executed/passed, failed=errors=0, exit=0. All six remain PASS in cumulative C04. Prior test methods preserved verbatim; only approved five C04 cases added, with small test-only preparation and Equals/assert helpers. Fresh Engine/real Math per fixture, released in finally. Exact expected transitions match C04 plan: 5/8/11; 10/15; 5 without operation; 7 new entry; 9 continuation. Decimal/reset/edit/sign/error future behaviors absent. Registration permits cumulative C01..C04; default C04. Delphi BOM preserved. Test frozen at hash above.

New case outcomes:

- Equals_RepeatsLastOperand: FAIL Expected="8" Actual="5" at second Equals (initial 5 assertion passed).
- Equals_UsesFirstOperandWhenMissing: FAIL Expected="10" Actual="5".
- Equals_WithoutOperation: PASS, existing Equals without pending sum preserves entry.
- Result_DigitStartsNew: FAIL Expected="7" Actual="57" after successful initial result 5.
- Result_AddContinues: PASS, existing Add captures displayed result and accepts explicit next operand.

C04 overall RED; two already satisfied cases were not artificially broken. Original logs preserved; no production, config, script, policy or registry modified. Commands: scripts/build-project.cmd validation/RickCalculatorTests/RickCalculatorTests.dproj Debug Win32; validation/RickCalculatorTests/bin/RickCalculatorTests.exe C04. Actual compiler and script warning check passed with Errors=Warnings=0; runner actual 11 names/counts, no infrastructure exceptions.

HANDOFF

From: TEST_DEVELOPER
To: PRODUCTION_DEVELOPER via FLOW_COORDINATOR
Current Task: TASK-20261009-161654 / C04
Status: VALID FUNCTIONAL RED
Approved Artifacts: frozen C04 cumulative tests; zero-warning build and real RED execution evidence.
Open Blockers: none
Evidence: 11 discovered/executed; prior six pass; two new pass; three new assertions fail; Errors=0, exit=1.
Next Responsibility: Implement only C04 repetition, missing operand and post-result entry transitions in authorized Engine file; preserve tests and already satisfied behavior, obtain cumulative GREEN and route REFACTOR_SPECIALIST.
