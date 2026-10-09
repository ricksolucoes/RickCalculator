# C10 functional RED

TDD CYCLE TEST EVIDENCE

Cycle: C10
Test File: validation/RickCalculatorTests/src/Calculator.Tests.pas
Test Names: Error_IgnoresUnavailableCommands; Error_ClearResets; Error_DigitRecovers; Error_CommaRecovers
Test SHA256: 4068CDA427537F839FD6EFC626D44158672181232A81E21CDA28D55F45D471C0
Test-only Math SHA256: 7526C68EBC75452DAB06FF847D2E33C95E636E01C854315839383A93E91740EC
Build Errors: 0
Build Warnings: 0
Discovered: 30
Executed: 30
Passed: 27
Failed: 3
Errors: 0
ExitCode: build=0; test=1
Initial State: RED
Evidence: evidence/C10-prior-suite.log; evidence/C10-red-build.log; evidence/C10-red-execution.log.

Prior C09 suite before edits: Discovered=Executed=Passed=26, Failed=Errors=0, exit=0. All twenty-six earlier cases PASS in cumulative C10. Only four authorized C10 tests added. Fixtures require exact error message/HasError=True before commands. Each unavailable command uses independent error Engine; ignored sequence covers CE, Backspace, ToggleSign, Add, Equals, labels subscenario. A thrown exception from an expected ignored command becomes a functional assertion specifying actual exception class. Recovery cases require approved text, HasError=False, required Equals behavior, then C 2+3== yielding 5/8. Prior test methods unchanged.

Approved test-only mock evolution: New preserves always-overflow behavior for C09. NewRecovering throws only on its first Add, then delegates to real TCalculatorMath, allowing genuine later additions. Implements original interface contract/pattern, no production source modified. Both frozen hashes above replace prior hashes only for authorized new-cycle additions/evolution. UTF-8 BOM preserved; registration cumulative C01..C10/default C10; no future tests.

Actual new outcomes:

- Error_IgnoresUnavailableCommands FAIL at CE subscenario 1: expected unchanged exact error message; actual 0. Later subscenarios remain present but initial assertion stops this case in RED.
- Error_ClearResets PASS, including HasError=False, Equals zero and fresh 2+3==5/8 using real Math delegation.
- Error_DigitRecovers FAIL: expected 7; actual existing error text with 7 appended.
- Error_CommaRecovers FAIL: expected 0,; actual existing error text with comma appended.

Native captured diagnostic text has a replacement character at the accented character in the error message under host console encoding; literals and string comparisons are Unicode Delphi source, frozen BOM present. Counts, append behavior and failure classification remain directly evidenced; full unfiltered logs preserved. No execution errors. Existing Clear behavior already satisfies its case and was not artificially changed.

Commands: scripts/build-project.cmd validation/RickCalculatorTests/RickCalculatorTests.dproj Debug Win32; validation/RickCalculatorTests/bin/RickCalculatorTests.exe C10. Actual compiler/build warning assertion pass zero errors/warnings, real exits and all names/counts logged. No production/config/script/policy/registry changes.

HANDOFF

From: TEST_DEVELOPER
To: PRODUCTION_DEVELOPER via FLOW_COORDINATOR
Current Task: TASK-20261009-161654 / C10
Status: VALID FUNCTIONAL RED
Approved Artifacts: frozen C10 cumulative tests and authorized evolving mock; actual zero-warning build and RED logs.
Open Blockers: none
Evidence: 30 discovered/executed; 26 earlier pass; one new case already passes; three new functional assertion failures; Errors=0, exit=1.
Next Responsibility: Implement only C10 error command guards and recovery in approved Engine, preserve tests/earlier behavior; obtain cumulative GREEN and route REFACTOR_SPECIALIST.
