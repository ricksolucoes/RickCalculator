# UIQA001 button rendering correction

RESOLUTION

Blocker ID: BLOCKER-UIQA-001
Resolved By: PRODUCTION_DEVELOPER (implementation); final visual closure remains UI_QA responsibility.
Evidence: Read UI_QA_REPORT.md and inspected real desktop evidence/ui-qa/10-error.bmp with view_image before editing. Installed Delphi Vcl.StdCtrls.pas SetButtonStyle (line 5553) resets BS_OWNERDRAW to BS_PUSHBUTTON/BS_DEFPUSHBUTTON; CMFocusChanged (line 5962) invokes this after creation. Source inspection explains native truncated semantic Caption and absent Accent in actual screenshot. App/test builds zero errors/warnings and cumulative 32-case regression PASS, real exits all zero.
Decision: Override TCalculatorButton.SetButtonStyle to retain BS_OWNERDRAW on VCL focus/default changes. Existing native semantic Caption remains accessible, while existing PaintButton now retains control of literal LabelText and Accent. Mark CN_DRAWITEM handled. Pressed accent buttons use darker blue to keep white text contrast. No UI_SPEC, expected result, test, contract, domain or interaction semantics changed.
Artifacts Updated: workspace/RickCalculator/src/View/Calculator.MainForm.pas only (UTF-8 BOM retained), compiler-generated app artifacts; evidence/UIQA001-app-debug-build.log; evidence/UIQA001-tests-debug-build.log; evidence/UIQA001-regression.log.
Impact: Implementation cause corrected and builds/regression pass. No post-fix GUI launched by production; screenshot confirmation, accessible-name inspection, focus/pressed state and complete stabilized 144-DPI view remain pending with UI_QA. Existing blocker must remain open in coordinator registry until owner confirms corrected rendering.
Return To: REFACTOR_SPECIALIST via FLOW_COORDINATOR, then CODE_REVIEWER/UI_QA as routed.
Status: RESOLVED

## Frozen artifacts and scope

Calculator.Tests.pas SHA256 before/after D0A2F31C392FDD791E6F936DCB23AE85C00100566145714A1789B75D4B90FBEF.
Calculator.TestMath.pas SHA256 before/after 7526C68EBC75452DAB06FF847D2E33C95E636E01C854315839383A93E91740EC.
Tests/config/scripts/specs/registry untouched. New override <=20 lines and complexity <=6; adjusted paint handlers retain policy limits. No warning disabled.

Commands: scripts/build-project.cmd workspace/RickCalculator/RickCalculator.dproj Debug Win32; scripts/build-project.cmd validation/RickCalculatorTests/RickCalculatorTests.dproj Debug Win32; validation/RickCalculatorTests/bin/RickCalculatorTests.exe C11.
Results: both builds Errors=Warnings=0, BuildExitCode=0; Discovered=Executed=Passed=32, Failed=Errors=0, TestExitCode=0.

HANDOFF

From: PRODUCTION_DEVELOPER
To: REFACTOR_SPECIALIST via FLOW_COORDINATOR
Current Task: TASK-20261009-161654 / BLOCKER-UIQA-001 implementation correction
Status: IMPLEMENTATION CORRECTED; FINAL VISUAL REVALIDATION PENDING
Approved Artifacts: approved UI_SPEC unchanged; single-unit render correction; zero-warning builds and cumulative regression; frozen hashes unchanged.
Open Blockers: BLOCKER-UIQA-001 remains pending owner UI_QA final execution confirmation; route is correction review, not next product gate.
Evidence: real pre-fix screenshot inspected, installed VCL source cause identified, UIQA001 build/regression logs.
Next Responsibility: Review only render correction and metrics. Return to UI_QA for actual stabilized integral screenshots, focus/pressed states and 144-DPI rendering; coordinator closes blocker only on owner validation. Production has no pending GUI approval request and makes no visual PASS claim.