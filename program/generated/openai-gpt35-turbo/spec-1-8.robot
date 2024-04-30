*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Spec 1
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome" and contains(text(), "Noah Brown")]
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    Page Should Contain    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Spec 1 Teacher
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome" and contains(text(), "John Lazy")]
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    Page Should Contain    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Login with Different Credentials
    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

    Open Browser    ${url}    chrome
    Set Viewport    1501    1104
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser