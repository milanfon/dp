*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${OTHER_SUBJECTS_URL}    http://localhost:4680/tbuis/student-view/otherSubjects
${MY_SUBJECTS_URL}    http://localhost:4680/tbuis/student-view/mySubjects
${TEACHER_OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${TEACHER_MY_SUBJECTS_URL}    http://localhost:4680/tbuis/teacher-view/mySubjects

*** Test Cases ***
Student Enrollment and Subject Verification
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    maroon
    Press Keys    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Press Key    xpath=//*[@id="loginPage.passwordInput"]    \\13
    Sleep    2s
    Click Element    xpath=//*[@id="stu.menu.otherSubjects"]
    Sleep    2s
    Click Element    xpath=//*[@id="stu.otherSubjects.table.enrollButton-10"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="stu.otherSubjects.successAlert"]
    Click Element    xpath=//*[@id="stu.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[1]    Software Quality Assurance
    Element Should Contain    xpath=//tr[@id="stu.mySubjects.enrolledTable.subjectRow-2"]/td[2]    Peter Strict
    Close Browser

Teacher Student List Verification
    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    strict
    Press Keys    xpath=//*[@id="loginPage.userNameInput"]    TAB
    Input Password    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Click Element    xpath=//*[@id="tea.menu.mySubjects"]
    Sleep    2s
    Element Should Contain    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]    Students (2)
    Click Element    xpath=//*[@id="tea.mySubjects.table.listOfStudentsButton-3"]
    Sleep    2s
    Page Should Contain Element    xpath=//td[contains(., "William Maroon")]
    Close Browser