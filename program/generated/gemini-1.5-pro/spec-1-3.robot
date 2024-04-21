*** Settings ***
Library    SeleniumLibrary
Test Setup    Open Browser To Login Page
Test Teardown    Close Browser

*** Variables ***
${LOGIN_PAGE}    http://localhost:4680/tbuis/login
${INDEX_PAGE}    http://localhost:4680/tbuis/index.jsp

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_PAGE}    chrome
    Maximize Browser Window
    Set Selenium Speed    2s

Login With Credentials
    [Arguments]    ${username}    ${password}
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]


*** Test Cases ***
Student View Login
    Go To    ${INDEX_PAGE}
    Click Element    xpath://*[@id="header.link.login"]
    Login With Credentials    brown    pass
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    Noah Brown
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Be Visible    css=#header.student-view-nav
    Element Text Should Be    xpath://*[@id="stu.view.title"]    Student's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]

Teacher View Login
    Go To    ${INDEX_PAGE}
    Click Element    xpath://*[@id="header.link.login"]
    Login With Credentials    lazy    pass
    Element Should Not Be Visible    xpath://*[@id="header.link.login"]
    Element Text Should Be    xpath://*[@id="header.title.userHome"]    John Lazy
    Element Should Be Visible    xpath://*[@id="header.link.logout"]
    Element Should Be Visible    css=#header.teacher-view-nav
    Element Text Should Be    xpath://*[@id="tea.view.title"]    Teacher's View
    Element Should Be Visible    xpath://*[@id="overview.personalInfoForm"]

Invalid Username
    Go To    ${INDEX_PAGE}
    Click Element    xpath://*[@id="header.link.login"]
    Login With Credentials    bla    pass
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]

Invalid Password
    Go To    ${INDEX_PAGE}
    Click Element    xpath://*[@id="header.link.login"]
    Login With Credentials    lazy    bla
    Element Should Be Visible    xpath://*[@id="loginPage.errorAlert"]
