*** Settings ***
Library  SeleniumLibrary
Suite Setup  Open Browser  chrome
Suite Teardown  Close Browser

*** Variables ***
${DELAY}  1 second

*** Test Cases ***
Login as Teacher
    Open Browser  chrome
    Navigate  http://localhost:4680/tbuis/index.jsp
    Click  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click  xpath://*[@id="loginPage.loginFormSubmit"]
    Click  xpath://*[@id="tea.menu.otherSubjects"]
    Click  xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Wait Until Element Is Visible  xpath://*[@id="tea.otherSubjects.successAlert"]
    Click  xpath://*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains  Linear Algebra
    Element Should Contain  xpath://*[@id="tea.myExamDates.table.noRecords-2"]  No exam dates.
    Click  xpath://*[@id="tea.menu.newExamDates"]
    Element Should Contain  xpath://*[@option="Linear Algebra"]
    Click  xpath://*[@id="tea.menu.listOfAllTeachers"]
    Element Should Contain  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]  Linear Algebra
    Element Should Contain  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]  Alice Pedant
    Close Browser

Login as Student
    Open Browser  chrome
    Navigate  http://localhost:4680/tbuis/index.jsp
    Click  xpath://*[@id="header.link.login"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  yellow
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Click  xpath://*[@id="loginPage.loginFormSubmit"]
    Click  xpath://*[@id="stu.menu.otherSubjects"]
    Element Should Contain  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]  Linear Algebra
    Element Should Contain  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]  Alice Pedant
    Close Browser