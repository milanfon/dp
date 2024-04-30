*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Login as Noah Brown
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    xpath    //*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath    //*[@id="loginPage.userNameInput"]
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath    //*[@id="header.title.userHome"]
    Wait Until Element Is Visible    xpath    //*[@id="header.link.logout"]
    Wait Until Element Is Visible    css    #header.student-view-nav
    Wait Until Element Is Visible    xpath    //*[@id="stu.view.title"]
    Wait Until Element Is Visible    xpath    //*[@id="overview.personalInfoForm"]
    Close Browser

Login as John Lazy
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    xpath    //*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath    //*[@id="loginPage.userNameInput"]
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath    //*[@id="header.title.userHome"]
    Wait Until Element Is Visible    xpath    //*[@id="header.link.logout"]
    Wait Until Element Is Visible    css    #header.teacher-view-nav
    Wait Until Element Is Visible    xpath    //*[@id="tea.view.title"]
    Wait Until Element Is Visible    xpath    //*[@id="overview.personalInfoForm"]
    Close Browser

Login with Invalid Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    Chrome
    Set Viewport    1501    1104
    Click Element    xpath    //*[@id="header.link.login"]
    Wait Until Element Is Visible    xpath    //*[@id="loginPage.userNameInput"]
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath    //*[@id="loginPage.errorAlert"]
    Close Browser

*** Test Cases ***
Try Login with Invalid Credentials - Username bla and Password pass
    Login with Invalid Credentials    bla    pass

Try Login with Invalid Credentials - Username lazy and Password bla
    Login with Invalid Credentials    lazy    bla