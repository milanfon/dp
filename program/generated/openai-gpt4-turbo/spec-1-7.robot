*** Settings ***
Library    SeleniumLibrary
Suite Setup    Open Browser    ${EMPTY}    Chrome
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${TEACHER_OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview

*** Test Cases ***
Student Login and Verification
    [Setup]    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Go To    ${URL}
    Wait Until Page Contains Element    xpath=//*[@id="header.link.login"]
    Sleep    2
    Click Element    xpath=//*[@id="header.link.login"]
    Go To    ${LOGIN_URL}
    Sleep    2
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Go To    ${STUDENT_OVERVIEW_URL}
    Sleep    2
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.student-view-nav
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    [Teardown]    Close Browser

Teacher Login and Verification
    [Setup]    Open Browser    ${URL}    Chrome
    Set Window Size    1501    1104
    Go To    ${URL}
    Wait Until Page Contains Element    xpath=//*[@id="header.link.login"]
    Sleep    2
    Click Element    xpath=//*[@id="header.link.login"]
    Go To    ${LOGIN_URL}
    Sleep    2
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    2
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Go To    ${TEACHER_OVERVIEW_URL}
    Sleep    2
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.teacher-view-nav
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    [Teardown]    Close Browser

Login Error Verification
    [Setup]    Open Browser    ${LOGIN_URL}    Chrome
    Set Window Size    1501    1104
    Go To    ${LOGIN_URL}
    Sleep    2
    ${Usernames}    Create List    bla    lazy
    ${Passwords}    Create List    pass    bla
    :FOR    ${username}    ${password}    IN ZIP    ${Usernames}    ${Passwords}
    \    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    \    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    \    Sleep    2
    \    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    \    Sleep    2
    \    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    [Teardown]    Close Browser