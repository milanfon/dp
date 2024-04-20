*** Settings ***
Library           Selenium2Library

*** Variables ***
${BASE_URL}      http://localhost:4680/tbuis
${STUDENT_USERNAME}    brown
${STUDENT_PASSWORD}    pass
${TEACHER_USERNAME}    lazy
${TEACHER_PASSWORD}    pass
${INVALID_USERNAME}    bla
${INVALID_PASSWORD}    bla

*** Test Cases ***
Student Login
    Open Browser    ${BASE_URL}/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    id=header.link.login
    Input Text    id=loginPage.userNameInput    ${STUDENT_USERNAME}
    Input Text    id=loginPage.passwordInput    ${STUDENT_PASSWORD}
    Click Element    id=loginPage.loginFormSubmit
    Page Should Contain Element    id=header.title.userHome    Noah Brown
    Page Should Contain Element    id=header.link.logout
    Element Should Exist    css=#header.student-view-nav
    Element Should Contain    id=stu.view.title    Student's View
    Page Should Contain Element    id=overview.personalInfoForm

Teacher Login
    Open Browser    ${BASE_URL}/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    id=header.link.login
    Input Text    id=loginPage.userNameInput    ${TEACHER_USERNAME}
    Input Text    id=loginPage.passwordInput    ${TEACHER_PASSWORD}
    Click Element    id=loginPage.loginFormSubmit
    Page Should Contain Element    id=header.title.userHome    John Lazy
    Page Should Contain Element    id=header.link.logout
    Element Should Exist    css=#header.teacher-view-nav
    Element Should Contain    id=tea.view.title    Teacher's View
    Page Should Contain Element    id=overview.personalInfoForm

Invalid Logins
    Open Browser    ${BASE_URL}/index.jsp    chrome
    Set Window Size    1501    1104
    Click Element    id=header.link.login
    Input Text    id=loginPage.userNameInput    ${INVALID_USERNAME}
    Input Text    id=loginPage.passwordInput    ${INVALID_PASSWORD}
    Click Element    id=loginPage.loginFormSubmit
    Page Should Contain Element     id=loginPage.errorAlert

Invalid Logins Again
     Open Browser     ${BASE_URL}/index.jsp     chrome
     Set Window Size     1501     1104
     Click Element     id=header.link.login
     Input Text     id=loginPage.userNameInput     ${TEACHER_USERNAME}
     Input Text     id=loginPage.passwordInput     ${INVALID_PASSWORD}
     Click Element     id=loginPage.loginFormSubmit
     Page Should Contain Element     id=loginPage.errorAlert

*** Keywords ***