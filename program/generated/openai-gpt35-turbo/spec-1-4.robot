*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Open Page and Verify Elements - Student View
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome"]    No Error    Noah Brown
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.student-view-nav
    Page Should Contain Element    xpath://*[@id="stu.view.title"]    Student's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Open Page and Verify Elements - Teacher View
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Not Contain Element    xpath://*[@id="header.link.login"]
    Page Should Contain Element    xpath://*[@id="header.title.userHome"]    No Error    John Lazy
    Page Should Contain Element    xpath://*[@id="header.link.logout"]
    Page Should Contain Element    css:#header.teacher-view-nav
    Page Should Contain Element    xpath://*[@id="tea.view.title"]    Teacher's View
    Page Should Contain Element    xpath://*[@id="overview.personalInfoForm"]
    Close Browser

Verify Login with Invalid Credentials
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Page Should Contain Element    xpath://*[@id="loginPage.errorAlert"]
    Close Browser

Login with Invalid Credentials
    Verify Login with Invalid Credentials    bla    pass

Login with Invalid Credentials
    Verify Login with Invalid Credentials    lazy    bla