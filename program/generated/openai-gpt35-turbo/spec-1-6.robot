*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Login with User Noah Brown
    Open Browser    ${URL}    chrome
    Set Viewport    width=1501    height=1104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="header.title.userHome" and contains(., 'Noah Brown')]
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header\.student-view-nav
    Page Should Contain Element    xpath=//*[@id="stu.view.title" and contains(., "Student's View")]
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Login with User John Lazy
    Open Browser    ${URL}    chrome
    Set Viewport    width=1501    height=1104
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains Element    xpath=//*[@id="header.title.userHome" and contains(., 'John Lazy')]
    Page Should Not Contain Element    xpath=//*[@id="header.link.login"]
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header\.teacher-view-nav
    Page Should Contain Element    xpath=//*[@id="tea.view.title" and contains(., "Teacher's View")]
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Login with Invalid Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Click Element    xpath=//*[@id="header.link.login"]
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser

*** Test Cases ***
Attempt Login with Invalid Credentials
    Login with Invalid Credentials    bla    pass
    Login with Invalid Credentials    lazy    bla