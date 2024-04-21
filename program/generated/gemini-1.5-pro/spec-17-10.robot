*** Settings ***
Library           SeleniumLibrary
Test Teardown     Close Browser

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${TEACHER}        pedant
${STUDENT}        yellow
${PASSWORD}        pass

*** Keywords ***
Login As Teacher
    Go To      ${LOGIN URL}
    Sleep      2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER}
    Sleep      1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep      1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep      5s

Login As Student
    Go To      ${LOGIN URL}
    Sleep      2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${STUDENT}
    Sleep      1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${PASSWORD}
    Sleep      1s
    Click Button    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep      5s

*** Test Cases ***
Teacher Participates In Subject
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Login As Teacher
    Click Link    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep      2s
    Click Button    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep      2s
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Sleep      2s
    Click Link    xpath://*[@id="tea.menu.myExamDates"]
    Sleep      2s
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Sleep      2s
    Click Link    xpath://*[@id="tea.menu.newExamDates"]
    Sleep      2s
    Page Should Contain Element    xpath://*[@id="tea.newExamDates.subjectSelect"]//option[contains(text(), 'Linear Algebra')]
    Sleep      2s
    Click Link    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep      2s
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2][contains(text(), 'Alice Pedant')]
    Sleep      2s
    
Student Sees Teacher In Subject
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Login As Student
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep      2s
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2][contains(text(), 'Linear Algebra')]
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3][contains(text(), 'Alice Pedant')]
    Sleep      2s 
