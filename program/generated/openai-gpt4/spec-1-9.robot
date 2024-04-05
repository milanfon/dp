*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${BASE_URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_VIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${TEACHER_VIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${WIDTH}    1501
${HEIGHT}    1104
${LOGIN_ID}    xpath=//*[@id="header.link.login"]
${USER_HOME_ID}    xpath=//*[@id="header.title.userHome"]
${LOGOUT_ID}    xpath=//*[@id="header.link.logout"]
${STUDENT_NAV_CSS}    css=#header.student-view-nav
${TEACHER_NAV_CSS}    css=#header.teacher-view-nav
${USERNAME_INPUT}    xpath=//*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT}    xpath=//*[@id="loginPage.passwordInput"]
${LOGIN_SUBMIT}    xpath=//*[@id="loginPage.loginFormSubmit"]

*** Test Cases ***
Student View Scenario
    Open And Setup Browser
    Login    brown    pass
    Validate Student View

Teacher View Scenario
    Open And Setup Browser
    Login    lazy    pass
    Validate Teacher View

Invalid Login Scenario With Username Bla
    Open And Setup Browser
    Login    bla    pass
    Validate Failed Login

Invalid Login Scenario With Wrong Password
    Open And Setup Browser
    Login    lazy    bla
    Validate Failed Login

*** Keywords ***
Open And Setup Browser
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    ${WIDTH}    ${HEIGHT}

Login
    [Arguments]    ${username}    ${password}
    Wait Until Page Contains Element    ${LOGIN_ID}    timeout=10
    Click Element    ${LOGIN_ID}
    Sleep    1s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_SUBMIT}
    Sleep    3s    # Wait for navigation to complete

Validate Student View
    Page Should Not Contain Element    ${LOGIN_ID}
    Element Should Contain    ${USER_HOME_ID}    Noah Brown
    Page Should Contain Element    ${LOGOUT_ID}
    Wait Until Element Is Visible    ${STUDENT_NAV_CSS}    5s
    Close Browser

Validate Teacher View
    Page Should Not Contain Element    ${LOGIN_ID}
    Element Should Contain    ${USER_HOME_ID}    John Lazy
    Page Should Contain Element    ${LOGOUT_ID}
    Wait Until Element Is Visible    ${TEACHER_NAV_CSS}    5s
    Close Browser

Validate Failed Login
    Page Should Contain Element    ${LOGIN_ID}
    Close Browser
