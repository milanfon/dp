*** Settings ***
Library           SeleniumLibrary
Documentation     Login test suite

*** Variables ***
${LOGIN URL}      http://localhost:4680/tbuis/login
${INDEX URL}      http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser And Login
    [Arguments]     ${username}    ${password}
    Open Browser    ${INDEX URL}    chrome
    Maximize Browser Window
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    2s
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Submit Form    xpath://*[@id="loginPage.loginForm"]
    Sleep    2s

*** Test Cases ***
Login as student
    Open Browser And Login    brown    pass
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.student-view-nav
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Sleep    2s
    Close Browser

Login as teacher
    Open Browser And Login    lazy    pass
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css=#header.teacher-view-nav
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Sleep    2s
    Close Browser

Invalid login 1
    Open Browser And Login    bla    pass
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Sleep    2s
    Close Browser

Invalid login 2
    Open Browser And Login    lazy    bla
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Sleep    2s
    Close Browser 
