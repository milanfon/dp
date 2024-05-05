*** Settings ***
Library        SeleniumLibrary
Browser        Chrome

*** Variables ***
URL            http://localhost:4680/tbuis/index.jsp

*** Test Case: Teacher Scenario ***

@tags          teacher

@ teaSetup
SetUp          setup.py

@ Given     page is open
${URL}

@ And      login as teacher
[{"implicit_wait": 10}]
[{"delay": 1}]
Click          login
InputText      userNameInput          strict
InputText      passwordInput          pass
Click          loginFormSubmit

@ And      go to My Subjects page
Click          mySubjects

@ And      verify remove buttons are disabled before removing a subject
[{"xpath": "//button[contains(@aria-label, 'Remove') and not(@disabled)]"}]
Should          not exist

@ And      verify success alert appears after removing a subject
[{"xpath": "//div[contains(@id, 'tea.mySubjects.successAlert')]"}]
Should          exist

@ And      verify 'Operating Systems' is not present in My Exam Dates, New Exam Dates, Set Evaluation, Evaluation Table
[{"xpath": "//th[.='Operating Systems']"}]
Should          not exist

@ And      verify 'Operating Systems' is not present in Other's Subjects as a <td>
[{"xpath": "//td[.='Operating Systems']"}]
Should          not exist

@ And      verify 'Operating Systems' is not present in List of All Teachers in a <td> containing 'Operating Systems'
[{"xpath": "//tr[contains(@id, 'tea.listOfAllTeachers.table.teacherRow-5')]/td[.='Operating Systems']"}]
Should          not exist

@ And      close browser
ExitBrowser

*** Test Case: Student Scenario ***

@ tags          student

@ stuSetup
SetUp          setup.py

@ Given     page is open
${URL}

@ And      login as student
[{"implicit_wait": 10}]
[{"delay": 1}]
Click          login
InputText      userNameInput          orange
InputText      passwordInput          pass
Click          loginFormSubmit

@ And      go to Other Subjects page
Click          otherSubjects

@ And      verify 'Peter Strict' is not present in the same <tr> as 'Operating Systems'
[{"xpath": "//tr[./td[.='Operating Systems']]/td[.='Peter Strict']"}]
Should          not exist

@ And      close browser
ExitBrowser

*** Keywords ***

*** Functions ***

*** Classes ***

*** Suite Teardown ***
teardown.py