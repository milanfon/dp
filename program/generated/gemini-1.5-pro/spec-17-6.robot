*** Settings ***
Library           SeleniumLibrary
Test Setup        Open Browser    http://localhost:4680/tbuis/index.jsp   Chrome
Test Teardown     Close Browser

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${USERNAME INPUT}  xpath://*[@id="loginPage.userNameInput"]
${PASSWORD INPUT}  xpath://*[@id="loginPage.passwordInput"]
${LOGIN BUTTON}   xpath://*[@id="loginPage.loginFormSubmit"]

*** Keywords ***
Login As Teacher
    [Arguments]    ${username}    ${password}
    Click Link    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    ${USERNAME INPUT}
    Input Text    ${USERNAME INPUT}    ${username}
    Input Text    ${PASSWORD INPUT}    ${password}
    Click Button    ${LOGIN BUTTON}
    Wait Until Page Does Not Contain Element    ${LOGIN BUTTON}

Login As Student
    [Arguments]    ${username}    ${password}
    Click Link    xpath://*[@id="header.link.login"]
    Wait Until Page Contains Element    ${USERNAME INPUT}
    Input Text    ${USERNAME INPUT}    ${username}
    Input Text    ${PASSWORD INPUT}    ${password}
    Click Button    ${LOGIN BUTTON}
    Wait Until Page Does Not Contain Element    ${LOGIN BUTTON}

*** Test Cases ***
Teacher Participates In Subject
    Login As Teacher    pedant    pass
    Click Link    xpath://*[@id="tea.menu.otherSubjects"]
    Wait Until Page Contains Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Click Button    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Wait Until Page Contains Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Page Should Contain    No exam dates.
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Wait Until Page Contains Element    xpath://*[@id="tea.newExamDates.subjectSelect"]
    Page Should Contain Element    xpath://*[@id="tea.newExamDates.subjectSelect"]//option[text()="Linear Algebra"]
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Wait Until Page Contains Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    text=Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    text=Alice Pedant

Student Sees Teacher's Subject
    Login As Student    yellow    pass
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Wait Until Page Contains Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    text=Linear Algebra
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    text=Alice Pedant 
