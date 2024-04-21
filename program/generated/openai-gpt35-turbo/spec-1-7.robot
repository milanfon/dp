*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Login and Verify User Home
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Delay    2s
    Click Element    xpath    //*[@id="header.link.login"]
    Delay    2s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    brown
    Delay    2s
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    pass
    Delay    2s
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Delay    2s
    Element Should Not Be Visible    id    header.link.login
    Element Text Should Be    id    header.title.userHome    Noah Brown
    Element Should Be Visible    id    header.link.logout
    Element Should Exist    css    #header.student-view-nav
    Element Text Should Be    id    stu.view.title    Student's View
    Element Should Be Visible    id    overview.personalInfoForm
    Close Browser

Login as Teacher and Verify Teacher's View
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Delay    2s
    Click Element    xpath    //*[@id="header.link.login"]
    Delay    2s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    lazy
    Delay    2s
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    pass
    Delay    2s
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Delay    2s
    Element Should Not Be Visible    id    header.link.login
    Element Text Should Be    id    header.title.userHome    John Lazy
    Element Should Be Visible    id    header.link.logout
    Element Should Exist    css    #header.teacher-view-nav
    Element Text Should Be    id    tea.view.title    Teacher's View
    Element Should Be Visible    id    overview.personalInfoForm
    Close Browser

Login with Different Credentials and Verify Error Alert
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Delay    2s
    Click Element    xpath    //*[@id="header.link.login"]
    Delay    2s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    bla
    Delay    2s
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    pass
    Delay    2s
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    id    loginPage.errorAlert
    Close Browser

    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Delay    2s
    Click Element    xpath    //*[@id="header.link.login"]
    Delay    2s
    Input Text    xpath    //*[@id="loginPage.userNameInput"]    lazy
    Delay    2s
    Input Text    xpath    //*[@id="loginPage.passwordInput"]    bla
    Delay    2s
    Click Element    xpath    //*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    id    loginPage.errorAlert
    Close Browser