*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${DELAY}    2s

*** Test Cases ***
Student View Validation
    Open Chrome And Set Viewport
    Navigate To Login Page
    Student Login And Navigation
    Element Should Not Be Present    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Element Should Be Visible    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.student-view-nav
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Element Should Be Visible    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Teacher View Validation
    Open Chrome And Set Viewport
    Navigate To Login Page
    Teacher Login And Navigation
    Element Should Not Be Present    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Element Should Be Visible    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.teacher-view-nav
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Element Should Be Visible    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Failed Login Attempts
    Open Chrome And Set Viewport
    Navigate To Login Page
    Perform Failed Logins
    Close Browser

*** Keywords ***
Open Chrome And Set Viewport
    Open Browser    about:blank    ${BROWSER}
    Set Window Size    1501    1104
    Sleep    ${DELAY}

Navigate To Login Page
    Go To    http://localhost:4680/tbuis/index.jsp
    Sleep    ${DELAY}

Student Login And Navigation
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Teacher Login And Navigation
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

Perform Failed Logins
    ${users}=    Create List    bla    lazy
    ${passwords}=    Create List    pass    bla
    :FOR    ${user}    IN    @{users}
    \    FOR    ${password}    IN    @{passwords}
    \    Run Keyword If    '${user}' == 'bla' AND '${password}' == 'pass' OR '${user}' == 'lazy' AND '${password}' == 'bla'    Failed Login    ${user}    ${password}

Failed Login
    [Arguments]    ${username}    ${password}
    Reload Page
    Sleep    ${DELAY}
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath=//*[@id="loginPage.errorAlert"]