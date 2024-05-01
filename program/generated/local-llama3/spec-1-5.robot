*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
Suite Teardown    Close Browser

*** Variables ***
${DELAY}    1s

*** Test Cases ***
Scenario 1: Student Login
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Not Visible    xpath://*[@id="header.link.login"]    ${DELAY}
    Element Should Contain    xpath://*[@id="header.title.userHome"]    Noah Brown
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Be Visible    xpath://*[@id="header.student-view-nav"]
    Element Should Contain    xpath://*[@id="stu.view.title"]    Student's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 2: Teacher Login
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Not Visible    xpath://*[@id="header.link.login"]    ${DELAY}
    Element Should Contain    xpath://*[@id="header.title.userHome"]    John Lazy
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Be Visible    xpath://*[@id="header.teacher-view-nav"]
    Element Should Contain    xpath://*[@id="tea.view.title"]    Teacher's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 3: Invalid Login 1
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Scenario 4: Invalid Login 2
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser