*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    Chrome
${LOGIN_URL}    http://localhost:4680/tbuis/login
${STUDENT_VIEW_URL}    http://localhost:4680/tbuis/student-view/overview
${TEACHER_VIEW_URL}    http://localhost:4680/tbuis/teacher-view/overview

*** Test Cases ***
Student Login and Validation
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.student-view-nav
    Element Text Should Be    xpath=//*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Teacher Login and Validation
    Open Browser    http://localhost:4680/tbuis/index.jsp    ${BROWSER}
    Set Window Size    1501    1104
    Click Element    xpath=//*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Not Be Visible    xpath=//*[@id="header.link.login"]
    Element Text Should Be    xpath=//*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath=//*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.teacher-view-nav
    Element Text Should Be    xpath=//*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath=//*[@id="overview.personalInfoForm"]
    Close Browser

Failed Login Attempts
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    bla
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    Set Window Size    1501    1104
    Input Text    xpath=//*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath=//*[@id="loginPage.passwordInput"]    bla
    Click Element    xpath=//*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Page Should Contain Element    xpath=//*[@id="loginPage.errorAlert"]
    Close Browser