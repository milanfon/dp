*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  ${EMPTY}  Chrome
Suite Teardown  Close Browser

*** Test Cases ***
Login As Teacher
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Click  xpath://*[@id="header.link.login"]
    Click  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  strict
    Click  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click  xpath://*[@id="loginPage.loginFormSubmit"]
    Click  xpath://*[@id="tea.menu.mySubjects"]
    Sleep  1
    Click  xpath://*[@id="tea.mySubjects.table.unregisterSubjectButton-0"]
    Sleep  1
    Page Should Contain Element  xpath://*[@id="tea.mySubjects.successAlert"]
    Click  xpath://*[@id="tea.menu.myExamDates"]
    Sleep  1
    Element Should Not Contain  xpath://*[@id="tea.myExamDates.table"]  Operating Systems
    Click  xpath://*[@id="tea.menu.newExamDates"]
    Sleep  1
    Element Should Not Contain  xpath://*[@id="tea.newExamDates.table"]  Operating Systems
    Click  xpath://*[@id="tea.menu.setEvaluation"]
    Sleep  1
    Element Should Not Contain  xpath://*[@id="tea.setEvaluation.table"]  Operating Systems
    Click  xpath://*[@id="tea.menu.evaluationTable"]
    Sleep  1
    Element Should Not Contain  xpath://*[@id="tea.evaluationTable.table"]  Operating Systems
    Click  xpath://*[@id="tea.menu.otherSubjects"]
    Sleep  1
    Element Should Contain  xpath://*[@id="tea.otherSubjects.table"]  Operating Systems
    Click  xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep  1
    Element Should Not Contain  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-5"]  Operating Systems
    Close Browser

Login As Student
    Open Browser  http://localhost:4680/tbuis/index.jsp  Chrome
    Click  xpath://*[@id="header.link.login"]
    Click  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  orange
    Click  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click  xpath://*[@id="loginPage.loginFormSubmit"]
    Click  xpath://*[@id="stu.menu.otherSubjects"]
    Sleep  1
    Element Should Not Contain  xpath://*[@id="stu.otherSubjects.table"]  Peter Strict
    Close Browser