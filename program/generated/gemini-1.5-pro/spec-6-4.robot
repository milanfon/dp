*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${STUDENT URL}     http://localhost:4680/tbuis/student-view/overview
${OTHER SUBJECTS URL}      http://localhost:4680/tbuis/student-view/otherSubjects
${MY SUBJECTS URL}      http://localhost:4680/tbuis/student-view/mySubjects
${TEACHER URL}     http://localhost:4680/tbuis/teacher-view/overview
${TEACHER MY SUBJECTS URL}     http://localhost:4680/tbuis/teacher-view/mySubjects

*** Test Cases ***
Enroll To Subject And Verify
    Open Browser    ${INDEX URL}    chrome
    Sleep    2s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    2s
    Wait Until Location Is    ${LOGIN URL}    timeout=10s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    maroon
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Submit Form    xpath://*[@id="loginPage.loginForm"]
    Sleep    2s
    Wait Until Location Is    ${STUDENT URL}    timeout=10s
    Click Link    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Wait Until Location Is    ${OTHER SUBJECTS URL}    timeout=10s
    Click Button    xpath://*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Wait Until Location Is    ${OTHER SUBJECTS URL}    timeout=10s
    Page Should Contain Element    xpath://*[@id="stu.otherSubjects.successAlert"]
    Sleep    2s
    Click Link    xpath://*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Wait Until Location Is    ${MY SUBJECTS URL}    timeout=10s
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Software Quality Assurance"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[text()="Peter Strict"]
    Sleep    2s
    Close Browser

Teacher Verifies Student Enrolment
    Open Browser    ${INDEX URL}    chrome
    Sleep    2s
    Click Link    xpath://*[@id="header.link.login"]
    Sleep    2s
    Wait Until Location Is    ${LOGIN URL}    timeout=10s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    strict
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Submit Form    xpath://*[@id="loginPage.loginForm"]
    Sleep    2s
    Wait Until Location Is    ${TEACHER URL}    timeout=10s
    Click Link    xpath://*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Wait Until Location Is    ${TEACHER MY SUBJECTS URL}    timeout=10s
    Page Should Contain Element    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"][text()="Students (2) "]
    Sleep    2s
    Click Button    xpath://*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Wait Until Location Is    ${TEACHER MY SUBJECTS URL}    timeout=10s
    Page Should Contain Element    xpath://td[text()="William Maroon"]
    Sleep    2s
    Close Browser

*** Keywords ***

*** Tasks *** 
