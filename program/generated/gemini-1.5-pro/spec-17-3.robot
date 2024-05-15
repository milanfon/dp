*** Settings ***
Library           SeleniumLibrary
Documentation     This is an example test suite.

*** Variables ***
${BROWSER}        chrome
${DELAY}          500ms
${URL}            http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Login As Teacher
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    pedant
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Login As Student
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    yellow
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

*** Test Cases ***
Teacher Participate In Other Subjects
    [Documentation]    This test case verifies that a teacher can participate in other subjects and the subject is displayed correctly for students.
    Open Browser
    Login As Teacher
    Click Element    xpath://*[@id="tea.menu.otherSubjects"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.otherSubjects.table.participateButton-3"]
    Sleep    ${DELAY}
    Location Should Be    http://localhost:4680/tbuis/teacher-view/otherSubjects
    Page Should Contain Element    xpath://*[@id="tea.otherSubjects.successAlert"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.myExamDates"]
    Sleep    ${DELAY}
    Page Should Contain    Linear Algebra
    Page Should Contain Element    xpath://*[@id="tea.myExamDates.table.noRecords-2"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.newExamDates"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath://*[@id="tea.newExamDates.subjectSelect"]//option[text()="Linear Algebra"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="tea.menu.listOfAllTeachers"]
    Sleep    ${DELAY}
    Page Should Contain Element    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[3][contains(text(), "Linear Algebra")]
    Element Text Should Be    xpath=//*[@id="tea.listOfAllTeachers.table.teacherRow-3"]/td[2]    Alice Pedant
    Sleep    ${DELAY}
    Close Browser

Student View Other Subjects
    [Documentation]    This test case verifies that a student can view other subjects and the teacher is displayed correctly.
    Open Browser
    Login As Student
    Click Element    xpath://*[@id="stu.menu.otherSubjects"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[2]    Linear Algebra
    Element Text Should Be    xpath=//*[@id="stu.otherSubjects.table.subjectRow-2"]/td[3]    Alice Pedant
    Sleep    ${DELAY}
    Close Browser
