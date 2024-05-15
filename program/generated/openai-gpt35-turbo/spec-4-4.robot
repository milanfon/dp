*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario 1: Student View
    Open Browser  ${URL}  chrome
    Set Viewport  1501  1104
    Click Element  xpath///*[@id="header.link.login"]
    Click Element  xpath///*[@id="loginPage.userNameInput"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  gray
    Press Keys  xpath///*[@id="loginPage.userNameInput"]  TAB
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Press Keys  xpath///*[@id="loginPage.passwordInput"]  ENTER
    Click Element  xpath///*[@id="stu.menu.mySubjects"]
    Click Element  xpath///*[@id="stu.mySubjects.enrolledTable.unenrollSubjectButton-1"]
    Click Element  xpath///*[@id="stu.mySubjects.unenrollSubjectModal.unenrollSubjectButton"]
    Close Browser

Scenario 2: Teacher View
    Open Browser  ${URL}  chrome
    Set Viewport  1501  1104
    Click Element  xpath///*[@id="header.link.login"]
    Click Element  xpath///*[@id="loginPage.userNameInput"]
    Input Text  xpath///*[@id="loginPage.userNameInput"]  pedant
    Press Keys  xpath///*[@id="loginPage.userNameInput"]  TAB
    Input Text  xpath///*[@id="loginPage.passwordInput"]  pass
    Press Keys  xpath///*[@id="loginPage.passwordInput"]  ENTER
    Click Element  xpath///*[@id="tea.menu.mySubjects"]
    Click Element  xpath///*[@id="tea.menu.myExamDates"]
    Click Element  xpath///*[@id="tea.menu.setEvaluation"]
    Click Element  xpath///*[@id="tea.setEvaluation.form.examTermDateSelect"]
    Input Text  xpath///*[@id="tea.setEvaluation.form.examTermDateSelect"]  35
    Click Element  xpath///*[@id="tea.menu.evaluationTable"]
    Click Element  xpath///*[@id="tea.evalTable.filter.subjectSelect"]
    Input Text  xpath///*[@id="tea.evalTable.filter.subjectSelect"]  3
    Click Element  xpath///*[@id="tea.evalTable.filter.submitButton"]
    Close Browser