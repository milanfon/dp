*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome

*** Test Cases ***
Perform Student Login and Validation
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Element Should Be Visible    xpath=//*[@id="header.link.logout"]
    Element Should Be Visible    css=#header.student-view-nav
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Element Should Be Visible    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Perform Teacher Login and Validation
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Sleep    1s
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Element Should Be Visible    xpath=//*[@id="header.link.logout"]
    Element Should Be Visible    css=#header.teacher-view-nav
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Element Should Be Visible    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Login Failure Test Cases
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser

    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath=//*[@id="loginPage.userNameInput"]
    Sleep    1s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Be Visible    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser