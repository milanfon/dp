*** Settings ***
Library           SeleniumLibrary
Documentation     Login Tests

*** Variables ***
${DELAY}         500ms

*** Keywords ***
Open Browser And Login
    [Arguments]     ${username}    ${password}
    Open Browser    http://localhost:4680/tbuis/index.jsp    chrome
    Maximize Browser Window
    Click Element    xpath://*[@id="header.link.login"]
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.userNameInput"]
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Sleep    ${DELAY}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Sleep    ${DELAY}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Sleep    ${DELAY}

*** Test Cases ***
Student Login
    Open Browser And Login    brown    pass
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Teacher Login
    Open Browser And Login    lazy    pass
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Invalid Username
    Open Browser And Login    bla    pass
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Invalid Password
    Open Browser And Login    lazy    bla
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
    Close Browser
