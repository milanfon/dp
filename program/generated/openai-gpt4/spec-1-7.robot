*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close All Browsers

*** Variables ***
${URL}    http://localhost:4680/tbuis/index.jsp
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_OVERVIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${TEACHER_OVERVIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview

*** Test Cases ***
Verify Student View
    Open And Setup Browser
    Navigate To URL    ${URL}
    Login    brown    pass
    Verify Student View Elements

Verify Teacher View
    Open And Setup Browser
    Navigate To URL    ${URL}
    Login    lazy    pass
    Verify Teacher View Elements

Invalid Login Attempts
    Invalid Login    bla    pass
    Invalid Login    lazy    bla

*** Keywords ***
Open And Setup Browser
    Open Browser    about:blank    chrome
    Set Window Size    1501    1104

Navigate To URL
    [Arguments]    ${url}
    Go To    ${url}
    Sleep    2s

Login
    [Arguments]    ${username}    ${password}
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    3s

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

Invalid Login
    [Arguments]    ${username}    ${password}
    Open And Setup Browser
    Navigate To URL    ${LOGIN_URL}
    Login    ${username}    ${password}
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser