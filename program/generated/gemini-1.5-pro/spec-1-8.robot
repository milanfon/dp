*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser And Maximize
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window

Login With Credentials
    [Arguments]    ${username}    ${password}
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    1s

*** Test Cases ***
Login As Student
    Open Browser And Maximize
    Login With Credentials    brown    pass
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Login As Teacher
    Open Browser And Maximize
    Login With Credentials    lazy    pass
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Login With Wrong Username
    Open Browser And Maximize
    Login With Credentials    bla    pass
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Login With Wrong Password
    Open Browser And Maximize
    Login With Credentials    lazy    bla
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser 
