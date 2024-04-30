*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Login Page
    Open Browser    ${LOGIN URL}    chrome
    Maximize Browser Window
    Sleep    2s

Login
    [Arguments]    ${username}    ${password}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Sleep    1s
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Sleep    1s
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    2s

*** Test Cases ***
Student View Login
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Login    brown    pass
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Sleep    1s
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Sleep    1s
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Sleep    1s
    Page Should Contain Element    css=#header\\.student-view-nav
    Sleep    1s
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Sleep    1s
    Close Browser

Teacher View Login
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Login    lazy    pass
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Sleep    1s
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Sleep    1s
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Sleep    1s
    Page Should Contain Element    css=#header\\.teacher-view-nav
    Sleep    1s
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Sleep    1s
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Sleep    1s
    Close Browser

Invalid Login - Wrong Username
    Open Login Page
    Login    bla    pass
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Sleep    1s
    Close Browser

Invalid Login - Wrong Password
    Open Login Page
    Login    lazy    bla
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Sleep    1s
    Close Browser 
