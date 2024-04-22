*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${DELAY}          2s

*** Test Cases ***
Open Page and Check Student's View
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]    timeout=10s
    Wait Until Page Contains Element    xpath://*[@id="header.title.userHome"]    timeout=10s
    Wait Until Page Contains Element    xpath://*[@id="header.link.logout"]    timeout=10s
    Wait Until Page Contains Element    css:#header.student-view-nav    timeout=10s
    Wait Until Page Contains Element    xpath://*[@id="stu.view.title" and text()="Student's View"]    timeout=10s
    Wait Until Page Contains Element    xpath://*[@id="overview.personalInfoForm"]    timeout=10s
    Close Browser

Open Page and Check Teacher's View
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Wait Until Page Contains Element    xpath://*[@id="header.link.login"]    timeout=10s
    Wait Until Page Contains Element    xpath://*[@id="header.title.userHome" and text()="John Lazy"]    timeout=10s
    Wait Until Page Contains Element    xpath://*[@id="header.link.logout"]    timeout=10s
    Wait Until Page Contains Element    css:#header.teacher-view-nav    timeout=10s
    Wait Until Page Contains Element    xpath://*[@id="tea.view.title" and text()="Teacher's View"]    timeout=10s
    Wait Until Page Contains Element    xpath://*[@id="overview.personalInfoForm"]    timeout=10s
    Close Browser

Login with Invalid Credentials
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Password    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath://*[@id="loginPage.errorAlert"]    timeout=10s
    Close Browser

    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Set Viewport    1501    1104
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Password    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath://*[@id="loginPage.errorAlert"]    timeout=10s
    Close Browser