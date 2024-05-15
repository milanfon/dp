*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp
${STUDENT_VIEW}  http://localhost:4680/tbuis/student-view/overview
${TEACHER_VIEW}  http://localhost:4680/tbuis/teacher-view/overview

*** Test Cases ***
Login as Student
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Sleep    2s
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Sleep    2s
    Element Should Be Visible    css:#header.student-view-nav
    Sleep    2s
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Sleep    2s
    Close Browser

Login as Teacher
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Sleep    2s
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Sleep    2s
    Element Should Be Visible    css:#header.teacher-view-nav
    Sleep    2s
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]
    Sleep    2s
    Close Browser

Login with wrong username
    Open Browser    ${LOGIN URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    bla
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Sleep    2s
    Close Browser

Login with wrong password
    Open Browser    ${LOGIN URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    bla
    Sleep    2s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Sleep    2s
    Close Browser 
