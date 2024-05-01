*** Settings ***
Library           SeleniumLibrary
Suite Teardown    Close Browser

*** Variables ***
${BROWSER}    Chrome
${DELAY}    1s

*** Test Cases ***
Scenario 1
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Should Contain    xpath://*[@id="header.title.userHome"]    Noah Brown
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Exist    xpath://*[@id="header.student-view-nav"]
    Element Should Contain    xpath://*[@id="stu.view.title"]    Student's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 2
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Should Contain    xpath://*[@id="header.title.userHome"]    John Lazy
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Exist    xpath://*[@id="header.teacher-view-nav"]
    Element Should Contain    xpath://*[@id="tea.view.title"]    Teacher's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Scenario 3
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Scenario 4
    Open Browser    ${BROWSER}    http://localhost:4680/tbuis/index.jsp
    Click Element    xpath://*[@id="header.link.login"]
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser