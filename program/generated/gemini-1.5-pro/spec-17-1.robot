*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close All Browsers

*** Variables ***
${LOGIN URL}    http://localhost:4680/tbuis/login
${INDEX URL}    http://localhost:4680/tbuis/index.jsp
${TEACHER USERNAME}    pedant
${TEACHER PASSWORD}    pass
${STUDENT USERNAME}    yellow
${STUDENT PASSWORD}    pass

*** Keywords ***
Login As Teacher
    Go To    ${INDEX URL}
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${TEACHER USERNAME}
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${TEACHER PASSWORD}
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

Login As Student
    Go To    ${INDEX URL}
    Sleep    1s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${STUDENT USERNAME}
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${STUDENT PASSWORD}
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

*** Test Cases ***
Teacher Participates In Other Subject
    Open Browser    ${INDEX URL}    chrome
    Login As Teacher
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    1s
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    1s
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    1s
    Page Should Contain Element    xpath://*[contains(text(),'Linear Algebra')]
    Sleep    1s
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3]    text=Linear Algebra
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    text=Alice Pedant

Student Sees Teacher In Other Subjects
    Open Browser    ${INDEX URL}    chrome
    Login As Student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    1s
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    text=Linear Algebra
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    text=Alice Pedant 
