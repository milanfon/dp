*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Login as Student
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    104
    Set Selenium Speed   0.5
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Should Be Visible    xpath://*[@id="header.title.userHome"]
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Be Visible    xpath://*[@id="header.student-view-nav"]
    Element Should Be Visible    xpath://*[@id="stu.view.title"]
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Login as Teacher
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    104
    Set Selenium Speed   0.5
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Should Be Visible    xpath://*[@id="header.title.userHome"]
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Be Visible    xpath://*[@id="header.teacher-view-nav"]
    Element Should Be Visible    xpath://*[@id="tea.view.title"]
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Invalid Login
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    104
    Set Selenium Speed   0.5
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Invalid Login
    Open Browser    http://localhost:4680/tbuis/index.jsp    Chrome
    Set Window Size    1501    104
    Set Selenium Speed   0.5
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser