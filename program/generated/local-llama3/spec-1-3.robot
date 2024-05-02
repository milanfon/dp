*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome

*** Test Cases ***
Scenario 1: Student View
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Set Browser Implicit Wait    10
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Should Contain    xpath://*[@id="header.title.userHome"]    Noah Brown
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Exist    xpath://*[@id="header.student-view-nav"]
    Element Should Contain    xpath://*[@id="stu.view.title"]    Student's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 2: Teacher View
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Set Browser Implicit Wait    10
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Should Contain    xpath://*[@id="header.title.userHome"]    John Lazy
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Exist    xpath://*[@id="header.teacher-view-nav"]
    Element Should Contain    xpath://*[@id="tea.view.title"]    Teacher's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 3: Invalid Login
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Set Browser Implicit Wait    10
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Set Browser Implicit Wait    10
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser