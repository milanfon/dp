*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${DELAY}    2

*** Test Cases ***
Student Login
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Sleep    ${DELAY}
    Element Should Be Visible    css=#header.student-view-nav
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Sleep    ${DELAY}
    
Teacher Login
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Sleep    ${DELAY}
    Element Should Be Visible    css=#header.teacher-view-nav
    Sleep    ${DELAY}
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Sleep    ${DELAY}

Wrong Username
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Sleep    ${DELAY}

Wrong Password
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Sleep    ${DELAY}
