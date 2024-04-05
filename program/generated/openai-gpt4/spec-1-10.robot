*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${BASE_URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_ID}    xpath=//*[@id="header.link.login"]
${USER_HOME_ID}    xpath=//*[@id="header.title.userHome"]
${LOGOUT_ID}    xpath=//*[@id="header.link.logout"]
${STUDENT_NAV_CSS}    css=#header.student-view-nav
${TEACHER_NAV_CSS}    css=#header.teacher-view-nav
${USERNAME_INPUT}    xpath=//*[@id="loginPage.userNameInput"]
${PASSWORD_INPUT}    xpath=//*[@id="loginPage.passwordInput"]
${LOGIN_SUBMIT}    xpath=//*[@id="loginPage.loginFormSubmit"]
${ERROR_ALERT}    xpath=//*[@id="loginPage.errorAlert"]

*** Test Cases ***
Verify Student View Access
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Login    brown    pass
    Validate Presence    ${LOGOUT_ID}
    Validate Text    ${USER_HOME_ID}    Noah Brown
    Validate Element Exists    ${STUDENT_NAV_CSS}
    Close Browser

Verify Teacher View Access
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Login    lazy    pass
    Validate Presence    ${LOGOUT_ID}
    Validate Text    ${USER_HOME_ID}    John Lazy
    Validate Element Exists    ${TEACHER_NAV_CSS}
    Close Browser

Invalid Login With Username Bla
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Login    bla    pass
    Validate Visibility    ${ERROR_ALERT}
    Close Browser

Invalid Login With Password Bla
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Login    lazy    bla
    Validate Visibility    ${ERROR_ALERT}
    Close Browser

*** Keywords ***
Login
    [Arguments]    ${username}    ${password}
    Wait Until Element Is Visible    ${LOGIN_ID}    timeout=10s
    Click Element    ${LOGIN_ID}
    Sleep    1s
    Input Text    ${USERNAME_INPUT}    ${username}
    Input Text    ${PASSWORD_INPUT}    ${password}
    Click Element    ${LOGIN_SUBMIT}
    Sleep    3s

Validate Presence
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=5s

Validate Text
    [Arguments]    ${locator}    ${expected_text}
    Element Should Contain    ${locator}    ${expected_text}

Validate Element Exists
    [Arguments]    ${selector}
    Wait Until Element Is Visible    ${selector}    timeout=5s

Validate Visibility
    [Arguments]    ${locator}
    Element Should Be Visible    ${locator}
