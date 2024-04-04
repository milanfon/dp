*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Scenario 1
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Page Contains    University information system
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Student's View
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Should Have Inner Html    xpath://*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    xpath://*[@id="header.student-view-nav"]
    Element Should Contain    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    [Teardown]    Close Browser

Scenario 2
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Page Contains    University information system
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Teacher's View
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Should Have Inner Html    xpath://*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    xpath://*[@id="header.teacher-view-nav"]
    Element Should Contain    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    [Teardown]    Close Browser

Scenario 3
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Page Contains    University information system
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Login Page
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    [Teardown]    Close Browser

Scenario 4
    [Setup]    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Wait Until Page Contains    University information system
    Click Element    xpath://*[@id="header.link.login"]
    Wait Until Page Contains    Login Page
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Page Contains    Login Page
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    [Teardown]    Close Browser