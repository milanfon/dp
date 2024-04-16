*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${delay}  1s

*** Test Cases ***
Scenario 1: Teacher view
    Open Browser  chrome
    Maximize Browser Window
    Set Viewport  1501  1104  1  false  false  false
    Navigate To  http://localhost:4680/tbuis/index.jsp
    Wait Until Page Contains Element  xpath://*[@id="header.link.login"]
    Click Element  xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  pedant
    Wait Until Page Contains Element  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Wait Until Page Contains Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element  xpath://*[@id="tea.menu.otherSubjects"]
    Click Element  xpath://*[@id="tea.menu.otherSubjects"]
    Wait Until Page Contains Element  xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Element  xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep  ${delay}
    Page Should Contain Element  xpath://*[@id="tea.otherSubjects.successAlert"]
    Click Element  xpath://*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains Element  xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Wait Until Page Contains Element  xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain Element  xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Click Element  xpath://*[@id="tea.menu.newExamDates"]
    Wait Until Page Contains Element  xpath://*[@id="tea.menu.newExamDates"]
    Page Should Contain Element  xpath://*[@id="tea.menu.newExamDates"]
    Page Should Contain Element  xpath://option[text()="Linear Algebra"]
    Click Element  xpath://*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Page Contains Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(),"Linear Algebra")]
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(),"Linear Algebra")]
    Page Should Contain Element  xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][text()="Alice Pedant"]
    Close Browser

Scenario 2: Student view
    Open Browser  chrome
    Maximize Browser Window
    Set Viewport  1501  1104  1  false  false  false
    Navigate To  http://localhost:4680/tbuis/index.jsp
    Wait Until Page Contains Element  xpath://*[@id="header.link.login"]
    Click Element  xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element  xpath://*[@id="loginPage.userNameInput"]
    Input Text  xpath://*[@id="loginPage.userNameInput"]  yellow
    Wait Until Page Contains Element  xpath://*[@id="loginPage.passwordInput"]
    Input Text  xpath://*[@id="loginPage.passwordInput"]  pass
    Wait Until Page Contains Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Click Element  xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element  xpath://*[@id="stu.menu.otherSubjects"]
    Click Element  xpath://*[@id="stu.menu.otherSubjects"]
    Wait Until Page Contains Element  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(),"Linear Algebra")]
    Page Should Contain Element  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(),"Linear Algebra")]
    Page Should Contain Element  xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(),"Alice Pedant")]
    Close Browser