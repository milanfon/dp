*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            http://localhost:4680/tbuis/index.jsp

*** Test Cases ***
Scenario 1
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    brown
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Not Visible    xpath://*[@id="header.link.login"]    timeout=10s
    Wait Until Element Is Visible    xpath://*[@id="header.title.userHome"]    timeout=10s
    Wait Until Element Is Visible    xpath://*[@id="header.link.logout"]    timeout=10s
    Wait Until Element Is Visible    css:#header.student-view-nav    timeout=10s
    Wait Until Element Contains    xpath://*[@id="stu.view.title"]    Student's View    timeout=10s
    Wait Until Element Is Visible    xpath://*[@id="overview.personalInfoForm"]    timeout=10s
    Close Browser

Scenario 2
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    lazy
    Input Text    xpath://*[@id="loginPage.passwordInput"]    pass
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Not Visible    xpath://*[@id="header.link.login"]    timeout=10s
    Wait Until Element Contains    xpath://*[@id="header.title.userHome"]    John Lazy    timeout=10s
    Wait Until Element Is Visible    xpath://*[@id="header.link.logout"]    timeout=10s
    Wait Until Element Is Visible    css:#header.teacher-view-nav    timeout=10s
    Wait Until Element Contains    xpath://*[@id="tea.view.title"]    Teacher's View    timeout=10s
    Wait Until Element Is Visible    xpath://*[@id="overview.personalInfoForm"]    timeout=10s
    Close Browser

Try Different Logins
    [Arguments]    ${username}    ${password}
    Open Browser    ${URL}    chrome
    Set Viewport    1501    1104
    Click Element    xpath://*[@id="header.link.login"]
    Input Text    xpath://*[@id="loginPage.userNameInput"]    ${username}
    Input Text    xpath://*[@id="loginPage.passwordInput"]    ${password}
    Click Element    xpath://*[@id="loginPage.loginFormSubmit"]
    Wait Until Element Is Visible    xpath://*[@id="loginPage.errorAlert"]    timeout=10s
    Close Browser

*** Test Cases ***
Test Case 1
    Try Different Logins    bla    pass

Test Case 2
    Try Different Logins    lazy    bla