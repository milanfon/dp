*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${STUDENT_VIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${TEACHER_VIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview
${LOGIN_URL}           http://localhost:4680/tbuis/login
${BASE_URL}            http://localhost:4680/tbuis/index.jsp
${BROWSER}             chrome

*** Test Cases ***
Verify Student View After Login
    Open And Setup Browser
    Perform Login Steps    brown    pass
    Verify Student View Elements
    Close Browser

Verify Teacher View After Login
    Open And Setup Browser
    Perform Teacher Login Steps    lazy    pass
    Verify Teacher View Elements
    Close Browser

Attempt Invalid Logins
    Attempt Login With Invalid Credentials    bla    pass
    Attempt Login With Invalid Credentials    lazy    bla

*** Keywords ***
Open And Setup Browser
    Open Browser    ${BASE_URL}    ${BROWSER}
    Set Window Size    1501    1104

Perform Login Steps
    [Arguments]    ${username}    ${password}
    Navigate And Click    ${LOGIN_URL}    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Perform Teacher Login Steps
    [Arguments]    ${username}    ${password}
    Navigate And Click    ${LOGIN_URL}    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

Verify Student View Elements
    Element Should Not Be Visible    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.student-view-nav
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]

Verify Teacher View Elements
    Element Should Not Be Visible    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.teacher-view-nav
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]

Attempt Login With Invalid Credentials
    [Arguments]    ${username}    ${password}
    Open And Setup Browser
    Perform Login Steps    ${username}    ${password}
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser

Navigate And Click
    [Arguments]    ${url}    ${selector}
    Go To    ${url}
    Click Element    ${selector}
    Sleep    1s
