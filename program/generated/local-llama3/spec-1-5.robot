*** Settings ***
Library           SeleniumLibrary
Suite Teardown     Close All Browsers

*** Test Cases ***
Scenario 1
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Sleep    1
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Should Contain    xpath://*[@id="header.title.userHome"]    Noah Brown
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Exist    xpath://*[@id="header.student-view-nav"]
    Element Should Contain    xpath://*[@id="stu.view.title"]    Student's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 2
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    1
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Should Contain    xpath://*[@id="header.title.userHome"]    John Lazy
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Exist    xpath://*[@id="header.teacher-view-nav"]
    Element Should Contain    xpath://*[@id="tea.view.title"]    Teacher's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 3
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Sleep    1
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    1
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Scenario 4
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    1
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Sleep    1
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser