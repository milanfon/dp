*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${url}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Spec 1
    Open Browser    ${url}    Chrome
    Set Viewport    1501    1104
    Delay           1s
    Click Element    xpath    //*[@id="header.link.login"]
    Delay           2s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Delay           2s
    Element Should Not Be Visible    id    header.link.login
    Element Text Should Be    id    header.title.userHome    Noah Brown
    Element Should Be Visible    id    header.link.logout
    Element Should Be Visible    css    #header.student-view-nav
    Element Text Should Be    id    stu.view.title    Student's View
    Element Should Be Visible    id    overview.personalInfoForm
    Close Browser

Spec 1 Teacher
    Open Browser    ${url}    Chrome
    Set Viewport    1501    1104
    Delay           1s
    Click Element    xpath    //*[@id="header.link.login"]
    Delay           2s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Delay           2s
    Element Should Not Be Visible    id    header.link.login
    Element Text Should Be    id    header.title.userHome    John Lazy
    Element Should Be Visible    id    header.link.logout
    Element Should Be Visible    css    #header.teacher-view-nav
    Element Text Should Be    id    tea.view.title    Teacher's View
    Element Should Be Visible    id    overview.personalInfoForm
    Close Browser

Login with Wrong Credentials
    Open Browser    ${url}    Chrome
    Set Viewport    1501    1104
    Delay           1s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    id    loginPage.errorAlert
    Close Browser

Login with Different Wrong Credentials
    Open Browser    ${url}    Chrome
    Set Viewport    1501    1104
    Delay           1s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    id    loginPage.errorAlert
    Close Browser