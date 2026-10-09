QA REPORT

Task: TASK-20261009-161654
Owner: QA_FUNCTIONAL
Acceptance Criteria Tested: AC-01..AC-19, 19/19.
Passed: 19/19 acceptance criteria; 44 actual GUI display equality checks plus signed-zero/scientific assertions; 32/32 frozen regression tests.
Failed: 0.
Blocked: 0.
Regression: independently executed frozen RickCalculatorTests.exe C11; Discovered=32, Executed=32, Passed=32, Failed=0, Errors=0, process ExitCode=0. Also repeated GUI scenario 2+3=== produced 11 at end of all QA scenarios.
Open Defects: none.
Result: PASS

Setup and evidence

Sources: approved task PRODUCT_BRIEF, REQUIREMENTS, ACCEPTANCE_CRITERIA, predecessor CODE_REVIEWER_REVIEW; actual production View/controller/domain; immutable regression executable. No Build Specs read. No production, requirements, frozen tests, or registry edited.

Isolated harness evidence/qa-functional/FunctionalQA.dpr and .dproj compiles actual production sources, shows real TCalculatorMainForm, clicks enabled production buttons through TButton.Click, pumps window messages, and reads actual display label. No mocking or numeric injection for GUI scenarios. The root obtained required GUI execution authorization and reports process ExitCode=0. QA reviewed actual complete execution.log ending PASS checks=44. build.log proves full Delphi compilation with 0 warnings/0 errors. GUI check assertions compare Unicode display strings before console serialization; console encoding renders the accented character in the numeric error imperfectly when read as UTF-8, but exact in-process message equality passed. Original raw log retained.

Action notation: C=Limpar tudo, E=CE/Limpar entrada, B=Backspace/Apagar último caractere, S=±/Alternar sinal. Each action starting C sets clean independent setup; otherwise it continues immediately preceding subscenario. Natural overflow setup is C1 then repeating += until real Math exceeds finite Double; observed at doubling 1025 in all four independent runs. No artificial overflow object or changed floating point exception masks.

AC | Setup | Action | Observed Result | Expected Result | Result | Evidence
AC-01 | clean entry | comma, comma | 0, then 0, | 0,; duplicate ignored | PASS | execution.log AC01a,b
AC-02 | clean entry | 123456789012345 then 6 | 123456789012345 unchanged | 15 significant digits accepted; extra ignored | PASS | AC02a,b
AC-03 | independent clean runs | 2+3=; 2+3+4= | 5; 9 | 5; 9 | PASS | AC03a,b
AC-04 | clean entry | 2++3= | 5 | 5, consecutive + ignored | PASS | AC04
AC-05 | clean entry | 2+3=== | 5,8,11 | 5,8,11 | PASS | AC05a,b,c
AC-06 | clean entry | 5+== | 10,15 | 10,15 | PASS | AC06a,b
AC-07 | clean entry | 5= | 5 | 5 | PASS | AC07
AC-08 | independent clean runs | 2+3=7; 2+3=+4= | 7;9 | new entry7; continued sum9 | PASS | AC08a,b
AC-09 | input, pending sum, result, real overflow | 12C=;2+C=;2+3=C=;error then C= | 0 in all four cases | 0 without stale operation or repetition | PASS | AC09entry,pending,result,error
AC-10 | independent clean runs | 8+2E=;8+E= | 8;8 | explicit zero second operand preserving pending sum | PASS | AC10a,b
AC-11 | result of 2+3= | E,=,7 | 0,0,7 | CE cancels repetition; digit creates new entry | PASS | AC11a,b,c
AC-12 | clean entry 1,2 | B,B,B | 1, then1 then0 | 1,;1;0 | PASS | AC12a,b,c
AC-13 | result of 2+3= | B then71B | 5 then7 | ignore result Backspace; edit new entry | PASS | AC13a,b
AC-14 | independent clean runs | S;5+S2=;12SS | -0;3;12 | negative zero; negative second operand; double toggle restores | PASS | AC14a,b,c
AC-15 | clean entry | 2+3= S = | 5,-5,-2 | preserve repeated second operand3 | PASS | AC15a,b,c
AC-16 | natural Double overflow setup | repeated += | exact Resultado fora da faixa numérica. | exact required error message and error state | PASS | natural overflow lines; AC16; disabled commands and recovery AC17 corroborate error state
AC-17 | natural overflow, independent for each recovery | EBS+=; C;7;comma | unchanged error;0;7;0, | unavailable commands preserve error; respective recoveries | PASS | AC17ignored,clear,digit,comma; real disabled production buttons prevent clicks
AC-18 | independent clean decimal and cancellation runs; internal signed zero formatter probe | 1,20+2,30=;1+S1=;negative IEEE zero to production formatter | 3,5;0;0 | insignificant zero removal, zero normalization | PASS | AC18decimal,zero; signed internal zero line and assertion
AC-19 | clean precision operands; independent clean seed1 | 0,123456789012345+0,123456789012345=;100 repetitions of += | 0,24691357802469;1,26765060022822E30 | natural Double, <=15 significant digits; scientific notation with comma when necessary | PASS | AC19precision/scientific; immutable regression Format_ScientificAndPrecision and Format_NormalizesSignedZero

Evidence paths relative to task root: evidence/qa-functional/build.log, execution.log, regression.log, FunctionalQA.dpr, FunctionalQA.dproj. Existing regression tests complement exact GUI scenarios, including finite-overflow exception and engine error-state guards. Natural GUI overflow independently confirms actual production composition. NFR-01 source/control catalog contains only addition and editing controls; UI_QA owns visual/keyboard/accessibility/DPI validation. NFR-02 satisfied by authorized sources and runtime artifacts. This report asserts functional correctness, not visual or release approval.

RESOLUTION

Blocker ID: BLOCKER-QA-GUI-001
Resolved By: FLOW_COORDINATOR / authorized GUI execution; QA_FUNCTIONAL evidence validation
Evidence: actual evidence/qa-functional/execution.log; root reports approved run process ExitCode=0; all 44 equality checks and additional assertions PASS.
Decision: required GUI execution completed; blocker closed. All AC functional scenarios now evaluated against immutable expected results.
Artifacts Updated: QA_FUNCTIONAL_REPORT.md; previous blocked report preserved as QA_FUNCTIONAL_REPORT_BLOCKED_HISTORY.md.
Impact: no production/spec/test change; functional gate PASS.
Return To: QA_FUNCTIONAL then UI_QA
Status: RESOLVED

HANDOFF

From: QA_FUNCTIONAL
To: UI_QA
Current Task: TASK-20261009-161654
Status: PASS
Approved Artifacts: QA_FUNCTIONAL_REPORT.md; isolated GUI harness and actual execution/build logs; independent frozen regression execution log.
Open Blockers: none; BLOCKER-QA-GUI-001 RESOLVED.
Evidence: evidence/qa-functional/execution.log (44 equality checks, additional assertions PASS); regression.log (32/32 PASS); build.log (0 warnings/0 errors).
Next Responsibility: UI_QA evaluate product against UI_SPEC with real UI evidence, including its visual/keyboard/accessibility/DPI responsibilities. FLOW_COORDINATOR alone transitions registry.