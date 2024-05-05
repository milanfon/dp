*** Settings ***
Library    SeleniumLibrary    plugins=SeleniumLibrary.SeleniumLibrary.SeleniumLibrary


*** Variables ***
${BROWSER}    Chrome
${LOGIN_URL}    http://localhost:4680/tbuis/login
${URL}    http://localhost:4680/tbuis/

*** Test Cases ***
Teacher Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    pedant
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    ${URL}    Set Variable    ${URL}teacher-view/overview
    Wait Until Page Contains Element    id:tea.menu.otherSubjects
    Click Element    id:tea.menu.otherSubjects
    Click Element    id:tea.otherSubjects.table.participateButton-3
    Wait Until Page Contains Element    id:tea.otherSubjects.successAlert
    Page Should Contain Element    id:tea.otherSubjects.successAlert
    Click Element    id:tea.menu.myExamDates
    Wait Until Page Contains    Linear Algebra
    Page Should Contain Element    id:tea.myExamDates.table.noRecords-2
    Click Element    id:tea.menu.newExamDates
    Wait Until Page Contains Element    id:tea.newExamDates.table.newExamDates
    Page Should Contain Element    id:tea.newExamDates.table.newExamDates
    Click Element    id:tea.menu.listOfAllTeachers
    Wait Until Page Contains Element    id:tea.listOfAllTeachers.table.teacherRow-3
    Element Text Should Be    id:tea.listOfAllTeachers.table.teacherRow-3    Linear Algebra
    Element Text Should Be    id:tea.listOfAllTeachers.table.teacherRow-3    Alice Pedant
    Close All Browsers

Student Test
    Open Browser    ${URL}    ${BROWSER}
    Input Text    id:loginPage.userNameInput    yellow
    Input Text    id:loginPage.passwordInput    pass
    Click Button    id:loginPage.loginFormSubmit
    ${URL}    Set Variable    ${URL}student-view/overview
    Wait Until Page Contains Element    id:stu.menu.otherSubjects
    Click Element    id:stu.menu.otherSubjects
    Wait Until Page Contains Element    id:stu.otherSubjects.table.subjectRow-2
    Element Text Should Be    id:stu.otherSubjects.table.subjectRow-2    Linear Algebra
    Element Text Should Be    id:stu.otherSubjects.table.subjectRow-2    Alice Pedant
    Close All Browsers