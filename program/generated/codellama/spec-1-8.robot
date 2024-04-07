*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Scenario 1
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Be Visible    xpath://*[@id="header.student-view-nav"]
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    [Teardown]    Close Browser

Scenario 2
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Be Visible    xpath://*[@id="header.teacher-view-nav"]
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    [Teardown]    Close Browser

Scenario 3
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    [Teardown]    Close Browser

Scenario 4
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Click Element    xpath://*[@id="loginPage.passwordInput"]
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    [Teardown]    Close Browser